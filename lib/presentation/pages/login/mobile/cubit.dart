import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/form_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class LoginMobileCubit extends Cubit<LoginMobileState> {
  LoginMobileCubit({
    required AuthServiceImpl authService,
  })  : _authService = authService,
        super(const LoginMobileFormState());

  final AuthServiceImpl _authService;

  Future<void> load() async {}

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final LoginMobileFormState oldState = state as LoginMobileFormState;

    emit(const LoginMobileLoading());

    final Either<Failure, UserModel> userRes =
        await _authService.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userRes.isLeft()) {
      emit(LoginMobileFailure(
        message: userRes.asLeft().message,
      ));

      emit(oldState.copyWith(
        emailErr: true,
      ));

      return;
    }

    emit(LoginMobileSuccess());
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginMobileLoading());

    final Either<Failure, UserModel> userRes =
        await _authService.loginWithGoogle();

    if (userRes.isLeft()) {
      emit(LoginMobileFailure(
        message: userRes.asLeft().message,
      ));

      return;
    }

    emit(LoginMobileSuccess());
  }

  void checkEmail(String email) {
    if (!FormValidator.validateEmail(email)) {
      if (state is LoginMobileFormState) {
        emit((state as LoginMobileFormState).copyWith(
          email: email,
          emailErr: true,
        ));

        return;
      }
      emit(LoginMobileFormState(
        email: email,
        emailErr: true,
      ));
    }
    if (state is LoginMobileFormState) {
      emit((state as LoginMobileFormState).copyWith(
        email: email,
        emailErr: false,
      ));

      return;
    }
    emit(LoginMobileFormState(
      email: email,
      emailErr: false,
    ));
  }

  void checkPassword(String password) {
    final RegExp numericRegex = RegExp(r'[0-9]');

    bool isPasswordEightCharacters = false;
    if (password.length >= 8) isPasswordEightCharacters = true;

    bool hasPasswordOneNumber = false;
    if (numericRegex.hasMatch(password)) hasPasswordOneNumber = true;

    if (state is LoginMobileFormState) {
      emit((state as LoginMobileFormState).copyWith(
        password: password,
        hasPasswordOneNumber: hasPasswordOneNumber,
        isPasswordEightCharacters: isPasswordEightCharacters,
      ));

      return;
    }
    emit(LoginMobileFormState(
      password: password,
      hasPasswordOneNumber: hasPasswordOneNumber,
      isPasswordEightCharacters: isPasswordEightCharacters,
    ));
  }

  void toggleVisible() {
    emit(
      (state as LoginMobileFormState).copyWith(
        isVisible: !(state as LoginMobileFormState).isVisible,
      ),
    );
  }
}

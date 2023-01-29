import 'package:flutter/foundation.dart';
import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/form_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class RegisterMobileCubit extends Cubit<RegisterMobileState> {
  RegisterMobileCubit({
    required AuthServiceImpl authService,
  })  : _authService = authService,
        super(const RegisterMobileFormState());

  final AuthServiceImpl _authService;

  Future<void> load() async {}

  Future<void> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    Uint8List? profilePicture,
  }) async {
    final RegisterMobileFormState oldState = state as RegisterMobileFormState;

    emit(const RegisterMobileLoading());

    final Either<Failure, UserModel> userRes =
        await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      profilePicture: profilePicture,
    );

    if (userRes.isLeft()) {
      emit(RegisterMobileFailure(
        message: userRes.asLeft().message,
      ));

      emit(oldState.copyWith(
        emailErr: true,
      ));

      return;
    }

    emit(RegisterMobileSuccess());
  }

  Future<void> loginWithGoogle() async {
    emit(const RegisterMobileLoading());

    final Either<Failure, UserModel> userRes =
        await _authService.loginWithGoogle();

    if (userRes.isLeft()) {
      emit(RegisterMobileFailure(
        message: userRes.asLeft().message,
      ));

      return;
    }

    emit(RegisterMobileSuccess());
  }

  void checkEmail(String email) {
    if (!FormValidator.validateEmail(email)) {
      if (state is RegisterMobileFormState) {
        emit((state as RegisterMobileFormState).copyWith(
          email: email,
          emailErr: true,
        ));

        return;
      }
      emit(RegisterMobileFormState(
        email: email,
        emailErr: true,
      ));
    }
    if (state is RegisterMobileFormState) {
      emit((state as RegisterMobileFormState).copyWith(
        email: email,
        emailErr: false,
      ));

      return;
    }
    emit(RegisterMobileFormState(
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

    if (state is RegisterMobileFormState) {
      emit((state as RegisterMobileFormState).copyWith(
        password: password,
        hasPasswordOneNumber: hasPasswordOneNumber,
        isPasswordEightCharacters: isPasswordEightCharacters,
      ));

      return;
    }
    emit(RegisterMobileFormState(
      password: password,
      hasPasswordOneNumber: hasPasswordOneNumber,
      isPasswordEightCharacters: isPasswordEightCharacters,
    ));
  }

  void checkName(String name) {
    if (state is RegisterMobileFormState) {
      emit((state as RegisterMobileFormState).copyWith(
        name: name.trim(),
      ));

      return;
    }
    emit(RegisterMobileFormState(
      name: name.trim(),
    ));
  }

  void toggleVisible() {
    emit(
      (state as RegisterMobileFormState).copyWith(
        isVisible: !(state as RegisterMobileFormState).isVisible,
      ),
    );
  }
}

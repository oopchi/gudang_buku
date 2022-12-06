import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LocalStorage localStorage,
  })  : _localStorage = localStorage,
        super(const AuthLoading()) {
    authStream.listen(authenticate);
  }
  final Stream<User?> authStream = FirebaseAuth.instance.authStateChanges();

  final LocalStorage _localStorage;

  Future<void> authenticate(User? user) async {
    if (user == null) {
      await _localStorage.delete(LocalStoragePath.user, 0);
      emit(const AuthSignedOut());
      return;
    }

    final UserModel userModel = UserModel.from(user);

    await _localStorage.overwrite(LocalStoragePath.user, userModel);

    emit(AuthSignedIn(userModel: userModel));
  }
}

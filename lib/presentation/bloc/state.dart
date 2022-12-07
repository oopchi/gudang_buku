import 'package:bookstore/config/router/router.dart';
import 'package:bookstore/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

class AuthState extends Equatable {
  const AuthState();

  AuthState init() {
    return const AuthState();
  }

  AuthState clone() {
    return const AuthState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthFailure extends AuthState {
  const AuthFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class AuthSignedIn extends AuthState {
  const AuthSignedIn({
    required this.userModel,
  });

  final UserModel userModel;

  @override
  List<Object?> get props => <Object?>[
        userModel,
      ];
}

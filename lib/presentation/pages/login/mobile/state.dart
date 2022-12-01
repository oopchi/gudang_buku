import 'package:equatable/equatable.dart';

class LoginMobileState extends Equatable {
  const LoginMobileState();

  LoginMobileState init() {
    return const LoginMobileState();
  }

  LoginMobileState clone() {
    return const LoginMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class LoginMobileFailure extends LoginMobileState {
  const LoginMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class LoginMobileLoading extends LoginMobileState {}

class LoginMobileLoaded extends LoginMobileState {}

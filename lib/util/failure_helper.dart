import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

enum AuthFailureException {
  providerAlreadyLinked,
  credentialAlreadyInUse,
  emailAlreadyInUse,
  accountExistsWithDifferentCredential,
  invalidCredential,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  invalidVerificationCode,
  invalidVerificationId,
  weakPassword,
}

class AuthFailure extends Failure {
  const AuthFailure(
    super.message, {
    required this.authFailureException,
  });

  final AuthFailureException authFailureException;
}

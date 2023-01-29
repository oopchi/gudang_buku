import 'package:equatable/equatable.dart';
import 'package:grpc/grpc.dart';

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

Failure handleGRPCFailure(GrpcError e) {
  AuthFailureException authFailureException =
      AuthFailureException.invalidCredential;

  switch (e.code) {
    case StatusCode.ok:
      break;
    case StatusCode.cancelled:
      break;
    case StatusCode.unknown:
      break;
    case StatusCode.invalidArgument:
      break;
    case StatusCode.deadlineExceeded:
      break;
    case StatusCode.notFound:
      break;
    case StatusCode.alreadyExists:
      break;
    case StatusCode.permissionDenied:
      break;
    case StatusCode.resourceExhausted:
      break;
    case StatusCode.failedPrecondition:
      break;
    case StatusCode.aborted:
      break;
    case StatusCode.outOfRange:
      break;
    case StatusCode.unimplemented:
      break;
    case StatusCode.internal:
      break;
    case StatusCode.unavailable:
      break;
    case StatusCode.dataLoss:
      break;
    case StatusCode.unauthenticated:
      break;
  }

  return AuthFailure(
    e.message ?? 'Authentication Failure',
    authFailureException: authFailureException,
  );
}

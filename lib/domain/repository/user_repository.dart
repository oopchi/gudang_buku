import 'package:gudang_buku/domain/dto/user_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserResponse>>> fetchAllUsers();
  Future<Either<Failure, UserResponse>> fetchUserWithId({
    required String uid,
  });
  Future<Either<Failure, void>> addOrUpdateUser({
    required UserResponse userResponse,
  });
}

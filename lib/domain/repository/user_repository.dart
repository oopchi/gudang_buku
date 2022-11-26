import 'package:bookstore/domain/model/user_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserResponse>>> fetchAllUsers();
  Future<Either<Failure, UserResponse>> fetchUserWithId({
    required String uid,
  });
}

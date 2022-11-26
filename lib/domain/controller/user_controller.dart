import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:bookstore/domain/repository/user_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  const UserController({
    required UserRepository userRepository,
    required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _localStorage = localStorage;

  final UserRepository _userRepository;
  final LocalStorage _localStorage;

  Future<Either<Failure, List<UserResponse>>> loadAllUsers() async {
    if (await _localStorage.isEmpty(LocalStoragePath.user)) {
      return _userRepository.fetchAllUsers();
    }

    return Right(await _localStorage.readAll(LocalStoragePath.user));
  }

  Future<Either<Failure, List<UserResponse>>> loadUser({
    required String uid,
  }) async {}
}

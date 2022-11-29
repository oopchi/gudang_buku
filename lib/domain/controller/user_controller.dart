import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/dto/user_response.dart';
import 'package:bookstore/domain/repository/user_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter/foundation.dart';

class UserController {
  UserController({
    required UserRepository userRepository,
    required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _localStorage = localStorage;

  final UserRepository _userRepository;
  final LocalStorage _localStorage;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<Failure, UserResponse>> loadUser() async {
    try {
      if (await _localStorage.isEmpty(LocalStoragePath.user)) {
        final User user = (await _auth.signInAnonymously()).user!;

        final UserResponse userResponse = UserResponse.newUserResponse(
          id: user.uid,
        );

        await _userRepository.addUser(
          userResponse: userResponse,
        );

        if (kIsWeb) {
          await _localStorage.overwrite(
            LocalStoragePath.user,
            userResponse,
          );
        } else {
          final Map<String, dynamic> inputData = userResponse.toJson();

          inputData.removeWhere((key, value) => value == null);

          Workmanager().registerOneOffTask(
            LocalStoragePath.user.text,
            LocalStoragePath.user.text,
            inputData: inputData,
          );
        }

        return Right(userResponse);
      }

      return Right(await _localStorage.readAt(LocalStoragePath.user, 0));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

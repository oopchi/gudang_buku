import 'dart:io';

import 'package:bookstore/domain/dto/user_response.dart';
import 'package:bookstore/domain/repository/user_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class UserRepositoryFS implements UserRepository {
  UserRepositoryFS._internal();

  factory UserRepositoryFS() => _instance;

  static final UserRepositoryFS _instance = UserRepositoryFS._internal();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<Either<Failure, List<UserResponse>>> fetchAllUsers({
    UserResponse? latestUser,
  }) async {
    try {
      return users.limit(10).startAfter(<Object?>[latestUser]).get().then(
            (QuerySnapshot<Object?> result) {
              return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
                final Map<String, dynamic> data =
                    e.data() as Map<String, dynamic>;

                data['id'] = e.reference.id;

                return UserResponse.fromJson(data);
              }).toList());
            },
            onError: (e) => Left(DatabaseFailure(e.toString())),
          );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, UserResponse>> fetchUserWithId({
    required String uid,
  }) async {
    try {
      return users.doc(uid).get().then(
        (DocumentSnapshot<Object?> result) {
          return Right(
              UserResponse.fromJson(result.data() as Map<String, dynamic>));
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> addOrUpdateUser({
    required UserResponse userResponse,
  }) async {
    try {
      return users.doc(userResponse.id).set(userResponse.toJson()).then(
            (_) => Right(_),
            onError: (e) => Left(e),
          );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

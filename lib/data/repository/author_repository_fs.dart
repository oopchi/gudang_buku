import 'dart:io';

import 'package:bookstore/domain/dto/author_response.dart';
import 'package:bookstore/domain/repository/author_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class AuthorRepositoryFS implements AuthorRepository {
  AuthorRepositoryFS._internal();

  factory AuthorRepositoryFS() => _instance;

  static final AuthorRepositoryFS _instance = AuthorRepositoryFS._internal();

  final CollectionReference authors =
      FirebaseFirestore.instance.collection('authors');

  @override
  Future<Either<Failure, List<AuthorResponse>>> fetchAllAuthorWithId({
    required List<String> authorIds,
  }) async {
    try {
      return await authors
          .where(
            'id',
            whereIn: authorIds,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return AuthorResponse.fromJson(data);
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
}

import 'dart:io';

import 'package:gudang_buku/domain/dto_fs/author_response.dart';
import 'package:gudang_buku/infra/repository/author_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

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
      return await authors.get().then(
        (QuerySnapshot<Object?> result) {
          final List<AuthorResponse> authors = <AuthorResponse>[];
          for (final QueryDocumentSnapshot<Object?> doc in result.docs) {
            if (doc.data() != null && authorIds.contains(doc.reference.id)) {
              final Map<String, dynamic> data =
                  doc.data() as Map<String, dynamic>;

              data['id'] = doc.reference.id;

              final AuthorResponse authorResponse =
                  AuthorResponse.fromJson(data);
              authors.add(authorResponse);
            }
          }

          return Right(authors);
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
  Future<Either<Failure, List<AuthorResponse>>> fetchAllAuthor() async {
    try {
      return await authors.get().then(
        (QuerySnapshot<Object?> result) {
          final List<AuthorResponse> authors = <AuthorResponse>[];
          for (final QueryDocumentSnapshot<Object?> doc in result.docs) {
            final Map<String, dynamic> data =
                doc.data() as Map<String, dynamic>;

            data['id'] = doc.reference.id;

            final AuthorResponse authorResponse = AuthorResponse.fromJson(data);
            authors.add(authorResponse);
          }

          return Right(authors);
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

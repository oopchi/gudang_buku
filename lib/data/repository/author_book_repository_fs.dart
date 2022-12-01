import 'dart:io';

import 'package:bookstore/domain/dto/author_book_response.dart';
import 'package:bookstore/domain/repository/author_book_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class AuthorBookRepositoryFS implements AuthorBookRepository {
  AuthorBookRepositoryFS._internal();

  factory AuthorBookRepositoryFS() => _instance;

  static final AuthorBookRepositoryFS _instance =
      AuthorBookRepositoryFS._internal();

  final CollectionReference authorBook =
      FirebaseFirestore.instance.collection('author_book');

  @override
  Future<Either<Failure, List<AuthorBookResponse>>>
      fetchAllAuthorBookWithBookId({
    required String bookId,
  }) async {
    try {
      return await authorBook
          .where(
            'bookId',
            isEqualTo: bookId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return AuthorBookResponse.fromJson(data);
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

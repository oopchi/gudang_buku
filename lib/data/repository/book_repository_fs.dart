import 'dart:io';

import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class BookRepositoryFS implements BookRepository {
  BookRepositoryFS._internal();

  factory BookRepositoryFS() => _instance;

  static final BookRepositoryFS _instance = BookRepositoryFS._internal();

  final CollectionReference books =
      FirebaseFirestore.instance.collection('books');

  @override
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithLimit({
    int limit = 10,
    BookResponse? latestBook,
  }) async {
    try {
      if (latestBook == null) {
        return await books.limit(10).get().then(
          (QuerySnapshot<Object?> result) {
            return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
              final Map<String, dynamic> data =
                  e.data() as Map<String, dynamic>;

              data['id'] = e.reference.id;

              return BookResponse.fromJson(data);
            }).toList());
          },
          onError: (e) => Left(DatabaseFailure(e.toString())),
        );
      }
      return await books.limit(10).startAfter(<Object?>[latestBook]).get().then(
            (QuerySnapshot<Object?> result) {
              return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
                final Map<String, dynamic> data =
                    e.data() as Map<String, dynamic>;

                data['id'] = e.reference.id;

                return BookResponse.fromJson(data);
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
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithAnyPromo({
    required List<String> promoIds,
  }) async {
    if (promoIds.isEmpty) return const Right(<BookResponse>[]);

    try {
      return await books
          .where(
            'promoId',
            whereIn: promoIds,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return BookResponse.fromJson(data);
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
  Future<Either<Failure, BookResponse>> fetchBook({
    required String id,
  }) async {
    try {
      return await books.doc(id).get().then(
        (DocumentSnapshot<Object?> result) {
          final Map<String, dynamic> data =
              result.data() as Map<String, dynamic>;

          data['id'] = result.reference.id;

          return Right(BookResponse.fromJson(data));
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
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithPromoId({
    required String promoId,
  }) async {
    try {
      return await books
          .where(
            'promoId',
            isEqualTo: promoId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return BookResponse.fromJson(data);
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
  Future<Either<Failure, List<BookResponse>>> fetchAllBooks() async {
    try {
      return await books.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return BookResponse.fromJson(data);
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
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithIds(
      {required List<String> ids}) async {
    try {
      return await books.get().then(
        (QuerySnapshot<Object?> result) {
          final List<BookResponse> bookResponses =
              result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return BookResponse.fromJson(data);
          }).toList();

          bookResponses.retainWhere((element) => ids.contains(element.id));

          return Right(bookResponses);
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
  Future<Either<Failure, String>> addBook({
    required BookResponse bookResponse,
  }) async {
    try {
      return await books.add(bookResponse.toJson()).then(
        (DocumentReference<Object?> result) {
          return Right(result.id);
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

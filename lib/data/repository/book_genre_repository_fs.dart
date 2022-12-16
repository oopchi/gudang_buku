import 'dart:io';

import 'package:gudang_buku/domain/dto/book_genre_response.dart';
import 'package:gudang_buku/domain/repository/book_genre_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class BookGenreRepositoryFS implements BookGenreRepository {
  BookGenreRepositoryFS._internal();

  factory BookGenreRepositoryFS() => _instance;

  static final BookGenreRepositoryFS _instance =
      BookGenreRepositoryFS._internal();

  final CollectionReference bookGenre =
      FirebaseFirestore.instance.collection('book_genre');

  @override
  Future<Either<Failure, List<String>>> fetchAllBookIdWithGenreId({
    required String genreId,
  }) async {
    try {
      return await bookGenre
          .where(
            'genreId',
            isEqualTo: genreId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return BookGenreResponse.fromJson(data).bookId!;
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

import 'dart:io';

import 'package:bookstore/domain/dto/favorite_response.dart';
import 'package:bookstore/domain/repository/favorite_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class FavoriteRepositoryFS implements FavoriteRepository {
  FavoriteRepositoryFS._internal();

  factory FavoriteRepositoryFS() => _instance;

  static final FavoriteRepositoryFS _instance =
      FavoriteRepositoryFS._internal();

  final CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');

  @override
  Future<Either<Failure, List<FavoriteResponse>>> fetchAllFavoritesForUserId({
    required String userId,
  }) async {
    try {
      return await favorites
          .where(
            'userId',
            isEqualTo: userId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return FavoriteResponse.fromJson(data);
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
  Future<Either<Failure, String>> addFavorite({
    required String userId,
    required String bookId,
  }) async {
    try {
      final FavoriteResponse favoriteResponse = FavoriteResponse(
        bookId: bookId,
        userId: userId,
      );
      return await favorites.add(favoriteResponse.toJson()).then(
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

  @override
  Future<Either<Failure, void>> removeFavorite({
    required String userId,
    required String bookId,
  }) async {
    try {
      return await favorites
          .where(
            'userId',
            isEqualTo: userId,
          )
          .where(
            'bookId',
            isEqualTo: bookId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) async {
          if (result.docs.isEmpty) return const Right(null);

          for (final QueryDocumentSnapshot<Object?> doc in result.docs) {
            await doc.reference.delete();
          }

          return const Right(null);
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

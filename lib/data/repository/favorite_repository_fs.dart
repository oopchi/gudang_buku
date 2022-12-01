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
}

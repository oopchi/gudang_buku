import 'dart:io';

import 'package:gudang_buku/domain/dto/review_response.dart';
import 'package:gudang_buku/domain/repository/review_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class ReviewRepositoryFS implements ReviewRepository {
  ReviewRepositoryFS._internal();

  factory ReviewRepositoryFS() => _instance;

  static final ReviewRepositoryFS _instance = ReviewRepositoryFS._internal();

  final CollectionReference reviews =
      FirebaseFirestore.instance.collection('reviews');

  @override
  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviews() async {
    try {
      return await reviews.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return ReviewResponse.fromJson(data);
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
  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviewsWithBookId({
    required String bookId,
  }) async {
    try {
      return await reviews
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

            return ReviewResponse.fromJson(data);
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

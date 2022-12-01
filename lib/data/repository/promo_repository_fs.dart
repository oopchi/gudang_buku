import 'dart:io';

import 'package:bookstore/domain/dto/promo_response.dart';
import 'package:bookstore/domain/repository/promo_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class PromoRepositoryFS implements PromoRepository {
  PromoRepositoryFS._internal();

  factory PromoRepositoryFS() => _instance;

  static final PromoRepositoryFS _instance = PromoRepositoryFS._internal();

  final CollectionReference promos =
      FirebaseFirestore.instance.collection('promos');

  @override
  Future<Either<Failure, List<PromoResponse>>> fetchAllPromos() async {
    try {
      return await promos.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return PromoResponse.fromJson(data);
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
  Future<Either<Failure, List<PromoResponse>>> fetchAllOngoingPromos() async {
    try {
      return await promos
          .where(
            'endDate',
            isGreaterThanOrEqualTo: DateTime.now(),
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return PromoResponse.fromJson(data);
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

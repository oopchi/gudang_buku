import 'dart:io';

import 'package:gudangBuku/domain/dto/discount_response.dart';
import 'package:gudangBuku/domain/repository/discount_repository.dart';
import 'package:gudangBuku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudangBuku/util/failure_helper.dart';

class DiscountRepositoryFS implements DiscountRepository {
  DiscountRepositoryFS._internal();

  factory DiscountRepositoryFS() => _instance;

  static final DiscountRepositoryFS _instance =
      DiscountRepositoryFS._internal();

  final CollectionReference discounts =
      FirebaseFirestore.instance.collection('discounts');

  @override
  Future<Either<Failure, List<DiscountResponse>>> fetchAllDiscounts() async {
    try {
      return await discounts.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return DiscountResponse.fromJson(data);
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
  Future<Either<Failure, List<DiscountResponse>>>
      fetchAllOngoingDiscounts() async {
    try {
      return await discounts
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

            return DiscountResponse.fromJson(data);
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

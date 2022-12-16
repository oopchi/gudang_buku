import 'dart:io';

import 'package:gudang_buku/domain/dto/discount_response.dart';
import 'package:gudang_buku/domain/dto/user_discount_response.dart';
import 'package:gudang_buku/domain/repository/discount_repository.dart';
import 'package:gudang_buku/domain/repository/user_discount_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class UserDiscountRepositoryFS implements UserDiscountRepository {
  UserDiscountRepositoryFS._internal();

  factory UserDiscountRepositoryFS() => _instance;

  static final UserDiscountRepositoryFS _instance =
      UserDiscountRepositoryFS._internal();

  final CollectionReference userDiscount =
      FirebaseFirestore.instance.collection('user_discount');

  @override
  Future<Either<Failure, List<UserDiscountResponse>>> fetchAllUserDiscounts({
    required String uid,
  }) async {
    try {
      return await userDiscount
          .where(
            'userId',
            isEqualTo: uid,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return UserDiscountResponse.fromJson(data);
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

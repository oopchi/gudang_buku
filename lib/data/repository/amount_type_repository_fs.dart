import 'dart:io';

import 'package:gudang_buku/domain/dto/amount_type_response.dart';
import 'package:gudang_buku/domain/repository/amount_type_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class AmountTypeRepositoryFS implements AmountTypeRepository {
  AmountTypeRepositoryFS._internal();

  factory AmountTypeRepositoryFS() => _instance;

  static final AmountTypeRepositoryFS _instance =
      AmountTypeRepositoryFS._internal();

  final CollectionReference amountTypes =
      FirebaseFirestore.instance.collection('amount_types');

  @override
  Future<Either<Failure, List<AmountTypeResponse>>> fetchAllAmountType() async {
    try {
      return await amountTypes.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return AmountTypeResponse.fromJson(data);
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

import 'dart:io';

import 'package:gudang_buku/domain/dto_fs/transaction_detail_response.dart';
import 'package:gudang_buku/infra/repository/transaction_detail_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class TransactionDetailRepositoryFS implements TransactionDetailRepository {
  TransactionDetailRepositoryFS._internal();

  factory TransactionDetailRepositoryFS() => _instance;

  static final TransactionDetailRepositoryFS _instance =
      TransactionDetailRepositoryFS._internal();

  final CollectionReference transactionDetails =
      FirebaseFirestore.instance.collection('transaction_details');

  @override
  Future<Either<Failure, List<TransactionDetailResponse>>>
      fetchAllTransactionDetail() async {
    try {
      return await transactionDetails.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return TransactionDetailResponse.fromJson(data);
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
  Future<Either<Failure, String>> addCartTransactionDetail({
    required String transactionId,
    required String bookId,
    required int quantity,
  }) async {
    try {
      final TransactionDetailResponse transactionDetailResponse =
          TransactionDetailResponse(
        bookId: bookId,
        quantity: quantity,
        transactionId: transactionId,
      );
      return await transactionDetails
          .add(transactionDetailResponse.toJson())
          .then(
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
  Future<Either<Failure, List<TransactionDetailResponse>>>
      fetchAllTransactionDetailForTransactionId(
          {required String transactionId}) async {
    try {
      return await transactionDetails
          .where(
            'transactionId',
            isEqualTo: transactionId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return TransactionDetailResponse.fromJson(data);
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
  Future<Either<Failure, void>>
      deleteAllTransactionDetailWithTransactionIdAndBookId({
    required String transactionId,
    required String bookId,
  }) async {
    try {
      return await transactionDetails
          .where(
            'transactionId',
            isEqualTo: transactionId,
          )
          .where(
            'bookId',
            isEqualTo: bookId,
          )
          .get()
          .then((QuerySnapshot<Object?> value) async {
        for (final QueryDocumentSnapshot<Object?> doc in value.docs) {
          await doc.reference.delete();
        }

        return const Right(null);
      });
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>>
      deleteTransactionDetailWithTransactionIdAndBookId({
    required String transactionId,
    required String bookId,
  }) async {
    try {
      return await transactionDetails
          .where(
            'transactionId',
            isEqualTo: transactionId,
          )
          .where(
            'bookId',
            isEqualTo: bookId,
          )
          .limit(1)
          .get()
          .then((QuerySnapshot<Object?> value) async {
        for (final QueryDocumentSnapshot<Object?> doc in value.docs) {
          await doc.reference.delete();
        }

        return const Right(null);
      });
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

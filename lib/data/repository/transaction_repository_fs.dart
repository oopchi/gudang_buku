import 'dart:io';

import 'package:bookstore/domain/dto/transaction_response.dart';
import 'package:bookstore/domain/repository/transaction_repository.dart';
import 'package:bookstore/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

class TransactionRepositoryFS implements TransactionRepository {
  TransactionRepositoryFS._internal();

  factory TransactionRepositoryFS() => _instance;

  static final TransactionRepositoryFS _instance =
      TransactionRepositoryFS._internal();

  final CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

  @override
  Future<Either<Failure, List<TransactionResponse>>>
      fetchAllTransactions() async {
    try {
      return await transactions.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return TransactionResponse.fromJson(data);
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
  Future<Either<Failure, TransactionResponse>> fetchTransactionForUserId(
      {required String uid}) {
    // TODO: implement fetchTransactionForUserId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getCartTransactionId(
      {required String uid}) async {
    try {
      return await transactions.where('userId', isEqualTo: uid).get().then(
        (QuerySnapshot<Object?> result) async {
          final List<QueryDocumentSnapshot<Object?>> docs = result.docs;

          for (int i = 0; i < docs.length; i++) {
            if (!((docs[i].data() as Map<String, dynamic>)
                .containsKey('checkedOutAt'))) {
              return Right(docs[i].id);
            }
          }

          final TransactionResponse transactionResponse = TransactionResponse(
            userId: uid,
          );
          return await transactions
              .add(transactionResponse.toJson())
              .then((DocumentReference<Object?> value) => Right(value.id));
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

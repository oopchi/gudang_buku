import 'package:bookstore/domain/dto/transaction_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionResponse>>> fetchAllTransactions();
  Future<Either<Failure, TransactionResponse>> fetchTransactionForUserId({
    required String uid,
  });

  Future<Either<Failure, void>> addTransaction({
    required TransactionResponse userResponse,
  });
}

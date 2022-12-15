import 'package:gudangBuku/domain/dto/transaction_detail_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionDetailRepository {
  Future<Either<Failure, List<TransactionDetailResponse>>>
      fetchAllTransactionDetail();

  Future<Either<Failure, String>> addCartTransactionDetail({
    required String transactionId,
    required String bookId,
    required int quantity,
  });

  Future<Either<Failure, List<TransactionDetailResponse>>>
      fetchAllTransactionDetailForTransactionId({
    required String transactionId,
  });

  Future<Either<Failure, void>>
      deleteAllTransactionDetailWithTransactionIdAndBookId({
    required String transactionId,
    required String bookId,
  });

  Future<Either<Failure, void>>
      deleteTransactionDetailWithTransactionIdAndBookId({
    required String transactionId,
    required String bookId,
  });
}

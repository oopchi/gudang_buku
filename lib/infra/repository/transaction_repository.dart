import 'package:gudang_buku/domain/dto_fs/transaction_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionResponse>>> fetchAllTransactions();
  Future<Either<Failure, TransactionResponse>> fetchTransactionForUserId({
    required String uid,
  });

  Future<Either<Failure, String>> getCartTransactionId({
    required String uid,
  });

  Future<Either<Failure, TransactionResponse>> getCartTransaction({
    required String uid,
  });

  Future<Either<Failure, String>> addDiscountToCart({
    required String uid,
    required String discountId,
  });
}

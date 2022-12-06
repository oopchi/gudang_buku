import 'package:bookstore/domain/dto/transaction_detail_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionDetailRepository {
  Future<Either<Failure, List<TransactionDetailResponse>>>
      fetchAllTransactionDetail();
}
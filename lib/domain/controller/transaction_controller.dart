import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/transaction_response.dart';
import 'package:bookstore/domain/repository/transaction_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

class TransactionController {
  const TransactionController({
    required TransactionRepository transactionRepository,
    required LocalStorage localStorage,
  })  : _transactionRepository = transactionRepository,
        _localStorage = localStorage;
  final TransactionRepository _transactionRepository;
  final LocalStorage _localStorage;

  Future<Either<Failure, List<TransactionResponse>>>
      loadAllTransactions() async {
    if (await _localStorage.isEmpty(LocalStoragePath.transaction)) {
      return _transactionRepository.fetchAllTransactions();
    }

    return Right(await _localStorage.readAll(LocalStoragePath.transaction));
  }
}

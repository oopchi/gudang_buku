import 'package:bookstore/domain/controller/transaction_controller.dart';
import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/transaction_detail_response.dart';
import 'package:bookstore/domain/dto/transaction_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

class BookController {
  const BookController({
    required BookRepository bookRepository,
    required LocalStorage localStorage,
    required TransactionController transactionController,
  })  : _bookRepository = bookRepository,
        _transactionController = transactionController,
        _localStorage = localStorage;
  final BookRepository _bookRepository;
  final LocalStorage _localStorage;
  final TransactionController _transactionController;

  Future<Either<Failure, List<BookResponse>>> loadAllBooksWithLimit() async {
    if (await _localStorage.isEmpty(LocalStoragePath.book)) {
      return _bookRepository.fetchAllBooksWithLimit();
    }

    return Right(await _localStorage.readAll(LocalStoragePath.book));
  }

  List<BookResponse> getNewArrivals(List<BookResponse> bookResponses) =>
      bookResponses;

  Future<Either<Failure, List<BookResponse>>> getPopularBooks(
      List<BookResponse> bookResponses) async {
    final Map<int, int> indexMap = <int, int>{
      for (int i = 0; i < bookResponses.length; i++) i: 0
    };

    final Map<BookResponse, int> bookMap = <BookResponse, int>{
      for (int i = 0; i < bookResponses.length; i++) bookResponses[i]: i
    };

    final Either<Failure, List<TransactionResponse>> res =
        await _transactionController.loadAllTransactions();

    return res.fold(
      (Failure l) => Left(l),
      (List<TransactionResponse> r) {
        for (final TransactionResponse transactionResponse in r) {
          if (transactionResponse.transactionDetails != null) {
            for (final TransactionDetailResponse? transactionDetailResponse
                in transactionResponse.transactionDetails!) {
              if (transactionDetailResponse != null) {
                final BookResponse? book = transactionDetailResponse.book;

                if (book != null && bookResponses.contains(book)) {
                  indexMap[bookMap[book]!] = indexMap[bookMap[book]]! + 1;
                }
              }
            }
          }
        }

        final List<MapEntry<int, int>> sortedMapList = indexMap.entries.toList()
          ..sort(
            (MapEntry<int, int> a, MapEntry<int, int> b) =>
                b.value.compareTo(a.value),
          );

        final List<BookResponse> popularBookSorted = <BookResponse>[
          for (final MapEntry<int, int> mapEntry in sortedMapList)
            bookResponses[mapEntry.key],
        ];

        return Right(popularBookSorted);
      },
    );
  }
}

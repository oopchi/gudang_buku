import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

class BookController {
  const BookController({
    required BookRepository bookRepository,
    required LocalStorage localStorage,
  })  : _bookRepository = bookRepository,
        _localStorage = localStorage;
  final BookRepository _bookRepository;
  final LocalStorage _localStorage;

  Future<Either<Failure, List<BookResponse>>> loadAllBooks() async {
    if (await _localStorage.isEmpty(LocalStoragePath.book)) {
      return _bookRepository.fetchAllBooks();
    }

    return Right(await _localStorage.readAll(LocalStoragePath.book));
  }
}

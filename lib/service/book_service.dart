import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/list_pagination_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class BookService {
  Future<Either<Failure, ListPaginationModel<BookModel>>> getAllBooks({
    int? pageID,
    int? pageSize,
    String? sort,
    double? minPrice,
    double? maxPrice,
    int? minRating,
    int? maxRating,
  });
}

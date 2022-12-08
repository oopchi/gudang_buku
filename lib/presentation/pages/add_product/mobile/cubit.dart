import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AddProductMobileCubit extends Cubit<AddProductMobileState> {
  AddProductMobileCubit({
    required BookRepository bookRepository,
    required bool Function() isMounted,
  })  : _bookRepository = bookRepository,
        _isMounted = isMounted,
        super(const AddProductMobileFormState());

  final BookRepository _bookRepository;
  final bool Function() _isMounted;

  Future<void> addBook({
    required BookResponse bookResponse,
  }) async {
    final Either<Failure, String> bookRes = await _bookRepository.addBook(
      bookResponse: bookResponse,
    );

    if (bookRes.isLeft()) {
      if (!_isMounted()) return;
      emit(AddProductMobileFailure(
        message: bookRes.asLeft().message,
      ));

      return;
    }

    emit(AddProductMobileSuccess());
  }
}

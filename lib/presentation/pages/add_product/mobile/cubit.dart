import 'package:gudang_buku/data/service/storage_service_fs.dart';
import 'package:gudang_buku/domain/dto/author_response.dart';
import 'package:gudang_buku/domain/dto/book_response.dart';
import 'package:gudang_buku/domain/dto/media_response.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/repository/author_book_repository.dart';
import 'package:gudang_buku/domain/repository/author_repository.dart';
import 'package:gudang_buku/domain/repository/book_repository.dart';
import 'package:gudang_buku/domain/repository/media_repository.dart';
import 'package:gudang_buku/domain/service/image_picker_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AddProductMobileCubit extends Cubit<AddProductMobileState> {
  AddProductMobileCubit({
    required BookRepository bookRepository,
    required AuthorRepository authorRepository,
    required AuthorBookRepository authorBookRepository,
    required MediaRepository mediaRepository,
    required bool Function() isMounted,
  })  : _bookRepository = bookRepository,
        _authorRepository = authorRepository,
        _authorBookRepository = authorBookRepository,
        _mediaRepository = mediaRepository,
        _isMounted = isMounted,
        super(const AddProductMobileLoading());

  final BookRepository _bookRepository;
  final AuthorRepository _authorRepository;
  final AuthorBookRepository _authorBookRepository;
  final MediaRepository _mediaRepository;
  final bool Function() _isMounted;

  Future<void> load() async {
    final Either<Failure, List<AuthorResponse>> authorRes =
        await _authorRepository.fetchAllAuthor();

    if (authorRes.isLeft()) {
      _emit(AddProductMobileFailure(message: authorRes.asLeft().message));

      return;
    }

    final List<AuthorModel> authors = authorRes
        .asRight()
        .map((e) => AuthorModel(
              id: e.id!,
              name: e.name!,
              description: e.description,
            ))
        .toList();

    _emit(AddProductMobileFormState(
      authors: authors,
      selectedAuthors: const <AuthorModel>[],
      images: const <Uint8List>[],
      videos: const <Uint8List>[],
      title: '',
      price: -1,
      stock: -1,
    ));
  }

  Future<void> addBook(AddProductMobileFormState oldState) async {
    _emit(const AddProductMobileLoading());

    final BookResponse bookResponse = BookResponse(
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    );

    final Either<Failure, String> bookRes = await _bookRepository.addBook(
      bookResponse: bookResponse,
    );

    if (bookRes.isLeft()) {
      _emit(AddProductMobileFailure(
        message: bookRes.asLeft().message,
      ));

      _emit(oldState);

      return;
    }

    final String bookId = bookRes.asRight();

    for (final author in oldState.selectedAuthors) {
      final Either<Failure, String> authorBookRes =
          await _authorBookRepository.addAuthorBook(
        authorId: author.id,
        bookId: bookId,
      );

      if (authorBookRes.isLeft()) {
        _emit(AddProductMobileFailure(
          message: authorBookRes.asLeft().message,
        ));

        _emit(oldState);

        return;
      }
    }

    for (final image in oldState.images) {
      final Either<Failure, String> pathRes =
          await StorageServiceFS.uploadUInt8ListToCloud(
        file: image,
      );

      if (pathRes.isLeft()) {
        _emit(AddProductMobileFailure(
          message: pathRes.asLeft().message,
        ));

        _emit(oldState);
        return;
      }

      final MediaResponse mediaResponse = MediaResponse(
        url: pathRes.asRight(),
        bookId: bookId,
        mediaType: 'image',
      );

      _mediaRepository.addMedia(mediaResponse: mediaResponse);
    }

    for (final video in oldState.videos) {
      final Either<Failure, String> pathRes =
          await StorageServiceFS.uploadUInt8ListToCloud(
        file: video,
      );

      if (pathRes.isLeft()) {
        _emit(AddProductMobileFailure(
          message: pathRes.asLeft().message,
        ));

        _emit(oldState);
        return;
      }

      final MediaResponse mediaResponse = MediaResponse(
        url: pathRes.asRight(),
        bookId: bookId,
        mediaType: 'image',
      );

      _mediaRepository.addMedia(mediaResponse: mediaResponse);
    }

    _emit(AddProductMobileSuccess());

    _emit(oldState);
  }

  void deleteImage(
    AddProductMobileFormState oldState,
    int index,
  ) {
    final List<Uint8List> newList = oldState.images.toList()..removeAt(index);

    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: newList,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void deleteSelectedAuthor(AddProductMobileFormState oldState, int index) {
    final List<AuthorModel> newSelectedAuthors =
        oldState.selectedAuthors.toList();

    newSelectedAuthors.removeAt(index);

    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: newSelectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void selectAuthor(
      AddProductMobileFormState oldState, AuthorModel author, int index) {
    final List<AuthorModel> newSelectedAuthors =
        oldState.selectedAuthors.toList();
    if (index >= oldState.selectedAuthors.length) {
      newSelectedAuthors.add(author);
    } else {
      newSelectedAuthors.removeAt(index);

      newSelectedAuthors.insert(index, author);
    }

    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: newSelectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void deleteVideo(
    AddProductMobileFormState oldState,
    int index,
  ) {
    final List<Uint8List> newList = oldState.videos.toList()..removeAt(index);

    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: oldState.images,
      videos: newList,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  Future<void> pickImages(AddProductMobileFormState oldState) async {
    _emit(const AddProductMobileLoading());

    try {
      final List<Uint8List> pickedImages =
          await ImageAndVideoPicker.getImages();

      final List<Uint8List> newList = oldState.images.toList()
        ..addAll(pickedImages);

      _emit(AddProductMobileFormState(
        authors: oldState.authors,
        selectedAuthors: oldState.selectedAuthors,
        images: newList,
        videos: oldState.videos,
        title: oldState.title,
        overview: oldState.overview,
        price: oldState.price,
        stock: oldState.stock,
      ));
    } catch (e) {
      _emit(const AddProductMobileFailure(message: 'Error fetching images'));
      _emit(oldState);
    }
  }

  Future<void> pickVideo(AddProductMobileFormState oldState) async {
    _emit(const AddProductMobileLoading());

    try {
      final Uint8List? pickedVideo = await ImageAndVideoPicker.getVideo();

      if (pickedVideo == null) return;

      final List<Uint8List> newList = oldState.videos.toList();

      newList.add(pickedVideo);

      _emit(AddProductMobileFormState(
        authors: oldState.authors,
        selectedAuthors: oldState.selectedAuthors,
        images: oldState.images,
        videos: newList,
        title: oldState.title,
        overview: oldState.overview,
        price: oldState.price,
        stock: oldState.stock,
      ));
    } catch (e) {
      _emit(const AddProductMobileFailure(message: 'Error fetching video'));
      _emit(oldState);
    }
  }

  void checkTitle(AddProductMobileFormState oldState, String title) {
    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void checkDescription(
      AddProductMobileFormState oldState, String description) {
    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: oldState.title,
      overview: description,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void checkPrice(AddProductMobileFormState oldState, int price) {
    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: price,
      stock: oldState.stock,
    ));
  }

  void checkStock(AddProductMobileFormState oldState, int stock) {
    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: oldState.images,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: stock,
    ));
  }

  void changeLocImages(
      AddProductMobileFormState oldState, int oldIndex, int newIndex) {
    if (oldIndex == newIndex) return;

    final List<Uint8List> newList = oldState.images.toList();

    final Uint8List file = newList.removeAt(oldIndex);

    newList.insert(newIndex, file);

    _emit(AddProductMobileFormState(
      authors: oldState.authors,
      selectedAuthors: oldState.selectedAuthors,
      images: newList,
      videos: oldState.videos,
      title: oldState.title,
      overview: oldState.overview,
      price: oldState.price,
      stock: oldState.stock,
    ));
  }

  void _emit(AddProductMobileState newState) {
    if (!_isMounted()) return;

    emit(newState);
  }
}

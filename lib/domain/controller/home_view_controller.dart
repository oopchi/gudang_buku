import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/dto/amount_type_response.dart';
import 'package:bookstore/domain/dto/author_book_response.dart';
import 'package:bookstore/domain/dto/author_response.dart';
import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/event_response.dart';
import 'package:bookstore/domain/dto/favorite_response.dart';
import 'package:bookstore/domain/dto/media_response.dart';
import 'package:bookstore/domain/dto/review_response.dart';
import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/product_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:bookstore/domain/dto/promo_response.dart';
import 'package:bookstore/domain/repository/amount_type_repository.dart';
import 'package:bookstore/domain/repository/author_book_repository.dart';
import 'package:bookstore/domain/repository/author_repository.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/domain/repository/event_repository.dart';
import 'package:bookstore/domain/repository/favorite_repository.dart';
import 'package:bookstore/domain/repository/media_repository.dart';
import 'package:bookstore/domain/repository/promo_repository.dart';
import 'package:bookstore/domain/repository/review_repository.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HomeViewController {
  const HomeViewController({
    required BookRepository bookRepository,
    required PromoRepository promoRepository,
    required LocalStorage localStorage,
    required ReviewRepository reviewRepository,
    required EventRepository eventRepository,
    required FavoriteRepository favoriteRepository,
    required MediaRepository mediaRepository,
    required AuthorBookRepository authorBookRepository,
    required AuthorRepository authorRepository,
    required AmountTypeRepository amountTypeRepository,
    required AuthServiceFS authServiceFS,
  })  : _bookRepository = bookRepository,
        _amountTypeRepository = amountTypeRepository,
        _favoriteRepository = favoriteRepository,
        _authorBookRepository = authorBookRepository,
        _eventRepository = eventRepository,
        _mediaRepository = mediaRepository,
        _promoRepository = promoRepository,
        _reviewRepository = reviewRepository,
        _authServiceFS = authServiceFS,
        _authorRepository = authorRepository;

  final AuthorRepository _authorRepository;
  final BookRepository _bookRepository;
  final PromoRepository _promoRepository;
  final ReviewRepository _reviewRepository;
  final EventRepository _eventRepository;
  final FavoriteRepository _favoriteRepository;
  final MediaRepository _mediaRepository;
  final AuthorBookRepository _authorBookRepository;
  final AmountTypeRepository _amountTypeRepository;

  final AuthServiceFS _authServiceFS;

  Future<Either<Failure, List<EventModel>>> getAllEvents() async {
    final Either<Failure, List<EventResponse>> eventRes =
        await _eventRepository.fetchAllEvents();

    return eventRes.fold(
      (l) => Left(l),
      (List<EventResponse> eventResponses) =>
          Right(_createEvents(eventResponses)),
    );
  }

  Future<Either<Failure, List<PromoModel>>> getAllPromoWithBooks() async {
    final Either<Failure, List<PromoResponse>> promoRes =
        await _promoRepository.fetchAllOngoingPromos();

    return promoRes.fold(
      (l) => Left(l),
      (List<PromoResponse> promoResponses) async {
        final Either<Failure, List<BookResponse>> booksRes =
            await _bookRepository.fetchAllBooks();

        return booksRes.fold(
          (l) => Left(l),
          (List<BookResponse> bookResponses) async {
            final Either<Failure, List<PromoModel>> promoModelsRes =
                await _createPromosWithBooks(promoResponses, bookResponses);

            return promoModelsRes.fold(
              (l) => Left(l),
              (List<PromoModel> promoModels) => Right(promoModels),
            );
          },
        );
      },
    );
  }

  List<EventModel> _createEvents(List<EventResponse> eventResponses) {
    return eventResponses.map((EventResponse e) {
      DateTimeRange? dateTimeRange;

      if (e.startDate != null && e.endDate != null) {
        dateTimeRange = DateTimeRange(
          start: e.startDate!,
          end: e.endDate!,
        );
      }
      return EventModel(
        id: e.id!,
        name: e.name!,
        description: e.description,
        dateTimeRange: dateTimeRange,
        imageUrl: e.coverUrl!,
      );
    }).toList();
  }

  Future<Either<Failure, List<PromoModel>>> _createPromosWithBooks(
    List<PromoResponse> promoResponses,
    List<BookResponse> bookResponses,
  ) async {
    final List<PromoModel> promos = <PromoModel>[];

    final Either<Failure, List<AmountTypeResponse>> amountTypeRes =
        await _amountTypeRepository.fetchAllAmountType();

    if (amountTypeRes.isLeft()) {
      return Left(amountTypeRes.asLeft());
    }

    final List<AmountTypeResponse> amountTypeResponses =
        amountTypeRes.asRight();

    final Map<String, String> amountTypeMap = <String, String>{
      for (final AmountTypeResponse amountTypeResponse in amountTypeResponses)
        amountTypeResponse.id!: amountTypeResponse.name!,
    };

    final Map<String, List<ProductModel>> promoProductMap =
        <String, List<ProductModel>>{
      for (final PromoResponse promoResponse in promoResponses)
        promoResponse.id!: <ProductModel>[],
    };

    final Map<String, PromoResponse> namePromoMap = <String, PromoResponse>{
      for (final PromoResponse promoResponse in promoResponses)
        promoResponse.id!: promoResponse,
    };

    final Either<Failure, List<FavoriteResponse>> favoriteRes =
        await _favoriteRepository.fetchAllFavoritesForUserId(
      userId: _authServiceFS.getUser().uid,
    );

    if (favoriteRes.isLeft()) {
      return Left(favoriteRes.asLeft());
    }

    final List<FavoriteResponse> userFavoriteResponse = favoriteRes.asRight();

    bookResponses.removeWhere((element) =>
        element.promoId == null ||
        !promoProductMap.containsKey(element.promoId));

    for (final BookResponse bookResponse in bookResponses) {
      final FavoriteButtonModel favoriteButtonModel = FavoriteButtonModel(
        showButton: true,
        isFavorite: userFavoriteResponse
                .indexWhere((element) => element.bookId! == bookResponse.id!) !=
            -1,
      );

      final Either<Failure, List<MediaResponse>> mediaRes =
          await _mediaRepository.fetchAllMediasWithBookId(
        bookId: bookResponse.id!,
      );

      if (mediaRes.isLeft()) {
        return Left(mediaRes.asLeft());
      }

      final List<MediaResponse> mediaResponses = mediaRes.asRight();

      final String imageUrl = mediaResponses[0].url!;

      final List<String> imageUrls = <String>[];

      for (final MediaResponse media in mediaResponses) {
        imageUrls.add(media.url!);
      }

      final Either<Failure, List<AuthorBookResponse>> authorBookRes =
          await _authorBookRepository.fetchAllAuthorBookWithBookId(
        bookId: bookResponse.id!,
      );

      if (authorBookRes.isLeft()) {
        return Left(authorBookRes.asLeft());
      }

      final List<AuthorBookResponse> authorBookResponses =
          authorBookRes.asRight();

      final Either<Failure, List<AuthorResponse>> authorRes =
          await _authorRepository.fetchAllAuthorWithId(
        authorIds: authorBookResponses.map((e) => e.authorId!).toList(),
      );

      if (authorRes.isLeft()) {
        return Left(authorRes.asLeft());
      }

      final List<AuthorResponse> authorResponses = authorRes.asRight();

      final String author = authorResponses.fold(
          '', (previousValue, element) => '$previousValue, ${element.name}');

      final Map<String, String> authorOverviews = <String, String>{
        for (final AuthorResponse authorResponse in authorResponses)
          if (authorResponse.description != null)
            authorResponse.name!: authorResponse.description!
      };

      final Either<Failure, List<ReviewResponse>> reviewRes =
          await _reviewRepository.fetchAllReviewsWithBookId(
        bookId: bookResponse.id!,
      );

      if (reviewRes.isLeft()) {
        return Left(reviewRes.asLeft());
      }

      final List<ReviewResponse> reviewResponses = reviewRes.asRight();

      final double totalRating = reviewResponses.fold(
          .0, (previousValue, element) => .0 + element.stars!);

      final int numOfRating = reviewResponses.length;

      final double averageRating =
          numOfRating <= 0 ? .0 : (totalRating / numOfRating);

      final ProductModel productCardModel = ProductModel(
        id: bookResponse.id!,
        favoriteButtonModel: favoriteButtonModel,
        imageUrl: imageUrl,
        author: author,
        numOfRating: numOfRating,
        price: bookResponse.price!,
        rating: averageRating,
        title: bookResponse.title!,
        description: bookResponse.overview,
        authorOverviews: authorOverviews,
        imageUrls: imageUrls,
      );

      promoProductMap[bookResponse.promoId]!.add(productCardModel);
    }

    for (final MapEntry<String, List<ProductModel>> mapEntry
        in promoProductMap.entries) {
      final PromoResponse currentPromoResponse = namePromoMap[mapEntry.key]!;

      DateTimeRange? dateTimeRange;

      if (currentPromoResponse.startDate != null &&
          currentPromoResponse.endDate != null) {
        dateTimeRange = DateTimeRange(
          start: currentPromoResponse.startDate!,
          end: currentPromoResponse.endDate!,
        );
      }

      final List<ProductModel> productCardModels = mapEntry.value;

      final PromoModel promo = PromoModel(
        id: currentPromoResponse.id!,
        title: currentPromoResponse.name ?? '',
        description: currentPromoResponse.description ?? '',
        productCardModels: productCardModels,
        amount: currentPromoResponse.amount ?? 0,
        amountType:
            amountTypeMap[currentPromoResponse.amountTypeId] ?? 'Amount',
        dateTimeRange: dateTimeRange,
      );

      promos.add(promo);
    }

    return Right(promos);
  }
}

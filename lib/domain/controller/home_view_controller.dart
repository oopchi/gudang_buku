import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/media_response.dart';
import 'package:bookstore/domain/dto/review_response.dart';
import 'package:bookstore/domain/dto/user_response.dart';
import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:bookstore/domain/dto/promo_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
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
    required MediaRepository mediaRepository,
    required ReviewRepository reviewRepository,
  })  : _bookRepository = bookRepository,
        _mediaRepository = mediaRepository,
        _promoRepository = promoRepository,
        _reviewRepository = reviewRepository,
        _localStorage = localStorage;

  final LocalStorage _localStorage;
  final BookRepository _bookRepository;
  final PromoRepository _promoRepository;
  final MediaRepository _mediaRepository;
  final ReviewRepository _reviewRepository;

  Future<Either<Failure, List<PromoModel>>> getAllPromoWithBooks() async {
    final Either<Failure, List<PromoResponse>> promoRes =
        await _promoRepository.fetchAllOngoingPromos();

    return promoRes.fold(
      (l) => Left(l),
      (List<PromoResponse> promoResponses) async {
        final List<String> promoIds = promoResponses.map((e) => e.id!).toList();

        final Either<Failure, List<BookResponse>> booksRes =
            await _bookRepository.fetchAllBooksWithAnyPromo(
          promoIds: promoIds,
        );

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

  Future<Either<Failure, List<PromoModel>>> _createPromosWithBooks(
    List<PromoResponse> promoResponses,
    List<BookResponse> bookResponses,
  ) async {
    final UserResponse user =
        await _localStorage.readAt(LocalStoragePath.user, 0);

    final List<PromoModel> promos = <PromoModel>[];
    final Map<String, List<ProductCardModel>> promoProductMap =
        <String, List<ProductCardModel>>{
      for (final PromoResponse promoResponse in promoResponses)
        promoResponse.id!: <ProductCardModel>[],
    };

    final Map<String, PromoResponse> namePromoMap = <String, PromoResponse>{
      for (final PromoResponse promoResponse in promoResponses)
        promoResponse.id!: promoResponse,
    };

    for (final BookResponse bookResponse in bookResponses) {
      final FavoriteButtonModel favoriteButtonModel = FavoriteButtonModel(
        showButton: true,
        isFavorite: user.favorites
                ?.indexWhere((element) => element?.id! == bookResponse.id!) !=
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

      final String author = bookResponse.authors!.fold(
          '', (previousValue, element) => '$previousValue, ${element!.name}');

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

      final ProductCardModel productCardModel = ProductCardModel(
        favoriteButtonModel: favoriteButtonModel,
        imageUrl: imageUrl,
        author: author,
        numOfRating: numOfRating,
        price: bookResponse.price!,
        rating: averageRating,
        title: bookResponse.title!,
      );

      promoProductMap[bookResponse.promoId]!.add(productCardModel);
    }

    for (final MapEntry<String, List<ProductCardModel>> mapEntry
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

      final List<ProductCardModel> productCardModels = <ProductCardModel>[];

      final PromoModel promo = PromoModel(
        id: currentPromoResponse.id!,
        title: currentPromoResponse.name ?? '',
        description: currentPromoResponse.description ?? '',
        productCardModels: productCardModels,
        amount: currentPromoResponse.amount ?? 0,
        amountType: currentPromoResponse.promoType ?? 'Amount',
        dateTimeRange: dateTimeRange,
      );

      promos.add(promo);
    }

    return Right(promos);
  }
}

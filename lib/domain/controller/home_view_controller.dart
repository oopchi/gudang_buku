import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/common.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discount_request.pb.dart';
import 'package:gudang_buku/domain/dto/discovery_request.pb.dart';
import 'package:gudang_buku/domain/dto/discovery_response.pb.dart';
import 'package:gudang_buku/domain/dto/discovery_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/dto_fs/amount_type_response.dart';
import 'package:gudang_buku/domain/dto_fs/author_book_response.dart';
import 'package:gudang_buku/domain/dto_fs/author_response.dart';
import 'package:gudang_buku/domain/dto_fs/book_response.dart';
import 'package:gudang_buku/domain/dto_fs/event_response.dart';
import 'package:gudang_buku/domain/dto_fs/favorite_response.dart';
import 'package:gudang_buku/domain/dto_fs/media_response.dart';
import 'package:gudang_buku/domain/dto_fs/review_response.dart';
import 'package:gudang_buku/domain/model/event_model.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/domain/model/promo_model.dart';
import 'package:gudang_buku/domain/dto_fs/promo_response.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomeViewController {
  const HomeViewController({
    required AuthServiceImpl authServiceFS,
    required BookServiceClient bookServiceClient,
    required DiscoveryServiceClient discoveryServiceClient,
  })  : _authServiceFS = authServiceFS,
        _bookServiceClient = bookServiceClient,
        _discoveryServiceClient = discoveryServiceClient;

  final BookServiceClient _bookServiceClient;
  final DiscoveryServiceClient _discoveryServiceClient;

  final AuthServiceImpl _authServiceFS;

  Future<Either<Failure, List<DiscoveryResponse>>> getAllDiscoveries() async {
    try {
      final Map<int, DiscoveryResponse> discoveryMap =
          <int, DiscoveryResponse>{};

      final ResponseStream<DiscoveryResponse> response =
          _discoveryServiceClient.listDiscoveries(ListDiscoveryRequest());

      await for (final DiscoveryResponse discovery in response) {
        final int key = discovery.id.toInt();
        discoveryMap[key] ??= DiscoveryResponse();

        switch (discovery.whichData()) {
          case DiscoveryResponse_Data.content:
            discoveryMap[key]?.content = discovery.content;
            break;
          case DiscoveryResponse_Data.imageData:
            switch (discoveryMap[key]?.imageData.whichData()) {
              case ImageData_Data.chunk:
                discoveryMap[key]?.imageData.chunk;
                break;
              case ImageData_Data.metaData:
                break;
              case ImageData_Data.notSet:
              case null:
                break;
            }
            break;
          case DiscoveryResponse_Data.book:
            switch (discoveryMap[key]?.book.whichData()) {
              case BookResponse_Data.imageData:
                break;
              case BookResponse_Data.content:
                break;
              case BookResponse_Data.pagination:
                break;
              case BookResponse_Data.notSet:
              case null:
                break;
            }
            break;
          case DiscoveryResponse_Data.notSet:
            break;
          default:
        }
      }
    } on GrpcError catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      Left(ServerFailure(e.toString()));
    }

    return Left(ServerFailure('hi'));
  }

  Future<Either<Failure, List<EventModel>>> getAllEvents() async {
    final Either<Failure, List<EventResponse>> eventRes =
        await _eventRepository.fetchAllEvents();

    return eventRes.fold(
      (l) => Left(l),
      (List<EventResponse> eventResponses) =>
          Right(_createEvents(eventResponses)),
    );
  }

  Future<Either<Failure, String>> addToFavorite({
    required String bookId,
  }) async {
    return _favoriteRepository.addFavorite(
      userId: _authServiceFS.getUser().uid,
      bookId: bookId,
    );
  }

  Future<Either<Failure, void>> removeFromFavorite({
    required String bookId,
  }) async {
    return _favoriteRepository.removeFavorite(
      userId: _authServiceFS.getUser().uid,
      bookId: bookId,
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

      String imageUrl = mediaResponses[0].url!;

      if (!Uri.parse(imageUrl).hasScheme) {
        imageUrl =
            await FirebaseStorage.instance.ref(imageUrl).getDownloadURL();
      }

      final List<String> imageUrls = <String>[];

      for (final MediaResponse media in mediaResponses) {
        String imageUrl = media.url!;

        if (!Uri.parse(imageUrl).hasScheme) {
          imageUrl =
              await FirebaseStorage.instance.ref(imageUrl).getDownloadURL();
        }

        imageUrls.add(imageUrl);
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
        stock: bookResponse.stock ?? 0,
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

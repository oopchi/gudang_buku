import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/dto/author_book_response.dart';
import 'package:bookstore/domain/dto/author_response.dart';
import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/favorite_response.dart';
import 'package:bookstore/domain/dto/genre_response.dart';
import 'package:bookstore/domain/dto/media_response.dart';
import 'package:bookstore/domain/dto/review_response.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/domain/repository/author_book_repository.dart';
import 'package:bookstore/domain/repository/author_repository.dart';
import 'package:bookstore/domain/repository/book_genre_repository.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/domain/repository/favorite_repository.dart';
import 'package:bookstore/domain/repository/genre_repository.dart';
import 'package:bookstore/domain/repository/media_repository.dart';
import 'package:bookstore/domain/repository/review_repository.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

enum SortBy {
  popular,
  newest,
  customerReview,
  priceLowestToHighest,
  priceHighestToLowest,
}

extension SortByExt on SortBy {
  static final Map<SortBy, String> _texts = <SortBy, String>{
    SortBy.popular: 'Popular',
    SortBy.newest: 'Newest',
    SortBy.customerReview: 'Customer Review',
    SortBy.priceHighestToLowest: 'Price: Highest To Lowest',
    SortBy.priceLowestToHighest: 'Price: Lowest To Highest',
  };

  String get text => _texts[this]!;

  static final Map<String, SortBy> _objects = <String, SortBy>{
    'popular': SortBy.popular,
    'newest': SortBy.newest,
    'customer-review': SortBy.customerReview,
    'price-highest-to-lowest': SortBy.priceHighestToLowest,
    'price-lowest-to-highest': SortBy.priceLowestToHighest,
  };

  static SortBy? getObjFromString(String name) =>
      _objects[name.trim().toLowerCase()];
}

class ShopViewController {
  const ShopViewController({
    required GenreRepository genreRepository,
    required BookRepository bookRepository,
    required FavoriteRepository favoriteRepository,
    required AuthServiceFS authServiceFS,
    required MediaRepository mediaRepository,
    required AuthorBookRepository authorBookRepository,
    required ReviewRepository reviewRepository,
    required AuthorRepository authorRepository,
    required BookGenreRepository bookGenreRepository,
  })  : _genreRepository = genreRepository,
        _bookGenreRepository = bookGenreRepository,
        _mediaRepository = mediaRepository,
        _favoriteRepository = favoriteRepository,
        _authServiceFS = authServiceFS,
        _authorBookRepository = authorBookRepository,
        _reviewRepository = reviewRepository,
        _authorRepository = authorRepository,
        _bookRepository = bookRepository;

  final GenreRepository _genreRepository;
  final BookRepository _bookRepository;
  final FavoriteRepository _favoriteRepository;
  final MediaRepository _mediaRepository;
  final AuthorBookRepository _authorBookRepository;
  final ReviewRepository _reviewRepository;
  final AuthorRepository _authorRepository;
  final BookGenreRepository _bookGenreRepository;

  final AuthServiceFS _authServiceFS;

  Future<Either<Failure, List<GenreModel>>> loadAllGenre() async {
    final Either<Failure, List<GenreResponse>> genreRes =
        await _genreRepository.fetchAllGenres();

    if (genreRes.isLeft()) {
      return Left(genreRes.asLeft());
    }

    final List<GenreResponse> genreResponses = genreRes.asRight();

    final List<GenreModel> genreModel =
        _genreModelsFromResponses(genreResponses);

    return Right(genreModel);
  }

  Future<Either<Failure, List<ProductCardModel>>> loadAllProductForGenreId(
    String genreId, {
    SortBy? sortBy,
    required List<FilterModel> filterModels,
  }) async {
    late final Either<Failure, List<BookResponse>> bookRes;
    genreId = genreId.trim().toLowerCase();
    if (genreId == '') {
      bookRes = await _bookRepository.fetchAllBooks();
    } else {
      final Either<Failure, List<String>> bookIdRes =
          await _bookGenreRepository.fetchAllBookIdWithGenreId(
        genreId: genreId,
      );

      if (bookIdRes.isLeft()) {
        return Left(bookIdRes.asLeft());
      }

      final List<String> bookIds = bookIdRes.asRight();

      bookRes = await _bookRepository.fetchAllBooksWithIds(
        ids: bookIds,
      );
    }

    if (bookRes.isLeft()) {
      return Left(bookRes.asLeft());
    }

    final Either<Failure, List<ProductCardModel>> productRes =
        await _productCardModelsFromResponses(bookRes.asRight());

    if (productRes.isLeft()) {
      return Left(productRes.asLeft());
    }

    final List<ProductCardModel> filteredProducts =
        _filterBy(productRes.asRight(), filterModels);

    return Right(_sortBy(filteredProducts, sortBy));
  }

  Future<Either<Failure, List<ProductCardModel>>>
      _productCardModelsFromResponses(List<BookResponse> bookResponses) async {
    final List<ProductCardModel> productCardModels = <ProductCardModel>[];

    final Either<Failure, List<FavoriteResponse>> favoriteRes =
        await _favoriteRepository.fetchAllFavoritesForUserId(
      userId: _authServiceFS.getUser().uid,
    );

    if (favoriteRes.isLeft()) {
      return Left(favoriteRes.asLeft());
    }

    final List<FavoriteResponse> userFavoriteResponse = favoriteRes.asRight();

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

      productCardModels.add(productCardModel);
    }

    return Right(productCardModels);
  }

  List<GenreModel> _genreModelsFromResponses(
      List<GenreResponse> genreResponses) {
    final List<GenreModel> genreModels = <GenreModel>[];

    for (final GenreResponse genreResp in genreResponses) {
      final GenreModel genreModel = GenreModel(
        name: genreResp.name!,
        id: genreResp.id!,
      );

      genreModels.add(genreModel);
    }

    return genreModels;
  }

  List<ProductCardModel> _sortBy(
      List<ProductCardModel> products, SortBy? sortTech) {
    final List<ProductCardModel> result = List.from(products);

    switch (sortTech) {
      case SortBy.customerReview:
        result.sort(
          (a, b) {
            if (b.rating == a.rating) {
              return b.numOfRating - a.numOfRating;
            }

            return (b.rating - a.rating).toInt();
          },
        );
        break;
      case SortBy.priceHighestToLowest:
        result.sort(
          (a, b) => b.price - a.price,
        );
        break;
      case SortBy.priceLowestToHighest:
        result.sort(
          (a, b) => a.price - b.price,
        );
        break;
      case SortBy.popular:
      case SortBy.newest:
        break;
      default:
    }

    return result;
  }

  List<ProductCardModel> _filterBy(
    List<ProductCardModel> products,
    List<FilterModel> filterModels,
  ) {
    final List<ProductCardModel> result = List.from(products);

    for (final FilterModel filterModel in filterModels) {
      if (filterModel is FilterByPriceRange) {
        result.retainWhere((element) =>
            element.price >= filterModel.minimumPrice &&
            element.price <= filterModel.maximumPrice);
      }

      if (filterModel is FilterByRatingRange) {
        result.retainWhere((element) =>
            element.rating >= filterModel.minimumRating &&
            element.rating <= filterModel.maximumRating);
      }
    }

    return result;
  }
}

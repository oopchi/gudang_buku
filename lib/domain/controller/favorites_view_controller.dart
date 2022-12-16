import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/dto/author_book_response.dart';
import 'package:gudang_buku/domain/dto/author_response.dart';
import 'package:gudang_buku/domain/dto/book_response.dart';
import 'package:gudang_buku/domain/dto/favorite_response.dart';
import 'package:gudang_buku/domain/dto/genre_response.dart';
import 'package:gudang_buku/domain/dto/media_response.dart';
import 'package:gudang_buku/domain/dto/review_response.dart';
import 'package:gudang_buku/domain/dto/transaction_detail_response.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/filter_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/domain/repository/author_book_repository.dart';
import 'package:gudang_buku/domain/repository/author_repository.dart';
import 'package:gudang_buku/domain/repository/book_genre_repository.dart';
import 'package:gudang_buku/domain/repository/book_repository.dart';
import 'package:gudang_buku/domain/repository/favorite_repository.dart';
import 'package:gudang_buku/domain/repository/genre_repository.dart';
import 'package:gudang_buku/domain/repository/media_repository.dart';
import 'package:gudang_buku/domain/repository/review_repository.dart';
import 'package:gudang_buku/domain/repository/transaction_detail_repository.dart';
import 'package:gudang_buku/domain/repository/transaction_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/sort_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FavoritesViewController {
  const FavoritesViewController({
    required GenreRepository genreRepository,
    required BookRepository bookRepository,
    required FavoriteRepository favoriteRepository,
    required AuthServiceFS authServiceFS,
    required MediaRepository mediaRepository,
    required AuthorBookRepository authorBookRepository,
    required ReviewRepository reviewRepository,
    required AuthorRepository authorRepository,
    required BookGenreRepository bookGenreRepository,
    required TransactionDetailRepository transactionDetailRepository,
    required TransactionRepository transactionRepository,
  })  : _genreRepository = genreRepository,
        _bookGenreRepository = bookGenreRepository,
        _mediaRepository = mediaRepository,
        _favoriteRepository = favoriteRepository,
        _authServiceFS = authServiceFS,
        _authorBookRepository = authorBookRepository,
        _reviewRepository = reviewRepository,
        _authorRepository = authorRepository,
        _transactionDetailRepository = transactionDetailRepository,
        _transactionRepository = transactionRepository,
        _bookRepository = bookRepository;

  final GenreRepository _genreRepository;
  final BookRepository _bookRepository;
  final FavoriteRepository _favoriteRepository;
  final MediaRepository _mediaRepository;
  final AuthorBookRepository _authorBookRepository;
  final ReviewRepository _reviewRepository;
  final AuthorRepository _authorRepository;
  final BookGenreRepository _bookGenreRepository;
  final TransactionDetailRepository _transactionDetailRepository;
  final TransactionRepository _transactionRepository;

  final AuthServiceFS _authServiceFS;

  Future<Either<Failure, void>> removeFromFavorite({
    required String bookId,
  }) async {
    return _favoriteRepository.removeFavorite(
      userId: _authServiceFS.getUser().uid,
      bookId: bookId,
    );
  }

  Future<Either<Failure, String>> addToCart({
    required String productId,
  }) async {
    final Either<Failure, String> cartIdRes =
        await _transactionRepository.getCartTransactionId(
      uid: _authServiceFS.getUser().uid,
    );

    if (cartIdRes.isLeft()) {
      return Left(cartIdRes.asLeft());
    }

    final String cartId = cartIdRes.asRight();

    final Either<Failure, String> cartDetailIdRes =
        await _transactionDetailRepository.addCartTransactionDetail(
      transactionId: cartId,
      bookId: productId,
      quantity: 1,
    );

    if (cartDetailIdRes.isLeft()) {
      return Left(cartDetailIdRes.asLeft());
    }

    return Right(cartDetailIdRes.asRight());
  }

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

  Future<Either<Failure, List<ProductModel>>> loadAllFavoriteProductForGenreId(
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

    final Either<Failure, List<ProductModel>> productRes =
        await _productCardModelsFromResponses(bookRes.asRight());

    if (productRes.isLeft()) {
      return Left(productRes.asLeft());
    }

    final List<ProductModel> favProducts = productRes.asRight()
      ..removeWhere((element) => !element.favoriteButtonModel.isFavorite);

    final List<ProductModel> filteredProducts =
        _filterBy(favProducts, filterModels);

    return Right(await _sortBy(filteredProducts, sortBy));
  }

  Future<Either<Failure, List<ProductModel>>> _productCardModelsFromResponses(
      List<BookResponse> bookResponses) async {
    final List<ProductModel> productCardModels = <ProductModel>[];

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

  Future<List<ProductModel>> _sortBy(
      List<ProductModel> products, SortBy? sortTech) async {
    final List<ProductModel> result = List.from(products);

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
        final Either<Failure, List<TransactionDetailResponse>>
            transactionDetailRes =
            await _transactionDetailRepository.fetchAllTransactionDetail();

        if (transactionDetailRes.isLeft()) {
          return result;
        }

        final List<TransactionDetailResponse> transactionDetailResponses =
            transactionDetailRes.asRight();

        final Map<String, int> quantityMap = <String, int>{
          for (final ProductModel res in result) res.id: 0
        };

        for (final TransactionDetailResponse res
            in transactionDetailResponses) {
          quantityMap[res.bookId!] = quantityMap[res.bookId!]! + res.quantity!;
        }

        result.sort(
          (a, b) => quantityMap[b.id]! - quantityMap[a.id]!,
        );
        break;
      case SortBy.newest:
        break;
      default:
    }

    return result;
  }

  List<ProductModel> _filterBy(
    List<ProductModel> products,
    List<FilterModel> filterModels,
  ) {
    final List<ProductModel> result = List.from(products);

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

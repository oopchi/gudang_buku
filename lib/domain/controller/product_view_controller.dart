import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/dto_fs/author_book_response.dart';
import 'package:gudang_buku/domain/dto_fs/author_response.dart';
import 'package:gudang_buku/domain/dto_fs/book_response.dart';
import 'package:gudang_buku/domain/dto_fs/favorite_response.dart';
import 'package:gudang_buku/domain/dto_fs/media_response.dart';
import 'package:gudang_buku/domain/dto_fs/review_response.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/infra/repository/author_book_repository.dart';
import 'package:gudang_buku/infra/repository/author_repository.dart';
import 'package:gudang_buku/infra/repository/book_genre_repository.dart';
import 'package:gudang_buku/infra/repository/book_repository.dart';
import 'package:gudang_buku/infra/repository/favorite_repository.dart';
import 'package:gudang_buku/infra/repository/genre_repository.dart';
import 'package:gudang_buku/infra/repository/media_repository.dart';
import 'package:gudang_buku/infra/repository/review_repository.dart';
import 'package:gudang_buku/infra/repository/transaction_detail_repository.dart';
import 'package:gudang_buku/infra/repository/transaction_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductViewController {
  const ProductViewController({
    required GenreRepository genreRepository,
    required BookRepository bookRepository,
    required FavoriteRepository favoriteRepository,
    required AuthServiceImpl authService,
    required MediaRepository mediaRepository,
    required AuthorBookRepository authorBookRepository,
    required ReviewRepository reviewRepository,
    required AuthorRepository authorRepository,
    required BookGenreRepository bookGenreRepository,
    required TransactionDetailRepository transactionDetailRepository,
    required TransactionRepository transactionRepository,
  })  : _mediaRepository = mediaRepository,
        _favoriteRepository = favoriteRepository,
        _authService = authService,
        _authorBookRepository = authorBookRepository,
        _transactionDetailRepository = transactionDetailRepository,
        _transactionRepository = transactionRepository,
        _reviewRepository = reviewRepository,
        _authorRepository = authorRepository,
        _bookRepository = bookRepository;

  final BookRepository _bookRepository;
  final FavoriteRepository _favoriteRepository;
  final MediaRepository _mediaRepository;
  final AuthorBookRepository _authorBookRepository;
  final ReviewRepository _reviewRepository;
  final AuthorRepository _authorRepository;
  final TransactionDetailRepository _transactionDetailRepository;
  final TransactionRepository _transactionRepository;

  final AuthServiceImpl _authService;

  Future<Either<Failure, String>> addToFavorite({
    required String bookId,
  }) async {
    return _favoriteRepository.addFavorite(
      userId: _authService.getUser().uid,
      bookId: bookId,
    );
  }

  Future<Either<Failure, void>> removeFromFavorite({
    required String bookId,
  }) async {
    return _favoriteRepository.removeFavorite(
      userId: _authService.getUser().uid,
      bookId: bookId,
    );
  }

  Future<Either<Failure, String>> addToCart({
    required String productId,
  }) async {
    final Either<Failure, String> cartIdRes =
        await _transactionRepository.getCartTransactionId(
      uid: _authService.getUser().uid,
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

  Future<Either<Failure, ProductModel>> getProductModelForId(
      String productId) async {
    final Either<Failure, BookResponse> bookResp =
        await _bookRepository.fetchBook(
      id: productId,
    );

    if (bookResp.isLeft()) {
      return Left(bookResp.asLeft());
    }

    final BookResponse bookResponse = bookResp.asRight();

    final Either<Failure, List<FavoriteResponse>> favoriteRes =
        await _favoriteRepository.fetchAllFavoritesForUserId(
      userId: _authService.getUser().uid,
    );

    if (favoriteRes.isLeft()) {
      return Left(favoriteRes.asLeft());
    }

    final List<FavoriteResponse> userFavoriteResponse = favoriteRes.asRight();

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
      imageUrl = await FirebaseStorage.instance.ref(imageUrl).getDownloadURL();
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

    return Right(productCardModel);
  }
}

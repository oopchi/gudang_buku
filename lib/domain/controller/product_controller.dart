import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/dto/author_book_response.dart';
import 'package:gudang_buku/domain/dto/author_response.dart';
import 'package:gudang_buku/domain/dto/book_response.dart';
import 'package:gudang_buku/domain/dto/favorite_response.dart';
import 'package:gudang_buku/domain/dto/media_response.dart';
import 'package:gudang_buku/domain/dto/review_response.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/domain/repository/author_book_repository.dart';
import 'package:gudang_buku/domain/repository/author_repository.dart';
import 'package:gudang_buku/domain/repository/book_repository.dart';
import 'package:gudang_buku/domain/repository/favorite_repository.dart';
import 'package:gudang_buku/domain/repository/media_repository.dart';
import 'package:gudang_buku/domain/repository/review_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductController {
  const ProductController({
    required BookRepository bookRepository,
    required ReviewRepository reviewRepository,
    required FavoriteRepository favoriteRepository,
    required MediaRepository mediaRepository,
    required AuthorBookRepository authorBookRepository,
    required AuthorRepository authorRepository,
    required AuthServiceFS authServiceFS,
  })  : _bookRepository = bookRepository,
        _favoriteRepository = favoriteRepository,
        _authorBookRepository = authorBookRepository,
        _mediaRepository = mediaRepository,
        _reviewRepository = reviewRepository,
        _authServiceFS = authServiceFS,
        _authorRepository = authorRepository;

  final AuthorRepository _authorRepository;
  final BookRepository _bookRepository;
  final ReviewRepository _reviewRepository;
  final FavoriteRepository _favoriteRepository;
  final MediaRepository _mediaRepository;
  final AuthorBookRepository _authorBookRepository;

  final AuthServiceFS _authServiceFS;

  Future<Either<Failure, List<ProductModel>>> loadAllProductWithIds(
    List<String> ids,
  ) async {
    final Either<Failure, List<BookResponse>> bookRes =
        await _bookRepository.fetchAllBooksWithIds(
      ids: ids,
    );

    if (bookRes.isLeft()) {
      return Left(bookRes.asLeft());
    }

    return await _productCardModelsFromResponses(bookRes.asRight());
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
}

import 'package:gudang_buku/domain/dto/favorite_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteResponse>>> fetchAllFavoritesForUserId({
    required String userId,
  });

  Future<Either<Failure, String>> addFavorite({
    required String userId,
    required String bookId,
  });

  Future<Either<Failure, void>> removeFavorite({
    required String userId,
    required String bookId,
  });
}

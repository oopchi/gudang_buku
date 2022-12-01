import 'package:bookstore/domain/dto/favorite_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteResponse>>> fetchAllFavoritesForUserId({
    required String userId,
  });
}

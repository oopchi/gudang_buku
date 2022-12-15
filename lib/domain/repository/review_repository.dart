import 'package:gudangBuku/domain/dto/review_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviews();

  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviewsWithBookId({
    required String bookId,
  });
}

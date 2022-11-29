import 'package:bookstore/domain/dto/review_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviews();

  Future<Either<Failure, List<ReviewResponse>>> fetchAllReviewsWithBookId({
    required String bookId,
  });
}

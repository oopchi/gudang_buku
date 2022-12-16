import 'package:gudang_buku/domain/dto/newsletter_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class NewsletterRepository {
  Future<Either<Failure, List<NewsletterResponse>>> fetchAllNewsletters();
  Future<Either<Failure, String>> addNewsletterSubscriber({
    required String email,
  });
}

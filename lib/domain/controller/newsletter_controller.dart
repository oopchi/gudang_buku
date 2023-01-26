import 'package:dartz/dartz.dart';
import 'package:gudang_buku/infra/repository/newsletter_repository.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class NewsletterController {
  const NewsletterController({
    required NewsletterRepository newsletterRepository,
  }) : _newsletterRepository = newsletterRepository;

  final NewsletterRepository _newsletterRepository;

  Future<Either<Failure, String>> addNewsletterSubscriber({
    required String email,
  }) async {
    return _newsletterRepository.addNewsletterSubscriber(
      email: email,
    );
  }
}

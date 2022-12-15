import 'package:gudangBuku/domain/dto/media_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class MediaRepository {
  Future<Either<Failure, List<MediaResponse>>> fetchAllMedias();
  Future<Either<Failure, List<MediaResponse>>> fetchAllMediasWithBookId({
    required String bookId,
  });
  Future<Either<Failure, String>> addMedia({
    required MediaResponse mediaResponse,
  });
}

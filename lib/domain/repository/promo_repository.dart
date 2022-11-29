import 'package:bookstore/domain/dto/promo_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class PromoRepository {
  Future<Either<Failure, List<PromoResponse>>> fetchAllPromos();
  Future<Either<Failure, List<PromoResponse>>> fetchAllOngoingPromos();
}

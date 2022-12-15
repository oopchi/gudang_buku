import 'package:gudangBuku/domain/dto/discount_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class DiscountRepository {
  Future<Either<Failure, List<DiscountResponse>>> fetchAllDiscounts();
  Future<Either<Failure, List<DiscountResponse>>> fetchAllOngoingDiscounts();
}

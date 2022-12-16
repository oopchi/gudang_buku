import 'package:gudang_buku/domain/dto/discount_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class DiscountRepository {
  Future<Either<Failure, List<DiscountResponse>>> fetchAllDiscounts();
  Future<Either<Failure, List<DiscountResponse>>> fetchAllOngoingDiscounts();
  Future<Either<Failure, DiscountResponse>> fetchDiscountWithId(
    String id,
  );
}

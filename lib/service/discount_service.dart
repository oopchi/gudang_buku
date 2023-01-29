import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/discount_request.pb.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class DiscountService {
  Future<Either<Failure, List<DiscountModel>>> getAllDiscounts(
      ListDiscountRequest request);
}

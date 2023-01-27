import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class PromoCodeService {
  Future<Either<Failure, List<PromoCodeModel>>> getAllPromoCodes();
}

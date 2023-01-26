import 'package:gudang_buku/domain/dto_fs/amount_type_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AmountTypeRepository {
  Future<Either<Failure, List<AmountTypeResponse>>> fetchAllAmountType();
}

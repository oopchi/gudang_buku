import 'package:gudangBuku/domain/dto/amount_type_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AmountTypeRepository {
  Future<Either<Failure, List<AmountTypeResponse>>> fetchAllAmountType();
}

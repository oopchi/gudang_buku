import 'package:gudang_buku/domain/dto_fs/user_discount_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class UserDiscountRepository {
  Future<Either<Failure, List<UserDiscountResponse>>> fetchAllUserDiscounts({
    required String uid,
  });
}

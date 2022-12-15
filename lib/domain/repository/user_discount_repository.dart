import 'package:gudangBuku/domain/dto/user_discount_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class UserDiscountRepository {
  Future<Either<Failure, List<UserDiscountResponse>>> fetchAllUserDiscounts({
    required String uid,
  });
}

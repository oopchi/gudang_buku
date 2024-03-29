import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/dto/discount_response.dart';
import 'package:gudang_buku/domain/dto/user_discount_response.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/repository/discount_repository.dart';
import 'package:gudang_buku/domain/repository/user_discount_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class DiscountController {
  const DiscountController({
    required UserDiscountRepository userDiscountRepository,
    required DiscountRepository discountRepository,
    required AuthServiceFS authServiceFS,
  })  : _userDiscountRepository = userDiscountRepository,
        _authServiceFS = authServiceFS,
        _discountRepository = discountRepository;

  final UserDiscountRepository _userDiscountRepository;
  final DiscountRepository _discountRepository;

  final AuthServiceFS _authServiceFS;

  Future<Either<Failure, DiscountModel>> getDiscountWithId(String id) async {
    final Either<Failure, DiscountResponse> discountRes =
        await _discountRepository.fetchDiscountWithId(id);

    if (discountRes.isLeft()) {
      return Left(discountRes.asLeft());
    }

    final DiscountResponse discountResponse = discountRes.asRight();
    final Uri uri = Uri.parse(discountResponse.url!);

    late final String imageUrl;

    if (uri.hasScheme) {
      imageUrl = discountResponse.url!;
    } else {
      final FirebaseStorage storage = FirebaseStorage.instance;

      imageUrl = await storage.ref(discountResponse.url!).getDownloadURL();
    }

    DateTimeRange? dateTimeRange;

    if (discountResponse.startDate != null &&
        discountResponse.endDate != null) {
      dateTimeRange = DateTimeRange(
        start: discountResponse.startDate!,
        end: discountResponse.endDate!,
      );
    }

    final DiscountModel discountModel = DiscountModel(
      id: discountResponse.id!,
      name: discountResponse.description!,
      maxUse: discountResponse.maxUse,
      amount: discountResponse.amount!,
      amountType: discountResponse.amountType!,
      code: discountResponse.name!,
      maxAmount: discountResponse.maxAmount,
      imageUrl: imageUrl,
      minAmount: discountResponse.minAmount ?? 0,
      dateTimeRange: dateTimeRange,
    );

    return Right(discountModel);
  }

  Future<Either<Failure, List<DiscountModel>>>
      getAllDiscountsForCurrentUser() async {
    final Either<Failure, List<UserDiscountResponse>> userDiscountsRes =
        await _userDiscountRepository.fetchAllUserDiscounts(
      uid: _authServiceFS.getUser().uid,
    );

    if (userDiscountsRes.isLeft()) {
      return Left(userDiscountsRes.asLeft());
    }

    final List<UserDiscountResponse> userDiscounts = userDiscountsRes.asRight();

    final Either<Failure, List<DiscountResponse>> discountsRes =
        await _discountRepository.fetchAllOngoingDiscounts();

    if (discountsRes.isLeft()) {
      return Left(discountsRes.asLeft());
    }

    final List<DiscountResponse> discounts = discountsRes.asRight();

    final Map<String, int> numOfUse = {
      for (final UserDiscountResponse userDiscount in userDiscounts)
        userDiscount.discountId!: userDiscount.numUsed!,
    };

    discounts.retainWhere(
      (element) =>
          numOfUse.containsKey(element.id) &&
          numOfUse[element.id]! < element.maxUse!,
    );

    final FirebaseStorage storage = FirebaseStorage.instance;

    final List<DiscountModel> discountModels = <DiscountModel>[];

    for (final DiscountResponse e in discounts) {
      final Uri uri = Uri.parse(e.url!);

      late final String imageUrl;

      if (uri.hasScheme) {
        imageUrl = e.url!;
      } else {
        imageUrl = await storage.ref(e.url!).getDownloadURL();
      }

      DateTimeRange? dateTimeRange;

      if (e.startDate != null && e.endDate != null) {
        dateTimeRange = DateTimeRange(
          start: e.startDate!,
          end: e.endDate!,
        );
      }

      final DiscountModel discountModel = DiscountModel(
        id: e.id!,
        name: e.description!,
        maxUse: e.maxUse,
        amount: e.amount!,
        amountType: e.amountType!,
        code: e.name!,
        maxAmount: e.maxAmount,
        imageUrl: imageUrl,
        minAmount: e.minAmount ?? 0,
        dateTimeRange: dateTimeRange,
      );

      discountModels.add(discountModel);
    }

    return Right(discountModels);
  }
}

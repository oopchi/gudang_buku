import 'package:dartz/dartz.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';

import 'state.dart';

class DiscountSheetCubit extends Cubit<DiscountSheetState> {
  DiscountSheetCubit({
    required this.isMounted,
    required DiscountController discountController,
  })  : _discountController = discountController,
        super(const DiscountSheetLoading());

  final DiscountController _discountController;
  final bool Function() isMounted;

  Future<void> load() async {
    final Either<Failure, List<DiscountModel>> discountsRes =
        await _discountController.getAllDiscountsForCurrentUser();

    if (discountsRes.isLeft()) {
      _emit(DiscountSheetFailure(message: discountsRes.asLeft().message));
      return;
    }

    final List<DiscountModel> discounts = discountsRes.asRight();

    _emit(DiscountSheetAllDiscounts(
      discounts: discounts,
    ));
    _emit(DiscountSheetFilteredDiscounts(
      discounts: discounts,
    ));
  }

  void search(DiscountSheetAllDiscounts allDiscountsState, String keyword) {
    EasyDebounce.debounce(
      'search',
      const Duration(
        milliseconds: 500,
      ),
      () => _search(allDiscountsState, keyword),
    );
  }

  Future<void> _search(
      DiscountSheetAllDiscounts allDiscountsState, String keyword) async {
    _emit(const DiscountSheetSmallLoading());
    final String trimmedKeyword = keyword.trim();

    if (trimmedKeyword == '') {
      _emit(DiscountSheetFilteredDiscounts(
        discounts: allDiscountsState.discounts,
      ));
      return;
    }

    final List<DiscountModel> filteredDiscounts = [
      ...allDiscountsState.discounts
    ]..retainWhere((element) =>
        element.name.toLowerCase().contains(keyword.toLowerCase()));

    _emit(DiscountSheetFilteredDiscounts(
      discounts: filteredDiscounts,
    ));
  }

  void _emit(DiscountSheetState newState) {
    if (!isMounted()) return;

    emit(newState);
  }
}

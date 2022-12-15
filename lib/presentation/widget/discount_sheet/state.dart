import 'package:equatable/equatable.dart';
import 'package:gudangBuku/domain/model/discount_model.dart';

class DiscountSheetState extends Equatable {
  const DiscountSheetState();

  DiscountSheetState init() {
    return const DiscountSheetState();
  }

  DiscountSheetState clone() {
    return const DiscountSheetState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class DiscountSheetLoading extends DiscountSheetState {
  const DiscountSheetLoading();
}

class DiscountSheetSmallLoading extends DiscountSheetState {
  const DiscountSheetSmallLoading();
}

class DiscountSheetFailure extends DiscountSheetState {
  const DiscountSheetFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class DiscountSheetAllDiscounts extends DiscountSheetState {
  const DiscountSheetAllDiscounts({
    required this.discounts,
  });

  final List<DiscountModel> discounts;

  @override
  List<Object?> get props => <Object?>[
        discounts,
      ];
}

class DiscountSheetFilteredDiscounts extends DiscountSheetState {
  const DiscountSheetFilteredDiscounts({
    required this.discounts,
  });

  final List<DiscountModel> discounts;

  @override
  List<Object?> get props => <Object?>[
        discounts,
      ];
}

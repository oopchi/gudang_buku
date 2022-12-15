import 'package:gudangBuku/domain/dto/discount_response.dart';
import 'package:gudangBuku/domain/model/discount_model.dart';
import 'package:gudangBuku/domain/model/product_model.dart';
import 'package:equatable/equatable.dart';

class CartMobileState extends Equatable {
  const CartMobileState();

  CartMobileState init() {
    return const CartMobileState();
  }

  CartMobileState clone() {
    return const CartMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class CartMobileFailure extends CartMobileState {
  const CartMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class CartMobileLoading extends CartMobileState {
  const CartMobileLoading();
  @override
  List<Object?> get props => <Object?>[];
}

class CartMobileFavoriteSuccess extends CartMobileState {
  const CartMobileFavoriteSuccess({
    required this.dateTime,
  });

  // to bypass equatable behavior and re-update the snackbar
  final DateTime dateTime;

  @override
  List<Object?> get props => <Object?>[
        dateTime,
      ];
}

class CartMobileBlockQtyChange extends CartMobileState {}

class CartMobileLoaded extends CartMobileState {
  const CartMobileLoaded({
    required this.products,
    required this.stocks,
    this.discount,
    this.total = 0,
    this.actualTotal = 0,
  });

  final List<ProductModel> products;
  final Map<String, int> stocks;
  final DiscountModel? discount;
  final double total;
  final double actualTotal;

  @override
  List<Object?> get props => <Object?>[
        products,
        stocks,
        discount,
        actualTotal,
        total,
      ];
}

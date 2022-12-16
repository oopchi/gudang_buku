import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductMobileState extends Equatable {
  const ProductMobileState();

  ProductMobileState init() {
    return const ProductMobileState();
  }

  ProductMobileState clone() {
    return const ProductMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class ProductMobileLoading extends ProductMobileState {
  const ProductMobileLoading();
}

class ProductMobileFailure extends ProductMobileState {
  const ProductMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class ProductMobileLoaded extends ProductMobileState {
  const ProductMobileLoaded({
    required this.product,
  });

  final ProductModel product;

  @override
  List<Object?> get props => <Object?>[
        product,
      ];
}

class ProductMobileRefresh extends ProductMobileState {
  const ProductMobileRefresh({
    required this.params,
  });
  final Map<String, String> params;

  @override
  List<Object?> get props => <Object?>[
        params,
      ];
}

class ProductAddToCartSuccess extends ProductMobileState {
  const ProductAddToCartSuccess({
    required DateTime dateTime,
  }) : _dateTime = dateTime;

  // To bypass equatable behavior
  final DateTime _dateTime;

  @override
  List<Object?> get props => <Object?>[
        _dateTime,
      ];
}

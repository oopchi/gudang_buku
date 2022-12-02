import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:equatable/equatable.dart';

class ShopMobileState extends Equatable {
  const ShopMobileState();

  ShopMobileState init() {
    return const ShopMobileState();
  }

  ShopMobileState clone() {
    return const ShopMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class ShopMobileLoading extends ShopMobileState {
  const ShopMobileLoading();
}

class ShopMobileFailure extends ShopMobileState {
  const ShopMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class ShopMobileLoaded extends ShopMobileState {
  const ShopMobileLoaded({
    required this.genres,
    required this.products,
    required this.filteredProducts,
  });

  final List<GenreModel> genres;
  final List<ProductCardModel> products;
  final List<ProductCardModel> filteredProducts;

  @override
  List<Object?> get props => <Object?>[
        genres,
        products,
        filteredProducts,
      ];
}

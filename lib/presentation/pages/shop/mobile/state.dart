import 'package:gudangBuku/domain/model/genre_model.dart';
import 'package:gudangBuku/domain/model/product_model.dart';
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
  List<Object?> get props => <Object?>[
        message,
      ];
}

class ShopMobileLoaded extends ShopMobileState {
  const ShopMobileLoaded({
    required this.genres,
    required this.products,
    required this.selectedGenre,
  });

  final List<GenreModel> genres;
  final List<ProductModel> products;
  final GenreModel selectedGenre;

  @override
  List<Object?> get props => <Object?>[
        genres,
        products,
        selectedGenre,
      ];

  ShopMobileLoaded copyWith({
    List<GenreModel>? genres,
    List<ProductModel>? products,
    GenreModel? selectedGenre,
  }) =>
      ShopMobileLoaded(
        genres: genres ?? this.genres,
        products: products ?? this.products,
        selectedGenre: selectedGenre ?? this.selectedGenre,
      );
}

class ShopMobileRefresh extends ShopMobileState {
  const ShopMobileRefresh({
    required this.params,
  });
  final Map<String, dynamic> params;

  @override
  List<Object?> get props => <Object?>[
        params,
      ];
}

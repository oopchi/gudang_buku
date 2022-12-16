import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:equatable/equatable.dart';

class FavoritesMobileState extends Equatable {
  const FavoritesMobileState();

  FavoritesMobileState init() {
    return const FavoritesMobileState();
  }

  FavoritesMobileState clone() {
    return const FavoritesMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class FavoritesMobileLoading extends FavoritesMobileState {
  const FavoritesMobileLoading();
}

class FavoritesMobileFailure extends FavoritesMobileState {
  const FavoritesMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}

class FavoritesMobileLoaded extends FavoritesMobileState {
  const FavoritesMobileLoaded({
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

  FavoritesMobileLoaded copyWith({
    List<GenreModel>? genres,
    List<ProductModel>? products,
    GenreModel? selectedGenre,
  }) =>
      FavoritesMobileLoaded(
        genres: genres ?? this.genres,
        products: products ?? this.products,
        selectedGenre: selectedGenre ?? this.selectedGenre,
      );
}

class FavoritesMobileRefresh extends FavoritesMobileState {
  const FavoritesMobileRefresh({
    required this.params,
  });
  final Map<String, dynamic> params;

  @override
  List<Object?> get props => <Object?>[
        params,
      ];
}

class FavoritesMobileAddToCartSuccess extends FavoritesMobileState {
  const FavoritesMobileAddToCartSuccess({
    required DateTime dateTime,
  }) : _dateTime = dateTime;

  // To bypass equatable behavior
  final DateTime _dateTime;

  @override
  List<Object?> get props => <Object?>[
        _dateTime,
      ];
}

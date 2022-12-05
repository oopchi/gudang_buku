import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:equatable/equatable.dart';

enum ListType {
  list,
  grid,
}

extension ListTypeExt on ListType {
  static final Map<String, ListType> _objs = <String, ListType>{
    'list': ListType.list,
    'grid': ListType.grid,
  };

  static ListType? fromString(String? name) =>
      _objs[name?.trim().toLowerCase()];
}

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
    required this.listType,
    required this.selectedGenre,
  });

  final List<GenreModel> genres;
  final List<ProductCardModel> products;
  final ListType listType;
  final GenreModel selectedGenre;

  @override
  List<Object?> get props => <Object?>[
        genres,
        products,
        listType,
      ];

  ShopMobileLoaded copyWith({
    List<GenreModel>? genres,
    List<ProductCardModel>? products,
    ListType? listType,
    GenreModel? selectedGenre,
  }) =>
      ShopMobileLoaded(
        genres: genres ?? this.genres,
        products: products ?? this.products,
        listType: listType ?? this.listType,
        selectedGenre: selectedGenre ?? this.selectedGenre,
      );
}

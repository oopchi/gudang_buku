import 'package:gudang_buku/domain/controller/shop_view_controller.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/filter_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/list_type_helper.dart';
import 'package:gudang_buku/util/sort_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

import 'state.dart';

class ShopMobileCubit extends Cubit<ShopMobileState> {
  ShopMobileCubit({
    required ShopViewController shopViewController,
    required this.isMounted,
  })  : _shopViewController = shopViewController,
        super(const ShopMobileLoading());

  final ShopViewController _shopViewController;
  final bool Function() isMounted;

  Future<void> load({
    required ListType listType,
    required String genreId,
    required List<FilterModel> filterModels,
    SortBy? sortBy,
  }) async {
    final Either<Failure, List<GenreModel>> genresResp =
        await _shopViewController.loadAllGenre();

    if (genresResp.isLeft()) {
      if (!isMounted()) return;

      emit(ShopMobileFailure(
        message: genresResp.asLeft().message,
      ));

      return;
    }

    final List<GenreModel> genreModels = genresResp.asRight();

    genreModels.insert(
        0,
        const GenreModel(
          name: 'All Genres',
          id: '',
        ));

    final int selectedGenreIdx =
        genreModels.indexWhere((element) => element.id == genreId);

    if (genreId != '' && selectedGenreIdx == -1) {
      if (!isMounted()) return;

      emit(const ShopMobileFailure(
        message: 'Genre Not Found',
      ));

      return;
    }

    final GenreModel selectedGenre = genreModels[selectedGenreIdx];

    final Either<Failure, List<ProductModel>> productsResp =
        await _shopViewController.loadAllProductForGenreId(
      genreId,
      sortBy: sortBy,
      filterModels: filterModels,
    );

    if (productsResp.isLeft()) {
      if (!isMounted()) return;

      emit(ShopMobileFailure(
        message: productsResp.asLeft().message,
      ));
      return;
    }

    if (!isMounted()) return;

    emit(ShopMobileLoaded(
      genres: genresResp.asRight(),
      products: productsResp.asRight(),
      selectedGenre: selectedGenre,
    ));
  }

  void refreshPageWithParam({
    required ListType listType,
    required String genreId,
    SortBy? sortBy,
    required List<FilterModel> filterModels,
  }) {
    final Map<String, dynamic> queryParams = <String, dynamic>{
      'listType': listType.text,
      'genreId': genreId,
      'sortBy': sortBy?.objectName,
      ..._filterMap(filterModels),
    };

    emit(ShopMobileRefresh(
      params: queryParams,
    ));
  }

  Map<String, dynamic> _filterMap(List<FilterModel> filterModels) {
    final Map<String, dynamic> map = <String, dynamic>{};

    for (final FilterModel filterModel in filterModels) {
      if (filterModel is FilterByPriceRange) {
        map['pmin'] = filterModel.minimumPrice.toString();
        map['pmax'] = filterModel.maximumPrice.toString();
      }

      if (filterModel is FilterByRatingRange) {
        map['rmin'] = filterModel.minimumRating.toInt().toString();
        map['rmax'] = filterModel.maximumRating.toInt().toString();
      }
    }

    return map;
  }

  Future<void> onRefresh({
    required VoidCallback onComplete,
    required String genreId,
    required List<FilterModel> filterModels,
    required ListType listType,
    SortBy? sortBy,
  }) async {
    await load(
      listType: listType,
      genreId: genreId,
      filterModels: filterModels,
      sortBy: sortBy,
    );

    onComplete();
  }

  Future<void> toggleFavorite({
    required List<GenreModel> genres,
    required List<ProductModel> products,
    required GenreModel selectedGenre,
    required ProductModel productModel,
  }) async {
    final List<GenreModel> genreC = List.from(genres);
    final List<ProductModel> productC =
        products.map((ProductModel e) => e.copyWith()).toList();

    if (productModel.favoriteButtonModel.isFavorite) {
      await _removeFromFavorites(
        genres: genreC,
        products: productC,
        selectedGenre: selectedGenre,
        productModel: productModel,
      );

      return;
    }

    await _addToFavorites(
      genres: genreC,
      products: productC,
      selectedGenre: selectedGenre,
      productModel: productModel,
    );
  }

  Future<void> _removeFromFavorites({
    required List<GenreModel> genres,
    required List<ProductModel> products,
    required GenreModel selectedGenre,
    required ProductModel productModel,
  }) async {
    final Either<Failure, void> removeFromFavRes =
        await _shopViewController.removeFromFavorite(
      bookId: productModel.id,
    );

    if (removeFromFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(ShopMobileFailure(message: removeFromFavRes.asLeft().message));
      return;
    }

    final int productIdx = products.indexWhere(
      (ProductModel element) => element == productModel,
    );

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: false,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );

    products.removeAt(productIdx);
    products.insert(productIdx, newModel);
    if (!isMounted()) return;

    emit(ShopMobileLoaded(
      genres: genres,
      products: products,
      selectedGenre: selectedGenre,
    ));
  }

  Future<void> _addToFavorites({
    required List<GenreModel> genres,
    required List<ProductModel> products,
    required GenreModel selectedGenre,
    required ProductModel productModel,
  }) async {
    final Either<Failure, String> addToFavRes =
        await _shopViewController.addToFavorite(
      bookId: productModel.id,
    );

    if (addToFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(ShopMobileFailure(message: addToFavRes.asLeft().message));
      return;
    }

    final int productIdx = products.indexWhere(
      (ProductModel element) => element == productModel,
    );

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: true,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );

    products.removeAt(productIdx);
    products.insert(productIdx, newModel);
    if (!isMounted()) return;

    emit(ShopMobileLoaded(
      genres: genres,
      products: products,
      selectedGenre: selectedGenre,
    ));
  }
}

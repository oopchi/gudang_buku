import 'package:bookstore/domain/controller/favorites_view_controller.dart';
import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_model.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:bookstore/util/list_type_helper.dart';
import 'package:bookstore/util/sort_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class FavoritesMobileCubit extends Cubit<FavoritesMobileState> {
  FavoritesMobileCubit({
    required FavoritesViewController favoritesViewController,
    required this.isMounted,
  })  : _favoritesViewController = favoritesViewController,
        super(const FavoritesMobileLoading());

  final FavoritesViewController _favoritesViewController;
  final bool Function() isMounted;

  Future<void> load({
    required ListType listType,
    required String genreId,
    required List<FilterModel> filterModels,
    SortBy? sortBy,
  }) async {
    final Either<Failure, List<GenreModel>> genresResp =
        await _favoritesViewController.loadAllGenre();

    if (genresResp.isLeft()) {
      if (!isMounted()) return;

      emit(FavoritesMobileFailure(
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

      emit(const FavoritesMobileFailure(
        message: 'Genre Not Found',
      ));

      return;
    }

    final GenreModel selectedGenre = genreModels[selectedGenreIdx];

    final Either<Failure, List<ProductModel>> productsResp =
        await _favoritesViewController.loadAllFavoriteProductForGenreId(
      genreId,
      sortBy: sortBy,
      filterModels: filterModels,
    );

    if (productsResp.isLeft()) {
      if (!isMounted()) return;

      emit(FavoritesMobileFailure(
        message: productsResp.asLeft().message,
      ));
      return;
    }

    if (!isMounted()) return;

    emit(FavoritesMobileLoaded(
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

    emit(FavoritesMobileRefresh(
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

  Future<void> addToCart({
    required String productId,
  }) async {
    final Either<Failure, String> res =
        await _favoritesViewController.addToCart(
      productId: productId,
    );

    if (res.isLeft()) {
      if (!isMounted()) return;

      emit(FavoritesMobileFailure(message: res.asLeft().message));
      return;
    }

    if (!isMounted()) return;

    emit(FavoritesAddToCartSuccess(
      dateTime: DateTime.now(),
    ));
  }

  Future<void> removeFromFavorites({
    required List<GenreModel> genres,
    required List<ProductModel> products,
    required GenreModel selectedGenre,
    required ProductModel productModel,
  }) async {
    final Either<Failure, void> removeFromFavRes =
        await _favoritesViewController.removeFromFavorite(
      bookId: productModel.id,
    );

    if (removeFromFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(FavoritesMobileFailure(message: removeFromFavRes.asLeft().message));
      return;
    }

    final int productIdx = products.indexWhere(
      (ProductModel element) => element == productModel,
    );

    products.removeAt(productIdx);

    if (!isMounted()) return;

    emit(FavoritesMobileLoaded(
      genres: genres,
      products: products,
      selectedGenre: selectedGenre,
    ));
  }
}

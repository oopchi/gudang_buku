import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/domain/model/genre_model.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class ShopMobileCubit extends Cubit<ShopMobileState> {
  ShopMobileCubit({
    required ShopViewController shopViewController,
    required this.isMounted,
    required this.sortBy,
    required this.filterModels,
    required this.listType,
    required this.genreId,
  })  : _shopViewController = shopViewController,
        super(const ShopMobileLoading());

  final ShopViewController _shopViewController;
  final bool Function() isMounted;
  final SortBy? sortBy;
  final List<FilterModel> filterModels;
  final ListType listType;
  final String genreId;

  Future<void> load([ListType? listType]) async {
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

    final Either<Failure, List<ProductCardModel>> productsResp =
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
      listType: listType ?? this.listType,
      selectedGenre: selectedGenre,
    ));
  }

  Future<void> onRefresh({
    required VoidCallback onComplete,
  }) async {
    await load((state as ShopMobileLoaded).listType);

    onComplete();
  }

  void changeListType(ListType listType) {
    emit((state as ShopMobileLoaded).copyWith(
      listType: listType,
    ));
  }
}

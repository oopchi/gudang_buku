import 'package:bookstore/domain/controller/shop_view_controller.dart';
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
  })  : _shopViewController = shopViewController,
        super(const ShopMobileLoading());

  final ShopViewController _shopViewController;
  final bool Function() isMounted;

  Future<void> load() async {
    final Either<Failure, List<GenreModel>> genresResp =
        await _shopViewController.loadAllGenre();

    if (genresResp.isLeft()) {
      if (!isMounted()) return;

      emit(ShopMobileFailure(
        message: genresResp.asLeft().message,
      ));

      return;
    }

    final Either<Failure, List<ProductCardModel>> productsResp =
        await _shopViewController.loadAllProduct();

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
      filteredProducts: productsResp.asRight(),
    ));
  }

  Future<void> onRefresh({
    required VoidCallback onComplete,
  }) async {
    await load();

    onComplete();
  }
}

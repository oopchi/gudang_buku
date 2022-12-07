import 'package:bookstore/domain/controller/home_view_controller.dart';
import 'package:bookstore/domain/model/event_model.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/product_model.dart';
import 'package:bookstore/domain/model/promo_model.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit({
    required HomeViewController homeViewController,
    required this.isMounted,
  })  : _homeViewController = homeViewController,
        super(const HomeMobileLoading());

  final HomeViewController _homeViewController;

  final bool Function() isMounted;

  Future<void> load() async {
    final Either<Failure, List<PromoModel>> promoRes =
        await _homeViewController.getAllPromoWithBooks();

    if (!isMounted()) return;
    promoRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<PromoModel> promos) async {
        final Either<Failure, List<EventModel>> eventRes =
            await _homeViewController.getAllEvents();

        if (!isMounted()) return;
        eventRes.fold(
          (Failure l) => emit(
            HomeMobileFailure(
              message: l.message,
            ),
          ),
          (List<EventModel> events) {
            final HomeMobileLoaded model = HomeMobileLoaded(
              promos: promos,
              events: events,
            );

            if (!isMounted()) return;
            emit(model);
          },
        );
      },
    );
  }

  Future<void> toggleFavorite({
    required List<EventModel> events,
    required List<PromoModel> promos,
    required ProductModel productModel,
  }) async {
    final List<EventModel> eventC = List.from(events);
    final List<PromoModel> promoC = promos
        .map((PromoModel e) => e.copyWith(
              productCardModels: List.from(e.productCardModels),
            ))
        .toList();

    if (productModel.favoriteButtonModel.isFavorite) {
      await _removeFromFavorites(
        events: eventC,
        promos: promoC,
        productModel: productModel,
      );

      return;
    }

    await _addToFavorites(
      events: eventC,
      promos: promoC,
      productModel: productModel,
    );
  }

  Future<void> _removeFromFavorites({
    required List<EventModel> events,
    required List<PromoModel> promos,
    required ProductModel productModel,
  }) async {
    final Either<Failure, void> removeFromFavRes =
        await _homeViewController.removeFromFavorite(
      bookId: productModel.id,
    );

    if (removeFromFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(HomeMobileFailure(message: removeFromFavRes.asLeft().message));
      return;
    }

    final int index = promos.indexWhere(
      (PromoModel element) => element.productCardModels.contains(productModel),
    );

    final int productIdx = promos[index].productCardModels.indexWhere(
          (ProductModel element) => element == productModel,
        );

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: false,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );

    promos[index].productCardModels.removeAt(productIdx);
    promos[index].productCardModels.insert(productIdx, newModel);
    if (!isMounted()) return;

    emit(HomeMobileLoaded(
      promos: promos,
      events: events,
    ));
  }

  Future<void> _addToFavorites({
    required List<EventModel> events,
    required List<PromoModel> promos,
    required ProductModel productModel,
  }) async {
    final Either<Failure, String> addToFavRes =
        await _homeViewController.addToFavorite(
      bookId: productModel.id,
    );

    if (addToFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(HomeMobileFailure(message: addToFavRes.asLeft().message));
      return;
    }

    final int index = promos.indexWhere(
      (PromoModel element) => element.productCardModels.contains(productModel),
    );

    final int productIdx = promos[index].productCardModels.indexWhere(
          (ProductModel element) => element == productModel,
        );

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: true,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );

    promos[index].productCardModels.removeAt(productIdx);
    promos[index].productCardModels.insert(productIdx, newModel);

    if (!isMounted()) return;

    emit(HomeMobileLoaded(
      promos: promos,
      events: events,
    ));
  }

  Future<void> onRefresh({
    required VoidCallback onComplete,
  }) async {
    await load();

    if (isMounted()) onComplete();
  }
}

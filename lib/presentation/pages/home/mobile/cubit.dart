import 'package:gudang_buku/domain/dto/discount_request.pb.dart';
import 'package:gudang_buku/domain/dto/discovery_request.pb.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/model/discovery_model.dart';
import 'package:gudang_buku/domain/model/event_model.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/domain/model/promo_code_model.dart';
import 'package:gudang_buku/service/discount_service.dart';
import 'package:gudang_buku/service/discovery_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit({
    required DiscoveryService discoveryService,
    required DiscountService discountService,
    required this.isMounted,
  })  : _discountService = discountService,
        _discoveryService = discoveryService,
        super(const HomeMobileLoading());

  final DiscountService _discountService;
  final DiscoveryService _discoveryService;

  final bool Function() isMounted;

  Future<void> load() async {
    final Either<Failure, List<DiscountModel>> promoRes =
        await _discountService.getAllDiscounts(ListDiscountRequest());

    if (!isMounted()) return;
    promoRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<DiscountModel> promos) async {
        final Either<Failure, List<DiscoveryModel>> eventRes =
            await _discoveryService.getAllDiscoveries(ListDiscoveryRequest());

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
    required List<DiscountModel> promos,
    required ProductModel productModel,
  }) async {
    final List<EventModel> eventC = List.from(events);
    final List<DiscountModel> promoC = promos
        .map((DiscountModel e) => e.copyWith(
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
    required List<DiscountModel> promos,
    required ProductModel productModel,
  }) async {
    final Either<Failure, void> removeFromFavRes =
        await _discountService.removeFromFavorite(
      bookId: productModel.id,
    );

    if (removeFromFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(HomeMobileFailure(message: removeFromFavRes.asLeft().message));
      return;
    }

    final int index = promos.indexWhere(
      (DiscountModel element) =>
          element.productCardModels.contains(productModel),
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
    required List<DiscountModel> promos,
    required ProductModel productModel,
  }) async {
    final Either<Failure, String> addToFavRes =
        await _discountService.addToFavorite(
      bookId: productModel.id,
    );

    if (addToFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(HomeMobileFailure(message: addToFavRes.asLeft().message));
      return;
    }

    final int index = promos.indexWhere(
      (DiscountModel element) =>
          element.productCardModels.contains(productModel),
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

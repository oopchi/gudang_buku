import 'package:bookstore/domain/controller/product_view_controller.dart';
import 'package:bookstore/domain/model/favorite_button_model.dart';
import 'package:bookstore/domain/model/product_model.dart';
import 'package:bookstore/util/dartz_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class ProductMobileCubit extends Cubit<ProductMobileState> {
  ProductMobileCubit({
    required ProductViewController productViewController,
    required this.isMounted,
  })  : _productViewController = productViewController,
        super(const ProductMobileLoading());

  final ProductViewController _productViewController;
  final bool Function() isMounted;

  Future<void> load({
    required String productId,
  }) async {
    final Either<Failure, ProductModel> productRes =
        await _productViewController.getProductModelForId(productId);

    if (productRes.isLeft()) {
      if (!isMounted()) return;

      emit(ProductMobileFailure(
        message: productRes.asLeft().message,
      ));

      return;
    }

    if (!isMounted()) return;

    emit(ProductMobileLoaded(
      product: productRes.asRight(),
    ));
  }

  Future<void> addToCart({
    required String productId,
  }) async {
    final Either<Failure, String> res = await _productViewController.addToCart(
      productId: productId,
    );

    if (res.isLeft()) {
      if (!isMounted()) return;

      emit(ProductMobileFailure(message: res.asLeft().message));
      return;
    }

    if (!isMounted()) return;

    emit(ProductAddToCartSuccess(
      dateTime: DateTime.now(),
    ));
  }

  Future<void> refreshPageWithParam({
    required String bookId,
  }) async {
    final Map<String, String> params = <String, String>{
      'bookId': bookId,
    };

    emit(ProductMobileRefresh(
      params: params,
    ));
  }

  Future<void> toggleFavorite({
    required ProductModel productModel,
  }) async {
    if (productModel.favoriteButtonModel.isFavorite) {
      await _removeFromFavorites(
        productModel: productModel,
      );

      return;
    }

    await _addToFavorites(
      productModel: productModel,
    );
  }

  Future<void> _removeFromFavorites({
    required ProductModel productModel,
  }) async {
    final Either<Failure, void> removeFromFavRes =
        await _productViewController.removeFromFavorite(
      bookId: productModel.id,
    );

    if (removeFromFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(ProductMobileFailure(message: removeFromFavRes.asLeft().message));
      return;
    }

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: false,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );
    if (!isMounted()) return;

    emit(ProductMobileLoaded(
      product: newModel,
    ));
  }

  Future<void> _addToFavorites({
    required ProductModel productModel,
  }) async {
    final Either<Failure, String> addToFavRes =
        await _productViewController.addToFavorite(
      bookId: productModel.id,
    );

    if (addToFavRes.isLeft()) {
      if (!isMounted()) return;
      emit(ProductMobileFailure(message: addToFavRes.asLeft().message));
      return;
    }

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: true,
    );

    final ProductModel newModel = productModel.copyWith(
      favoriteButtonModel: favModel,
    );
    if (!isMounted()) return;

    emit(ProductMobileLoaded(
      product: newModel,
    ));
  }
}

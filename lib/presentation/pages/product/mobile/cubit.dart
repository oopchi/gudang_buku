import 'package:bookstore/domain/controller/product_view_controller.dart';
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
}

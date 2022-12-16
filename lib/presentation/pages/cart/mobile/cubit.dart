import 'package:gudang_buku/data/service/auth_service_fs.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:gudang_buku/domain/controller/product_controller.dart';
import 'package:gudang_buku/domain/dto/discount_response.dart';
import 'package:gudang_buku/domain/dto/transaction_detail_response.dart';
import 'package:gudang_buku/domain/dto/transaction_response.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/model/favorite_button_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/domain/repository/favorite_repository.dart';
import 'package:gudang_buku/domain/repository/transaction_detail_repository.dart';
import 'package:gudang_buku/domain/repository/transaction_repository.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class CartMobileCubit extends Cubit<CartMobileState> {
  CartMobileCubit({
    required bool Function() isMounted,
    required TransactionRepository transactionRepository,
    required AuthServiceFS authServiceFS,
    required TransactionDetailRepository transactionDetailRepository,
    required ProductController productController,
    required FavoriteRepository favoriteRepository,
    required DiscountController discountController,
  })  : _isMounted = isMounted,
        _transactionRepository = transactionRepository,
        _discountController = discountController,
        _favoriteRepository = favoriteRepository,
        _transactionDetailRepository = transactionDetailRepository,
        _productController = productController,
        _authServiceFS = authServiceFS,
        super(const CartMobileLoading());
  final bool Function() _isMounted;

  final TransactionRepository _transactionRepository;
  final TransactionDetailRepository _transactionDetailRepository;
  final ProductController _productController;
  final FavoriteRepository _favoriteRepository;
  final DiscountController _discountController;

  final AuthServiceFS _authServiceFS;

  Future<void> load() async {
    final Either<Failure, TransactionResponse> transactionRes =
        await _transactionRepository.getCartTransaction(
      uid: _authServiceFS.getUser().uid,
    );

    if (transactionRes.isLeft()) {
      _emit(CartMobileFailure(message: transactionRes.asLeft().message));
      return;
    }

    final TransactionResponse transaction = transactionRes.asRight();

    DiscountModel? discount;
    if (transaction.discountId != null) {
      final Either<Failure, DiscountModel> discountRes =
          await _discountController.getDiscountWithId(transaction.discountId!);

      if (discountRes.isLeft()) {
        _emit(CartMobileFailure(message: discountRes.asLeft().message));

        return;
      }

      discount = discountRes.asRight();
    }

    final Either<Failure, List<TransactionDetailResponse>>
        transactionDetailsRes = await _transactionDetailRepository
            .fetchAllTransactionDetailForTransactionId(
      transactionId: transaction.id!,
    );

    if (transactionDetailsRes.isLeft()) {
      _emit(CartMobileFailure(message: transactionDetailsRes.asLeft().message));

      return;
    }

    final List<TransactionDetailResponse> transactionDetails =
        transactionDetailsRes.asRight();

    final Map<String, int> stocks = <String, int>{};

    for (final TransactionDetailResponse res in transactionDetails) {
      stocks[res.bookId!] = (stocks[res.bookId!] ?? 0) + res.quantity!;
    }

    final Either<Failure, List<ProductModel>> productsRes =
        await _productController.loadAllProductWithIds(
            transactionDetails.map((e) => e.bookId!).toList());

    if (productsRes.isLeft()) {
      _emit(CartMobileFailure(message: productsRes.asLeft().message));

      return;
    }

    final List<ProductModel> products = productsRes.asRight();

    final List<double> totals = _countTotal(
      products: products,
      stocks: stocks,
      discount: discount,
    );

    _emit(CartMobileLoaded(
      products: products,
      stocks: stocks,
      discount: discount,
      total: totals[0],
      actualTotal: totals[1],
    ));
  }

  Future<void> removeFromCart(
    CartMobileLoaded oldState,
    ProductModel model,
  ) async {
    final Either<Failure, String> transactionIdRes =
        await _transactionRepository.getCartTransactionId(
      uid: _authServiceFS.getUser().uid,
    );

    if (transactionIdRes.isLeft()) {
      _emit(CartMobileFailure(message: transactionIdRes.asLeft().message));
      return;
    }

    final String transactionId = transactionIdRes.asRight();

    final Either<Failure, void> res = await _transactionDetailRepository
        .deleteAllTransactionDetailWithTransactionIdAndBookId(
      transactionId: transactionId,
      bookId: model.id,
    );

    if (res.isLeft()) {
      _emit(CartMobileFailure(message: transactionIdRes.asLeft().message));
      return;
    }

    final List<ProductModel> newList = oldState.products.toList();

    newList.remove(model);

    final Map<String, int> newMap = {...oldState.stocks};
    newMap.remove(model.id);

    List<double> totals = _countTotal(
      products: newList,
      stocks: newMap,
      discount: oldState.discount,
    );

    emit(CartMobileLoaded(
      products: newList,
      stocks: newMap,
      total: totals[0],
      actualTotal: totals[1],
      discount: oldState.discount,
    ));
  }

  void removeDiscountCode(CartMobileLoaded oldState) {
    final List<double> totals = _countTotal(
      products: oldState.products,
      stocks: oldState.stocks,
    );
    _emit(CartMobileLoaded(
      products: oldState.products,
      stocks: oldState.stocks,
      total: totals[0],
      actualTotal: totals[1],
    ));
  }

  List<double> _countTotal({
    required List<ProductModel> products,
    required Map<String, int> stocks,
    DiscountModel? discount,
  }) {
    double total = .0;

    for (final MapEntry<String, int> entry in stocks.entries) {
      if (entry.value > 0) {
        total +=
            products.firstWhere((element) => element.id == entry.key).price *
                entry.value;
      }
    }

    double actualTotal = total;

    if (discount != null) {
      if (discount.minAmount > total) {
      } else {
        final double realAmount = discount.amountType == 'Amount'
            ? (discount.amount).toDouble()
            : discount.amount * total / 100;

        late final double actualAmount;

        if (discount.maxAmount != null && discount.maxAmount! > 0) {
          actualAmount = realAmount > discount.maxAmount!
              ? discount.maxAmount!.toDouble()
              : realAmount;
        } else {
          actualAmount = realAmount;
        }

        actualTotal -= actualAmount;
      }
    }

    return [total, actualTotal];
  }

  Future<void> incrementToCart(
    CartMobileLoaded oldState,
    ProductModel model,
  ) async {
    if (state is CartMobileBlockQtyChange) return;

    _emit(CartMobileBlockQtyChange());
    final Either<Failure, String> cartIdRes =
        await _transactionRepository.getCartTransactionId(
      uid: _authServiceFS.getUser().uid,
    );

    if (cartIdRes.isLeft()) {
      _emit(CartMobileFailure(message: cartIdRes.asLeft().message));

      return;
    }

    final String cartId = cartIdRes.asRight();

    final Either<Failure, String> cartDetailIdRes =
        await _transactionDetailRepository.addCartTransactionDetail(
      transactionId: cartId,
      bookId: model.id,
      quantity: 1,
    );

    if (cartDetailIdRes.isLeft()) {
      _emit(CartMobileFailure(message: cartDetailIdRes.asLeft().message));

      return;
    }

    final Map<String, int> newMap = {...oldState.stocks};

    newMap[model.id] = (newMap[model.id] ?? 0) + 1;

    List<double> totals = _countTotal(
      products: oldState.products,
      stocks: newMap,
      discount: oldState.discount,
    );

    _emit(CartMobileLoaded(
      products: oldState.products,
      stocks: newMap,
      discount: oldState.discount,
      total: totals[0],
      actualTotal: totals[1],
    ));
  }

  Future<void> decrementToCart(
    CartMobileLoaded oldState,
    ProductModel model,
  ) async {
    if (state is CartMobileBlockQtyChange) return;

    _emit(CartMobileBlockQtyChange());
    final Either<Failure, String> cartIdRes =
        await _transactionRepository.getCartTransactionId(
      uid: _authServiceFS.getUser().uid,
    );

    if (cartIdRes.isLeft()) {
      _emit(CartMobileFailure(message: cartIdRes.asLeft().message));

      return;
    }

    final String cartId = cartIdRes.asRight();

    final Either<Failure, void> cartDetailIdRes =
        await _transactionDetailRepository
            .deleteTransactionDetailWithTransactionIdAndBookId(
      transactionId: cartId,
      bookId: model.id,
    );

    if (cartDetailIdRes.isLeft()) {
      _emit(CartMobileFailure(message: cartDetailIdRes.asLeft().message));

      return;
    }

    final Map<String, int> newMap = {...oldState.stocks};
    final List<ProductModel> newList = [...oldState.products];

    final int newStock = (newMap[model.id] ?? 0) - 1;

    if (newStock > 0) {
      newMap[model.id] = newStock;
    } else {
      newMap.remove(model.id);
      newList.remove(model);
    }

    List<double> totals = _countTotal(
      products: newList,
      stocks: newMap,
      discount: oldState.discount,
    );
    _emit(CartMobileLoaded(
      products: newList,
      stocks: newMap,
      discount: oldState.discount,
      total: totals[0],
      actualTotal: totals[1],
    ));
  }

  Future<void> addToFavorite(
    CartMobileLoaded oldState,
    ProductModel product,
  ) async {
    final Either<Failure, String> addToFavRes =
        await _favoriteRepository.addFavorite(
      userId: _authServiceFS.getUser().uid,
      bookId: product.id,
    );

    if (addToFavRes.isLeft()) {
      _emit(CartMobileFailure(message: addToFavRes.asLeft().message));
      return;
    }

    const FavoriteButtonModel favModel = FavoriteButtonModel(
      showButton: true,
      isFavorite: true,
    );

    final ProductModel newModel = product.copyWith(
      favoriteButtonModel: favModel,
    );

    final List<ProductModel> products = [...oldState.products];

    final int idx = products.indexOf(product);

    products.remove(product);

    products.insert(idx, newModel);

    _emit(CartMobileLoaded(
      products: products,
      stocks: oldState.stocks,
      total: oldState.total,
      actualTotal: oldState.actualTotal,
      discount: oldState.discount,
    ));
  }

  Future<void> addDiscountCode(
      CartMobileLoaded oldState, DiscountModel discount) async {
    _emit(const CartMobileLoading());
    final Either<Failure, String> discountRes =
        await _transactionRepository.addDiscountToCart(
      uid: _authServiceFS.getUser().uid,
      discountId: discount.id,
    );

    if (discountRes.isLeft()) {
      _emit(CartMobileFailure(message: discountRes.asLeft().message));
      _emit(oldState);
      return;
    }

    List<double> totals = _countTotal(
      products: oldState.products,
      stocks: oldState.stocks,
      discount: oldState.discount,
    );

    _emit(CartMobileLoaded(
      products: oldState.products,
      stocks: oldState.stocks,
      discount: discount,
      total: totals[0],
      actualTotal: totals[1],
    ));
  }

  void _emit(CartMobileState newState) {
    if (!_isMounted()) return;

    emit(newState);
  }
}

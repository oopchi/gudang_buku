import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/presentation/pages/cart/mobile/cubit.dart';
import 'package:gudang_buku/presentation/pages/cart/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/animation_helper.dart';
import 'package:gudang_buku/presentation/widget/appbar_helper.dart';
import 'package:gudang_buku/presentation/widget/button_helper.dart';
import 'package:gudang_buku/presentation/widget/card_helper.dart';
import 'package:gudang_buku/presentation/widget/discount_sheet/view.dart';
import 'package:gudang_buku/presentation/widget/loading_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:gudang_buku/util/format_helper.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CartMobileBody extends StatefulWidget {
  const CartMobileBody({
    super.key,
  });

  @override
  State<CartMobileBody> createState() => _CartMobileBodyState();
}

class _CartMobileBodyState extends State<CartMobileBody> {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<CartMobileCubit, CartMobileState>(
      listener: (context, state) {
        if (state is CartMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }

        if (state is CartMobileFavoriteSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: 'Success adding to favorites.',
              backgroundColor: Colors.green,
            ));
        }
      },
      buildWhen: (previous, current) =>
          current is CartMobileLoaded || current is CartMobileLoading,
      builder: (context, state) {
        if (state is CartMobileLoaded) {
          return _buildScaffold(context, state);
        }

        return const AppLoadingView();
      },
    );
  }

  Widget _buildScaffold(BuildContext context, CartMobileLoaded state) {
    return Scaffold(
      appBar: AppBarHelper(
        height: 120.0.h,
        color: Colors.white,
        child: _buildTopBar(context, state),
      ),
      body: _buildBody(context, state),
      bottomNavigationBar: _buildBottomBar(context, state),
    );
  }

  Widget _buildBottomBar(BuildContext context, CartMobileLoaded state) {
    return AnimatedOpacitySize(
      isVisible: state.products.isNotEmpty,
      child: Container(
        height: 205.0.sp,
        padding: EdgeInsets.symmetric(
          vertical: 20.0.sp,
          horizontal: 16.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPromoButton(context, state),
            Spacing.vertical(28.0.sp),
            _buildTotal(context, state),
            Spacing.vertical(24.0.sp),
            _buildCheckoutButton(context, state),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context, CartMobileLoaded state) {
    return AppButton(
      text: 'CHECKOUT',
      textStyle: CustomTextStyles.medium.size(
        14.0,
        Colors.white,
      ),
      height: 48.0.sp,
      onPressed: () => context.goNamed(AppRoutes.cartToCheckout.name),
    );
  }

  Widget _buildTotal(BuildContext context, CartMobileLoaded state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Total amount:',
          style: CustomTextStyles.medium.size(
            14.0,
            AppColor.gray,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (state.total != state.actualTotal)
                Text(
                  FormatHelper.formatCurrency(state.total.toInt().toString()),
                  style: CustomTextStyles.medium
                      .size(
                        18.0,
                        AppColor.gray,
                      )
                      .copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                  textAlign: TextAlign.end,
                ),
              Spacing.vertical(4.0.sp),
              Text(
                FormatHelper.formatCurrency(
                    state.actualTotal.toInt().toString()),
                style: CustomTextStyles.semiBold.size(
                  18.0,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPromoButton(BuildContext context, CartMobileLoaded state) {
    final CartMobileCubit cubit = BlocProvider.of<CartMobileCubit>(context);

    final BorderRadius borderRadius = BorderRadius.horizontal(
      left: Radius.circular(8.0.r),
      right: Radius.circular(35.0.r),
    );
    if (state.discount == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 8.0.sp,
              offset: Offset(
                .0,
                1.0.sp,
              ),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => showSlidingBottomSheet<DiscountModel>(
              context,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return SlidingSheetDialog(
                  duration: const Duration(milliseconds: 300),
                  avoidStatusBar: true,
                  cornerRadiusOnFullscreen: .0,
                  color: Colors.white,
                  cornerRadius: 34.0.r,
                  snapSpec: const SnapSpec(
                    initialSnap: .4,
                    snap: true,
                    snappings: [
                      .4,
                      .7,
                      1.0,
                    ],
                  ),
                  builder: (context, state) => const DiscountSheet(),
                );
              },
            ).then((value) {
              if (value == null) return null;
              cubit.addDiscountCode(state, value);
            }),
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                  gapPadding: .0,
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  gapPadding: .0,
                  borderSide: BorderSide(
                    color: AppColor.error,
                    width: 1.0.sp,
                  ),
                ),
                hintText: 'Enter your promo code',
                suffixIcon: Container(
                  width: 36.0.sp,
                  height: 36.0.sp,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100.0.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 24.0.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(),
                contentPadding: EdgeInsets.only(
                  left: 20.0.w,
                ),
                isDense: true,
                hintStyle: CustomTextStyles.medium.size(14.0, AppColor.gray),
                alignLabelWithHint: true,
                label: Text(
                  'Promo Code',
                  style: CustomTextStyles.regular.size(14.0, AppColor.gray),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8.0.sp,
            offset: Offset(
              .0,
              1.0.sp,
            ),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              state.discount!.code,
              style: CustomTextStyles.medium.size(14.0),
            ),
          ),
          IconButton(
            onPressed: () => cubit.removeDiscountCode(state),
            icon: const Icon(Icons.clear),
            iconSize: 24.0.sp,
            padding: EdgeInsets.all(6.0.sp),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context, CartMobileLoaded state) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search_rounded),
      iconSize: 30.0.sp,
      padding: EdgeInsets.all(12.0.sp),
      constraints: const BoxConstraints(),
    );
  }

  Widget _buildTopBar(BuildContext context, CartMobileLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: _buildSearchButton(context, state),
        ),
        Spacing.vertical(18.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
          ),
          child: Text(
            'My Bag',
            style: CustomTextStyles.bold.size(
              34.0,
              AppColor.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, CartMobileLoaded state) {
    final CartMobileCubit cubit = BlocProvider.of<CartMobileCubit>(context);
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 16.0.h,
      ),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: <Widget>[
        for (final ProductModel model in state.products)
          Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
              right: 16.0.w,
              bottom: 26.0.h,
            ),
            child: ProductCard.cart(
              model: model,
              currQty: state.stocks[model.id]!,
              onProductTap: () => context.goNamed(
                AppRoutes.shopToProduct.name,
                params: <String, String>{
                  'product': model.id,
                },
              ),
              onDeleteButtonTap: () => cubit.removeFromCart(state, model),
              onQtyChanged: (value) {
                if (value < 1) return;
                if (value < state.stocks[model.id]!) {
                  cubit.decrementToCart(state, model);
                } else {
                  cubit.incrementToCart(state, model);
                }
              },
              onFavoriteTap: () => cubit.addToFavorite(state, model),
            ),
          ),
      ],
    );
  }
}

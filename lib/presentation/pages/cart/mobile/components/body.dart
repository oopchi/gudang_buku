import 'package:gudangBuku/config/constant/colors.dart';
import 'package:gudangBuku/config/constant/routes.dart';
import 'package:gudangBuku/domain/dto/discount_response.dart';
import 'package:gudangBuku/domain/model/discount_model.dart';
import 'package:gudangBuku/domain/model/product_model.dart';
import 'package:gudangBuku/presentation/pages/cart/mobile/cubit.dart';
import 'package:gudangBuku/presentation/pages/cart/mobile/state.dart';
import 'package:gudangBuku/presentation/widget/appbar_helper.dart';
import 'package:gudangBuku/presentation/widget/card_helper.dart';
import 'package:gudangBuku/presentation/widget/discount_sheet/view.dart';
import 'package:gudangBuku/presentation/widget/loading_helper.dart';
import 'package:gudangBuku/presentation/widget/modal_sheet_helper.dart';
import 'package:gudangBuku/presentation/widget/snackbar_helper.dart';
import 'package:gudangBuku/presentation/widget/spacing.dart';
import 'package:gudangBuku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CartMobileBody extends StatefulWidget {
  const CartMobileBody({
    super.key,
  });

  @override
  State<CartMobileBody> createState() => _CartMobileBodyState();
}

class _CartMobileBodyState extends State<CartMobileBody> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

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
    return SizedBox(
      height: 205.0.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacing.vertical(25.0.sp),
          _buildPromoButton(context, state),
        ],
      ),
    );
  }

  Widget _buildPromoButton(BuildContext context, CartMobileLoaded state) {
    final CartMobileCubit cubit = BlocProvider.of<CartMobileCubit>(context);

    final BorderRadius borderRadius = BorderRadius.horizontal(
      left: Radius.circular(8.0.r),
      right: Radius.circular(35.0.r),
    );
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

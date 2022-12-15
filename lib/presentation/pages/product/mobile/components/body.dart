import 'package:gudangBuku/config/constant/colors.dart';
import 'package:gudangBuku/config/constant/routes.dart';
import 'package:gudangBuku/presentation/pages/product/mobile/cubit.dart';
import 'package:gudangBuku/presentation/pages/product/mobile/state.dart';
import 'package:gudangBuku/presentation/widget/appbar_helper.dart';
import 'package:gudangBuku/presentation/widget/button_helper.dart';
import 'package:gudangBuku/presentation/widget/loading_helper.dart';
import 'package:gudangBuku/presentation/widget/snackbar_helper.dart';
import 'package:gudangBuku/presentation/widget/spacing.dart';
import 'package:gudangBuku/util/format_helper.dart';
import 'package:gudangBuku/util/navigation_helper.dart';
import 'package:gudangBuku/util/text_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductMobileBody extends StatefulWidget {
  const ProductMobileBody({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductMobileBody> createState() => _ProductMobileBodyState();
}

class _ProductMobileBodyState extends State<ProductMobileBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductMobileCubit, ProductMobileState>(
      listener: (context, state) {
        if (state is ProductMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
        if (state is ProductAddToCartSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: 'Success adding to cart.',
              backgroundColor: Colors.green,
            ));
        }

        if (state is ProductMobileRefresh) {
          context.goNamed(
            AppRoutes.shopToProduct.name,
            params: state.params,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is ProductMobileLoaded || current is ProductMobileLoading,
      builder: (context, state) {
        if (state is ProductMobileLoading) return const AppLoadingView();

        if (state is ProductMobileLoaded) {
          return Scaffold(
            bottomNavigationBar: _buildBottomNavigationBar(context, state),
            appBar: _buildAppBar(context, state),
            body: _buildBody(context, state),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ProductMobileLoaded state,
  ) {
    return AppBarHelper(
      height: 109.0.sp,
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(.08),
          offset: Offset(
            .0,
            4.0.sp,
          ),
          blurRadius: 24.0.sp,
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          top: 44.0.sp,
        ),
        child: Stack(
          children: <Widget>[
            IconButton(
              onPressed: () => AppNav.back(context),
              icon: const Icon(Icons.chevron_left),
              iconSize: 30.0.sp,
              padding: EdgeInsets.all(8.0.sp),
              constraints: const BoxConstraints(),
            ),
            Center(
              child: Text(
                state.product.title,
                style: CustomTextStyles.semiBold.size(18.0),
              ),
            ),
            Positioned(
              right: .0,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.share),
                iconSize: 30.0.sp,
                padding: EdgeInsets.all(8.0.sp),
                constraints: const BoxConstraints(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ProductMobileLoaded state,
  ) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: <Widget>[
        _buildCarousel(context, state),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 14.0.h,
              horizontal: 16.0.w,
            ),
            child: _buildFavoriteButton(context, state),
          ),
        ),
        Spacing.vertical(24.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: _buildPrimaryDetails(context, state),
        ),
        Spacing.vertical(16.0.h),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: _buildAuthorAndBookDescriptions(context, state),
        ),
      ],
    );
  }

  Widget _buildAuthorAndBookDescriptions(
      BuildContext context, ProductMobileLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (state.product.description != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: 8.0.h,
            ),
            child: Text(
              state.product.description!,
              textAlign: TextAlign.justify,
              style: CustomTextStyles.regular.size(14.0).copyWith(
                    height: 1.5,
                  ),
            ),
          ),
        if (state.product.authorOverviews != null)
          for (final MapEntry<String, String> entry
              in state.product.authorOverviews!.entries)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  entry.key,
                  style: CustomTextStyles.medium.size(18.0),
                ),
                Spacing.vertical(4.0.h),
                Text(
                  entry.value,
                  textAlign: TextAlign.justify,
                  style: CustomTextStyles.regular.size(14.0).copyWith(
                        height: 1.5,
                      ),
                ),
                Spacing.vertical(8.0.h),
              ],
            ),
      ],
    );
  }

  Widget _buildPrimaryDetails(BuildContext context, ProductMobileLoaded state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: _buildLeftPane(context, state),
        ),
        Expanded(
          child: _buildRightPane(context, state),
        ),
      ],
    );
  }

  Widget _buildLeftPane(BuildContext context, ProductMobileLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          state.product.title,
          style: CustomTextStyles.semiBold.size(24.0),
        ),
        Text(
          state.product.author,
          style: CustomTextStyles.regular.size(
            11.0,
            AppColor.gray,
          ),
        ),
        Spacing.vertical(8.0.sp),
        _buildRatingStars(context, state),
      ],
    );
  }

  Widget _buildRightPane(BuildContext context, ProductMobileLoaded state) {
    if (state.product.discountedPrice != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            FormatHelper.formatCurrency(
              state.product.price.toString(),
            ),
            textAlign: TextAlign.end,
            style: CustomTextStyles.semiBold
                .size(
                  24.0,
                  AppColor.gray,
                )
                .copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          Spacing.vertical(4.0.h),
          Text(
            FormatHelper.formatCurrency(
              state.product.discountedPrice.toString(),
            ),
            textAlign: TextAlign.end,
            style: CustomTextStyles.medium.size(
              24.0,
              AppColor.red,
            ),
          ),
        ],
      );
    }

    return Text(
      FormatHelper.formatCurrency(
        state.product.price.toString(),
      ),
      textAlign: TextAlign.end,
      style: CustomTextStyles.semiBold.size(24.0),
    );
  }

  Widget _buildCarousel(
    BuildContext context,
    ProductMobileLoaded state,
  ) {
    return CarouselSlider(
      items: <Widget>[
        for (final String imageUrl in state.product.imageUrls)
          Image.network(
            imageUrl,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress?.expectedTotalBytes ==
                  loadingProgress?.cumulativeBytesLoaded) {
                return child;
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.red,
                ),
              );
            },
          ),
      ],
      options: CarouselOptions(
        padEnds: false,
        aspectRatio: 376.0.w / 413.0.w,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  Widget _buildRatingStars(BuildContext context, ProductMobileLoaded state) {
    return Row(
      children: <Widget>[
        RatingBarIndicator(
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColor.amber,
          ),
          rating: state.product.rating,
          itemSize: 13.0.sp,
          itemPadding: EdgeInsets.only(
            right: 1.5.sp,
          ),
        ),
        Spacing.horizontal(.5.sp),
        Text(
          '(${state.product.numOfRating})',
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 10.0.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteButton(
    BuildContext context,
    ProductMobileLoaded state,
  ) {
    final ProductMobileCubit cubit =
        BlocProvider.of<ProductMobileCubit>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(
              .0,
              4.0.sp,
            ),
            blurRadius: 4.0.sp,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(100.0.r),
          onTap: () => cubit.toggleFavorite(
            productModel: state.product,
          ),
          child: SizedBox(
            width: 36.0.sp,
            height: 36.0.sp,
            child: Center(
              child: Icon(
                state.product.favoriteButtonModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 24.0.sp,
                color: state.product.favoriteButtonModel.isFavorite
                    ? const Color(0xFFDB3022)
                    : const Color(0xFF9B9B9B),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, ProductMobileLoaded state) {
    final ProductMobileCubit cubit =
        BlocProvider.of<ProductMobileCubit>(context);
    return Container(
      height: 112.0.sp,
      padding: EdgeInsets.fromLTRB(
        16.0.sp,
        20.0.sp,
        16.0.sp,
        44.0.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: Offset(
              .0,
              -4.0.sp,
            ),
            blurRadius: 8.0.sp,
          ),
        ],
      ),
      child: AppButton(
        onPressed: () => cubit.addToCart(
          productId: state.product.id,
        ),
        text: 'Add To Cart',
        textStyle: CustomTextStyles.medium.size(
          14.0,
          Colors.white,
        ),
      ),
    );
  }
}

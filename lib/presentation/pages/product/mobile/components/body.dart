import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/presentation/pages/product/mobile/cubit.dart';
import 'package:bookstore/presentation/pages/product/mobile/state.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:bookstore/util/navigation_helper.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ],
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
        aspectRatio: 376.0.w / 413.0.h,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(
    BuildContext context,
    ProductMobileLoaded state,
  ) {
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
          onTap: () {},
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
}

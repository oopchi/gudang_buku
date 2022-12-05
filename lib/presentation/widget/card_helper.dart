import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/presentation/pages/shop/mobile/state.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/format_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.model,
    this.onFavoriteTap,
    this.onProductTap,
    this.listType = ListType.grid,
  });
  final ProductCardModel model;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onProductTap;
  final ListType listType;

  @override
  Widget build(BuildContext context) {
    if (listType == ListType.grid) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCard(),
          Spacing.vertical(7.0.sp),
          _buildRatingStars(),
          Spacing.vertical(6.0.sp),
          _buildAuthor(),
          Spacing.vertical(5.0.sp),
          _buildTitle(),
          Spacing.vertical(3.0.sp),
          _buildPrice(),
        ],
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(
                  .0,
                  1.0.sp,
                ),
                blurRadius: 25.0.sp,
                color: Colors.black.withOpacity(.08),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0.r),
            child: InkWell(
              onTap: onProductTap,
              borderRadius: BorderRadius.circular(8.0.r),
              child: Row(
                children: <Widget>[
                  _buildCard(),
                  Spacing.horizontal(11.0.w),
                  _buildDetail(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 78.0.sp,
          right: .0,
          child: _buildFavoriteButton(),
        ),
      ],
    );
  }

  Widget _buildDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildTitle(),
            _buildDiscountChip(),
          ],
        ),
        Spacing.vertical(4.0.h),
        _buildAuthor(),
        Spacing.vertical(8.0.h),
        _buildRatingStars(),
        Spacing.vertical(8.0.h),
        _buildPrice(),
      ],
    );
  }

  Widget _buildPrice() {
    if (model.discountedPrice != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            FormatHelper.formatCurrency(
              model.price.toString(),
            ),
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9B9B9B),
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Spacing.vertical(4.0.h),
          Text(
            FormatHelper.formatCurrency(
              model.discountedPrice.toString(),
            ),
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFDB3022),
            ),
          ),
        ],
      );
    }

    return Text(
      FormatHelper.formatCurrency(
        model.price.toString(),
      ),
      style: TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF222222),
      ),
    );
  }

  Widget _buildAuthor() {
    return Text(
      model.author,
      style: TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 11.0.sp,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF9B9B9B),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTitle() {
    return Text(
      model.title,
      style: TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF222222),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: <Widget>[
        RatingBarIndicator(
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Color(0xFFFFBA49),
          ),
          rating: model.rating,
          itemSize: 13.0.sp,
          itemPadding: EdgeInsets.only(
            right: 1.5.sp,
          ),
        ),
        Spacing.horizontal(.5.sp),
        Text(
          '(${model.numOfRating})',
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 10.0.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    if (listType == ListType.grid) {
      return SizedBox(
        width: 148.0.sp,
        height: 184.0.sp,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0.r),
                onTap: onProductTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
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
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.error,
                        size: 40.0.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 164.0.sp,
              right: .0,
              child: _buildFavoriteButton(),
            ),
            Positioned(
              top: 8.0.sp,
              left: 9.0.sp,
              child: _buildDiscountChip(),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: 104.0.sp,
      height: 104.0.sp,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8.0.r),
        ),
        child: Image.network(
          model.imageUrl,
          fit: BoxFit.cover,
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
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(
              Icons.error,
              size: 40.0.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountChip() {
    if (model.discountString == null) return const SizedBox.shrink();

    return Container(
      constraints: BoxConstraints(
        minHeight: 24.0.sp,
        minWidth: 40.0.sp,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 6.0.sp,
        horizontal: 5.0.sp,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDB3022),
        borderRadius: BorderRadius.circular(100.0.r),
      ),
      child: Text(
        model.discountString!,
        style: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 11.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
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
          onTap: onFavoriteTap,
          child: SizedBox(
            width: 36.0.sp,
            height: 36.0.sp,
            child: Center(
              child: Icon(
                model.favoriteButtonModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 24.0.sp,
                color: model.favoriteButtonModel.isFavorite
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

import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/domain/model/product_card_model.dart';
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
  });
  final ProductCardModel model;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onProductTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCard(),
        Spacing.vertical(7.0.h),
        _buildRatingStars(),
        Spacing.vertical(6.0.h),
        _buildAuthor(),
        Spacing.vertical(5.0.h),
        _buildTitle(),
        Spacing.vertical(3.0.h),
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
            right: 1.5.w,
          ),
        ),
        Spacing.horizontal(.5.w),
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
    return SizedBox(
      width: 148.0.w,
      height: 184.0.w,
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
            top: 164.0.w,
            left: 112.0.w,
            child: _buildFavoriteButton(),
          ),
          Positioned(
            top: 8.0.w,
            left: 9.0.w,
            child: _buildTopLeftChip(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopLeftChip() {
    if (model.discountString == null) return const SizedBox.shrink();

    return Container(
      constraints: BoxConstraints(
        minHeight: 24.0.w,
        minWidth: 40.0.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 6.0.w,
        horizontal: 5.0.w,
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
            width: 36.0.w,
            height: 36.0.w,
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

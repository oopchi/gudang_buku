import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/domain/model/product_model.dart';
import 'package:gudang_buku/presentation/widget/number_counter.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:gudang_buku/util/format_helper.dart';
import 'package:gudang_buku/util/list_type_helper.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum _ProductType {
  normal,
  favorite,
  cart,
}

extension _ProductTypeExt on _ProductType {
  bool get isFavorite => this == _ProductType.favorite;
  bool get isCart => this == _ProductType.cart;
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.model,
    this.onFavoriteTap,
    this.onProductTap,
    this.listType = ListType.grid,
  })  : onCartTap = null,
        onDeleteButtonTap = null,
        _productType = _ProductType.normal,
        onQtyChanged = null,
        currQty = -1;

  const ProductCard.favorite({
    super.key,
    required this.model,
    this.onProductTap,
    this.onCartTap,
    this.listType = ListType.grid,
    this.onDeleteButtonTap,
  })  : onFavoriteTap = null,
        _productType = _ProductType.favorite,
        onQtyChanged = null,
        currQty = -1;

  const ProductCard.cart({
    super.key,
    required this.model,
    this.onProductTap,
    this.onDeleteButtonTap,
    this.onQtyChanged,
    required this.currQty,
    this.onFavoriteTap,
  })  : _productType = _ProductType.cart,
        listType = ListType.list,
        onCartTap = null;

  final ProductModel model;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onProductTap;
  final ListType listType;
  final _ProductType _productType;
  final VoidCallback? onDeleteButtonTap;
  final ValueChanged<int>? onQtyChanged;
  final int currQty;

  @override
  Widget build(BuildContext context) {
    if (listType == ListType.grid) {
      return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0.r),
          onTap: onProductTap,
          child: _buildCard(),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Expanded(
                        child: _buildDetail(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacing.vertical(10.0.sp),
          ],
        ),
        if (!_productType.isCart)
          Positioned(
            top: 78.0.sp,
            right: .0,
            child: _buildIconButton(),
          ),
        if (_productType.isFavorite)
          Positioned(
            top: .0,
            right: .0,
            child: _buildDeleteButton(),
          ),
        if (_productType.isCart)
          Positioned(
            top: .0,
            right: .0,
            child: _buildPopupButton(),
          ),
      ],
    );
  }

  Widget _buildPopupButton() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        if (!model.favoriteButtonModel.isFavorite)
          PopupMenuItem(
            value: 'Favorite',
            child: Text(
              'Add to favorites',
              style: CustomTextStyles.regular.size(11.0),
            ),
          ),
        PopupMenuItem(
          value: 'Delete',
          child: Text(
            'Delete from the list',
            style: CustomTextStyles.regular.size(11.0),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'Favorite') {
          if (onFavoriteTap != null) {
            onFavoriteTap!();
          }
        } else if (value == 'Delete') {
          if (onDeleteButtonTap != null) {
            onDeleteButtonTap!();
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Icon(
          Icons.more_vert,
          size: 30.0.sp,
          color: AppColor.gray,
        ),
      ),
    );
  }

  Widget _buildIconButton() {
    if (_productType.isFavorite) return _buildCartButton();
    return _buildFavoriteButton();
  }

  Widget _buildDetail() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacing.vertical(11.0.sp),
        Row(
          children: <Widget>[
            _buildTitle(),
            _buildDiscountChip(),
          ],
        ),
        Spacing.vertical(4.0.sp),
        _buildAuthor(),
        Spacing.vertical(8.0.sp),
        _buildRatingStars(),
        Spacing.vertical(8.0.sp),
        if (_productType.isCart) _buildQtyButton() else _buildPrice(),
        Spacing.vertical(11.0.sp),
      ],
    );
  }

  Widget _buildQtyButton() {
    return Row(
      children: <Widget>[
        AppNumberCounter(
          onChanged: onQtyChanged,
          value: currQty,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0.sp,
              ),
              child: _buildPrice(),
            ),
          ),
        ),
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
            color: AppColor.amber,
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
      return Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 184.0.sp,
                width: 148.0.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: Image.network(
                    model.imageUrl,
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
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.error,
                        size: 40.0.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Spacing.vertical(7.0.sp),
              _buildRatingStars(),
              Spacing.vertical(6.0.sp),
              _buildAuthor(),
              Spacing.vertical(5.0.sp),
              _buildTitle(),
              Spacing.vertical(3.0.sp),
              _buildPrice(),
            ],
          ),
          Positioned(
            top: 164.0.sp,
            right: .0,
            child: _buildIconButton(),
          ),
          Positioned(
            top: 8.0.sp,
            left: 9.0.sp,
            child: _buildDiscountChip(),
          ),
          if (_productType.isFavorite)
            Positioned(
              top: 2.0.sp,
              right: 3.0.sp,
              child: _buildDeleteButton(),
            ),
        ],
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

  Widget _buildDeleteButton() {
    return Material(
      borderRadius: BorderRadius.circular(100.0.r),
      color: Colors.transparent,
      child: IconButton(
        onPressed: onDeleteButtonTap,
        icon: const Icon(Icons.clear),
        constraints: const BoxConstraints(),
        padding: listType == ListType.grid
            ? EdgeInsets.zero
            : EdgeInsets.all(8.0.sp),
        iconSize: 30.0.sp,
        color: AppColor.gray,
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

  Widget _buildCartButton() {
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
          onTap: onCartTap,
          child: SizedBox(
            width: 36.0.sp,
            height: 36.0.sp,
            child: Center(
              child: Icon(
                Icons.shopping_bag_sharp,
                size: 24.0.sp,
                color: AppColor.red,
              ),
            ),
          ),
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
                    ? AppColor.red
                    : AppColor.gray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

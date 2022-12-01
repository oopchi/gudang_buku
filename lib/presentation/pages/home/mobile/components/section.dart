import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:bookstore/presentation/widget/card_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMobileSection extends StatelessWidget {
  const HomeMobileSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onViewAllTap,
    required this.models,
  });

  final String title;
  final String subtitle;
  final VoidCallback onViewAllTap;
  final List<ProductCardModel> models;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          Spacing.vertical(22.0.h),
          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      height: 414.0.h,
      alignment: Alignment.center,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.only(
          left: 16.0.w,
        ),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (final ProductCardModel model in models)
            Padding(
              padding: EdgeInsets.only(
                right: 17.0.w,
              ),
              child: ProductCard(
                model: model,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Spacing.horizontal(14.0.w),
        Expanded(
          child: _buildHeaderTitle(),
        ),
        _buildViewAllButton(),
      ],
    );
  }

  Widget _buildHeaderTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 34.0.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF222222),
          ),
        ),
        Spacing.vertical(4.0.h),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 11.0.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF9B9B9B),
          ),
        ),
      ],
    );
  }

  Widget _buildViewAllButton() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8.0.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0.r),
        onTap: onViewAllTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
            vertical: 12.0.h,
          ),
          child: Text(
            'View All',
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 11.0.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF222222),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSortBySheet extends StatefulWidget {
  const BottomSortBySheet({
    super.key,
    this.selectedSort,
  });
  final SortBy? selectedSort;

  @override
  State<BottomSortBySheet> createState() => _BottomSortBySheetState();
}

class _BottomSortBySheetState extends State<BottomSortBySheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 352 / 812,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacing.vertical(14.0.h),
          _buildHandle(),
          Spacing.vertical(16.0.h),
          _buildTitle(),
          Spacing.vertical(17.0.h),
          for (final SortBy sortBy in SortBy.values) _buildTile(sortBy),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        height: 6.0.sp,
        width: 60.0.sp,
        decoration: BoxDecoration(
          color: AppColor.gray,
          borderRadius: BorderRadius.circular(100.0.r),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        'Sort By',
        style: CustomTextStyles.semiBold.size(18.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTile(SortBy sortBy) {
    return Container(
      width: double.infinity,
      color: sortBy == widget.selectedSort ? AppColor.red : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: sortBy == widget.selectedSort
              ? null
              : () => Navigator.of(context, rootNavigator: true).pop(sortBy),
          child: Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Text(
              sortBy.text,
              style: sortBy == widget.selectedSort
                  ? CustomTextStyles.semiBold.size(
                      16.0,
                      Colors.white,
                    )
                  : CustomTextStyles.regular.size(16.0),
            ),
          ),
        ),
      ),
    );
  }
}

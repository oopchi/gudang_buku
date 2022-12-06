import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/format_helper.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBySheet extends StatefulWidget {
  const FilterBySheet({
    super.key,
    this.appliedFilterModels,
  });
  final List<FilterModel>? appliedFilterModels;

  @override
  State<FilterBySheet> createState() => _FilterBySheetState();
}

class _FilterBySheetState extends State<FilterBySheet> {
  double pStart = .0;
  double pEnd = .0;

  double rStart = .0;
  double rEnd = .0;

  List<FilterModel>? _getFilterModels() {
    if (pStart == .0 && pEnd == 0 && rStart == 0 && rEnd == 0) return null;

    final List<FilterModel> filterModels = <FilterModel>[];

    if (pStart != .0 || pEnd != .0) {
      filterModels.add(FilterByPriceRange(
        minimumPrice: pStart.toInt(),
        maximumPrice: pEnd.toInt(),
      ));
    }

    if (rStart != .0 || rEnd != .0) {
      filterModels.add(FilterByRatingRange(
        minimumRating: rStart,
        maximumRating: rEnd,
      ));
    }

    return filterModels;
  }

  @override
  void initState() {
    super.initState();

    if (widget.appliedFilterModels == null) return;

    for (final FilterModel filterModel in widget.appliedFilterModels!) {
      if (filterModel is FilterByPriceRange) {
        pStart = filterModel.minimumPrice.toDouble();
        pEnd = filterModel.maximumPrice.toDouble();
      }

      if (filterModel is FilterByRatingRange) {
        rStart = filterModel.minimumRating;
        rEnd = filterModel.maximumRating;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pop(widget.appliedFilterModels),
              icon: const Icon(Icons.chevron_left),
              iconSize: 30.0.sp,
              padding: EdgeInsets.all(8.0.sp),
              constraints: const BoxConstraints(),
            ),
            Center(
              child: Text(
                'Filters',
                style: CustomTextStyles.semiBold.size(18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: <Widget>[
        _sectionLabel('Price Range'),
        _buildPriceSlider(),
        _sectionLabel('Rating Range'),
        _buildRatingSlider(),
      ],
    );
  }

  Widget _buildRatingSlider() {
    return RangeSlider(
      values: RangeValues(rStart, rEnd),
      onChanged: (RangeValues value) {
        setState(() {
          rStart = value.start;
          rEnd = value.end;
        });
      },
      divisions: 5,
      max: 5,
      inactiveColor: AppColor.gray,
      activeColor: AppColor.red,
      labels: RangeLabels(
        '${rStart.toInt()} stars',
        '${rEnd.toInt()} stars',
      ),
    );
  }

  Widget _buildPriceSlider() {
    return RangeSlider(
      values: RangeValues(pStart, pEnd),
      onChanged: (RangeValues value) {
        setState(() {
          pStart = value.start;
          pEnd = value.end;
        });
      },
      divisions: 10,
      max: 1000000,
      inactiveColor: AppColor.gray,
      activeColor: AppColor.red,
      labels: RangeLabels(
        FormatHelper.formatCurrency(pStart.toInt().toString()),
        FormatHelper.formatCurrency(pEnd.toInt().toString()),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 2.0.sp,
            offset: Offset(
              .0,
              -2.0.sp,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        16.0.w,
        14.0.h,
        .0,
        12.0.h,
      ),
      child: Text(
        label,
        style: CustomTextStyles.semiBold.size(16.0),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 104.0.h,
      padding: EdgeInsets.fromLTRB(
        16.0.w,
        20.0.h,
        16.0.w,
        48.0.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 8.0.sp,
            offset: Offset(
              .0,
              -4.0.sp,
            ),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AppOutlineButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              text: 'Discard',
              padding: 8.0,
              textStyle: CustomTextStyles.medium.size(
                14.0,
              ),
            ),
          ),
          Spacing.horizontal(23.0.w),
          Expanded(
            child: AppButton(
              onPressed: () => Navigator.of(context, rootNavigator: true)
                  .pop(_getFilterModels()),
              text: 'Apply',
              padding: 8.0,
              textStyle: CustomTextStyles.medium.size(
                14.0,
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

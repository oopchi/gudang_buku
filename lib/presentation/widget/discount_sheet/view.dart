import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/presentation/widget/button_helper.dart';
import 'package:gudang_buku/presentation/widget/discount_sheet/cubit.dart';
import 'package:gudang_buku/presentation/widget/discount_sheet/state.dart';
import 'package:gudang_buku/presentation/widget/loading_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:provider/provider.dart';

class DiscountSheet extends StatefulWidget {
  const DiscountSheet({super.key});

  @override
  State<DiscountSheet> createState() => _DiscountSheetState();
}

class _DiscountSheetState extends State<DiscountSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return DiscountSheetCubit(
          isMounted: () => mounted,
          discountController: Provider.of<DiscountController>(
            context,
            listen: false,
          ),
        )..load();
      },
      child: Builder(
        builder: (context) => _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<DiscountSheetCubit, DiscountSheetState>(
      listener: (context, state) {
        if (state is DiscountSheetFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      buildWhen: (previous, current) =>
          current is DiscountSheetAllDiscounts ||
          current is DiscountSheetLoading,
      builder: (context, state) {
        if (state is DiscountSheetLoading) {
          return SizedBox(
            height: 500.0.h,
            child: const LoadingView(),
          );
        }
        if (state is DiscountSheetAllDiscounts) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacing.vertical(14.0.h),
                _buildHandle(),
                Spacing.vertical(32.0.h),
                _buildPromoInput(context, state),
                Spacing.vertical(32.0.h),
                _buildTitle(),
                _buildList(context, state),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    DiscountSheetAllDiscounts allDiscounts,
  ) {
    return BlocBuilder<DiscountSheetCubit, DiscountSheetState>(
      buildWhen: (previous, current) =>
          current is DiscountSheetSmallLoading ||
          current is DiscountSheetFilteredDiscounts,
      builder: (context, state) {
        if (state is DiscountSheetSmallLoading) {
          return SizedBox(
            height: 500.0.h,
            child: const LoadingView(),
          );
        }
        if (state is DiscountSheetFilteredDiscounts) {
          return ListView(
            padding: EdgeInsets.symmetric(
              vertical: 18.0.h,
            ),
            shrinkWrap: true,
            children: <Widget>[
              for (final DiscountModel discount in state.discounts)
                _buildDiscountCard(discount),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDiscountCard(DiscountModel discount) {
    return Row(
      children: <Widget>[
        _buildImage(
          discount.imageUrl,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 14.0.sp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        discount.name,
                        style: CustomTextStyles.medium.size(14.0),
                      ),
                      Spacing.vertical(4.0.sp),
                      Text(
                        discount.code,
                        style: CustomTextStyles.regular.size(11.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 14.0.sp,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (discount.dateTimeRange != null)
                        Text(
                          '${discount.dateTimeRange!.duration.inDays} days remaining',
                          style: CustomTextStyles.medium.size(
                            11.0,
                            AppColor.gray,
                          ),
                        ),
                      if (discount.dateTimeRange != null)
                        Spacing.vertical(10.0.sp),
                      AppButton(
                        width: 93.0.sp,
                        height: 36.0.sp,
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true)
                                .pop(discount),
                        text: 'Apply',
                        textStyle: CustomTextStyles.medium.size(
                          14.0,
                          Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return SizedBox(
      height: 80.0.sp,
      width: 80.0.sp,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8.0.r),
        ),
        child: Image.network(
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

  Widget _buildTitle() {
    return Text(
      'Your Promo Codes',
      style: CustomTextStyles.semiBold.size(
        18.0,
      ),
    );
  }

  Widget _buildPromoInput(
    BuildContext context,
    DiscountSheetAllDiscounts allDiscounts,
  ) {
    final DiscountSheetCubit cubit =
        BlocProvider.of<DiscountSheetCubit>(context);
    final BorderRadius borderRadius = BorderRadius.horizontal(
      left: Radius.circular(8.0.r),
      right: Radius.circular(35.0.r),
    );
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
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
        child: TextFormField(
          onChanged: (value) {
            cubit.search(allDiscounts, value);
          },
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
}

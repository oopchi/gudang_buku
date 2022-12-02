import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    Key? key,
    required String content,
    Color backgroundColor = AppColor.error,
  }) : super(
          key: key,
          content: Text(
            content,
            style: CustomTextStyles.regular.size(
              16.0,
              AppColor.neutral,
            ),
          ),
          backgroundColor: backgroundColor,
          duration: const Duration(
            seconds: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8.0.r),
            ),
          ),
        );
}

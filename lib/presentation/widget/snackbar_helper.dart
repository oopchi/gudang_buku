import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    Key? key,
    required String content,
    Color backgroundColor = AppColor.error,
    Color textColor = Colors.white,
    Duration duration = const Duration(
      seconds: 2,
    ),
  }) : super(
          key: key,
          content: Text(
            content,
            style: CustomTextStyles.regular.size(
              16.0,
              textColor,
            ),
          ),
          backgroundColor: backgroundColor,
          duration: duration,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8.0.r),
            ),
          ),
        );
}

import 'package:bookstore/config/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CustomTextStyles {
  thin,
  extraLight,
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
  black,
}

extension CustomTextStylesExtension on CustomTextStyles {
  static final Map<CustomTextStyles, FontWeight> _fontWeights =
      <CustomTextStyles, FontWeight>{
    CustomTextStyles.thin: FontWeight.w100,
    CustomTextStyles.extraLight: FontWeight.w200,
    CustomTextStyles.light: FontWeight.w300,
    CustomTextStyles.regular: FontWeight.w400,
    CustomTextStyles.medium: FontWeight.w500,
    CustomTextStyles.semiBold: FontWeight.w600,
    CustomTextStyles.bold: FontWeight.w700,
    CustomTextStyles.extraBold: FontWeight.w800,
    CustomTextStyles.black: FontWeight.w900,
  };

  FontWeight get _fontWeight => _fontWeights[this]!;

  TextStyle size(double size, [Color? color]) => TextStyle(
        fontFamily: 'Metropolis',
        fontSize: size.sp,
        fontWeight: _fontWeight,
        color: color ?? AppColor.black,
      );
}

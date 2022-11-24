import 'package:flutter/material.dart';

enum CustomTextStyles {
  text3Xs,
  text2Xs,
  textXs,
  textSm,
  textBase,
  textLg,
  textXl,
  text2Xl,
  text3Xl,
}

extension CustomTextStylesExtension on CustomTextStyles {
  static final Map<CustomTextStyles, double> _fontSizes =
      <CustomTextStyles, double>{
    CustomTextStyles.text3Xs: 8.0,
    CustomTextStyles.text2Xs: 10.0,
    CustomTextStyles.textXs: 12.0,
    CustomTextStyles.textSm: 14.0,
    CustomTextStyles.textBase: 16.0,
    CustomTextStyles.textLg: 20.0,
    CustomTextStyles.textXl: 24.0,
    CustomTextStyles.text2Xl: 32.0,
    CustomTextStyles.text3Xl: 40.0,
  };

  double get _fontSize => _fontSizes[this]!;

  static final Map<CustomTextStyles, double> _lineHeights =
      <CustomTextStyles, double>{
    CustomTextStyles.text3Xs: 1.2,
    CustomTextStyles.text2Xs: 1.2,
    CustomTextStyles.textXs: 1.2,
    CustomTextStyles.textSm: 1.4,
    CustomTextStyles.textBase: 1.4,
    CustomTextStyles.textLg: 1.4,
    CustomTextStyles.textXl: 1.2,
    CustomTextStyles.text2Xl: 1.2,
    CustomTextStyles.text3Xl: 1.1,
  };

  double get _lineHeight => _lineHeights[this]!;

  TextStyle get light => TextStyle(
        fontFamily: 'Poppins',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w300,
      );

  TextStyle get regular => TextStyle(
        fontFamily: 'Poppins',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w400,
      );

  TextStyle get medium => TextStyle(
        fontFamily: 'Poppins',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w500,
      );

  TextStyle get semiBold => TextStyle(
        fontFamily: 'Poppins',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w600,
      );

  TextStyle get bold => TextStyle(
        fontFamily: 'Poppins',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w700,
      );
}

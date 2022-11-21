import 'package:flutter/material.dart';

enum CustomTextStyle {
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

extension CustomTextStyleExtension on CustomTextStyle {
  static final Map<CustomTextStyle, double> _fontSizes =
      <CustomTextStyle, double>{
    CustomTextStyle.text3Xs: 8.0,
    CustomTextStyle.text2Xs: 10.0,
    CustomTextStyle.textXs: 12.0,
    CustomTextStyle.textSm: 14.0,
    CustomTextStyle.textBase: 16.0,
    CustomTextStyle.textLg: 20.0,
    CustomTextStyle.textXl: 24.0,
    CustomTextStyle.text2Xl: 32.0,
    CustomTextStyle.text3Xl: 40.0,
  };

  double get _fontSize => _fontSizes[this]!;

  static final Map<CustomTextStyle, double> _lineHeights =
      <CustomTextStyle, double>{
    CustomTextStyle.text3Xs: 1.2,
    CustomTextStyle.text2Xs: 1.2,
    CustomTextStyle.textXs: 1.2,
    CustomTextStyle.textSm: 1.4,
    CustomTextStyle.textBase: 1.4,
    CustomTextStyle.textLg: 1.4,
    CustomTextStyle.textXl: 1.2,
    CustomTextStyle.text2Xl: 1.2,
    CustomTextStyle.text3Xl: 1.1,
  };

  double get _lineHeight => _lineHeights[this]!;

  TextStyle get regular => TextStyle(
        fontFamily: 'Araboto',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w400,
      );

  TextStyle get medium => TextStyle(
        fontFamily: 'Araboto',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w500,
      );

  TextStyle get semiBold => TextStyle(
        fontFamily: 'Araboto',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w600,
      );

  TextStyle get bold => TextStyle(
        fontFamily: 'Araboto',
        fontSize: _fontSize,
        height: _lineHeight,
        fontWeight: FontWeight.w700,
      );
}

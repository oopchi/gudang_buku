import 'package:flutter/material.dart';

enum AppTextStyles {
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

extension AppTextStylesExtension on AppTextStyles {
  static final Map<AppTextStyles, double> _fontSizes = <AppTextStyles, double>{
    AppTextStyles.text3Xs: 8.0,
    AppTextStyles.text2Xs: 10.0,
    AppTextStyles.textXs: 12.0,
    AppTextStyles.textSm: 14.0,
    AppTextStyles.textBase: 16.0,
    AppTextStyles.textLg: 20.0,
    AppTextStyles.textXl: 26.0,
    AppTextStyles.text2Xl: 32.0,
    AppTextStyles.text3Xl: 40.0,
  };

  double get _fontSize => _fontSizes[this]!;

  static final Map<AppTextStyles, double> _lineHeights =
      <AppTextStyles, double>{
    AppTextStyles.text3Xs: 1.2,
    AppTextStyles.text2Xs: 1.2,
    AppTextStyles.textXs: 1.2,
    AppTextStyles.textSm: 1.4,
    AppTextStyles.textBase: 1.4,
    AppTextStyles.textLg: 1.4,
    AppTextStyles.textXl: 1.2,
    AppTextStyles.text2Xl: 1.2,
    AppTextStyles.text3Xl: 1.1,
  };

  double get _lineHeight => _lineHeights[this]!;

  TextStyle get thin => TextStyle(
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

import 'package:gudangBuku/config/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.borderColor = const Color(0xFFDB3022),
    this.buttonColor = const Color(0xFFDB3022),
    this.onPressed,
    this.icon,
    this.padding,
    this.borderRadius = 100.0,
    required this.textStyle,
    this.width,
    this.height,
  });
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color borderColor;
  final Color buttonColor;
  final double? padding;
  final double borderRadius;
  final TextStyle textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFFD32626).withOpacity(.25),
              blurRadius: 8.0.sp,
              offset: Offset(.0, 4.0.sp),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: BorderSide(
              color: onPressed == null ? Colors.transparent : borderColor,
              width: 1.0.sp,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius.r),
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: padding != null
                  ? EdgeInsets.symmetric(
                      vertical: padding!.h,
                    )
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0.w,
                      ),
                      child: icon,
                    ),
                  Text(
                    text,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.text,
    this.borderColor = AppColor.black,
    this.buttonColor = Colors.transparent,
    this.onPressed,
    this.icon,
    required this.padding,
    this.borderRadius = 100.0,
    required this.textStyle,
    this.width,
    this.height,
  });
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color borderColor;
  final Color buttonColor;
  final double padding;
  final double borderRadius;
  final TextStyle textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: BorderSide(
              color: onPressed == null ? Colors.transparent : borderColor,
              width: 1.0.sp,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius.r),
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: padding.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (icon != null)
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0.w,
                      ),
                      child: icon,
                    ),
                  Text(
                    text,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

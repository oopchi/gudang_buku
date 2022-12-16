import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.onChanged,
    this.errorText,
    this.validator,
    this.label,
    this.hintText,
    this.controller,
    this.autofocus = false,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.autovalidateMode = false,
    this.prefixText,
    this.suffixText,
  });

  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool autovalidateMode;
  final String? prefixText;
  final String? suffixText;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0.r),
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
        autovalidateMode: widget.autovalidateMode
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          suffixText: widget.suffixText,
          suffixStyle: CustomTextStyles.medium.size(14.0, AppColor.gray),
          prefixStyle: CustomTextStyles.medium.size(14.0, AppColor.gray),
          errorStyle: CustomTextStyles.regular.size(
            11.0,
            AppColor.error,
          ),
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            gapPadding: .0,
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0.r),
            gapPadding: .0,
            borderSide: BorderSide(
              color: AppColor.error,
              width: 1.0.sp,
            ),
          ),
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          hintStyle: CustomTextStyles.medium.size(14.0, AppColor.gray),
          alignLabelWithHint: true,
          label: widget.label != null
              ? Text(
                  widget.label!,
                  style: CustomTextStyles.regular.size(14.0, AppColor.gray),
                )
              : null,
          fillColor: Colors.white,
          filled: true,
          suffix: widget.suffix,
        ),
      ),
    );
  }
}

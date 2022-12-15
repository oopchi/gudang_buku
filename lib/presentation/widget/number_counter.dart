import 'package:gudangBuku/config/constant/colors.dart';
import 'package:gudangBuku/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNumberCounter extends StatelessWidget {
  const AppNumberCounter({
    super.key,
    this.onChanged,
    required this.value,
    this.minValue = 1,
    this.maxValue = 99,
  });
  final ValueChanged<int>? onChanged;
  final int value;
  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildChangeButton(
          onClick: () {
            if (onChanged != null) {
              onChanged!(value - 1);
            }
          },
          iconData: Icons.remove,
        ),
        _buildValueDisplay(),
        _buildChangeButton(
          onClick: () {
            if (value + 1 <= maxValue) {
              if (onChanged != null) {
                onChanged!(value + 1);
              }
            }
          },
          iconData: Icons.add,
        ),
      ],
    );
  }

  Widget _buildValueDisplay() {
    return SizedBox(
      width: 37.0.sp,
      child: Center(
        child: FittedBox(
          child: Text(
            value.toString(),
            style: CustomTextStyles.medium.size(14.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildChangeButton({
    required VoidCallback onClick,
    required IconData iconData,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0.r),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 8.0.sp,
            offset: Offset(
              .0,
              4.0.sp,
            ),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100.0.r),
          onTap: onClick,
          child: SizedBox(
            height: 36.0.sp,
            width: 36.0.sp,
            child: Center(
              child: Icon(
                iconData,
                size: 24.0.sp,
                color: AppColor.gray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

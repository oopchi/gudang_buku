import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                '404 - Page Not Found',
                style: CustomTextStyles.black.size(64.0),
                textAlign: TextAlign.center,
              ),
            ),
            Spacing.vertical(18.0.h),
            AppButton(
              onPressed: () => context.goNamed(AppRoutes.home.name),
              height: 48.0.sp,
              width: 264.0.sp,
              text: 'Go to Home',
              textStyle: CustomTextStyles.medium.size(
                24.0,
                Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

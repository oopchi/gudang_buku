import 'package:bookstore/config/constant/colors.dart';
import 'package:flutter/material.dart';

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.red,
      ),
    );
  }
}

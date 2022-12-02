import 'package:bookstore/config/constant/colors.dart';
import 'package:flutter/material.dart';

class AppBarHelper extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHelper({
    Key? key,
    this.height = 96.0,
    required this.child,
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        elevation: .0,
        flexibleSpace: _buildAppBarContent(context),
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}

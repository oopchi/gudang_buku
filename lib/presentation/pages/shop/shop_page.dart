import 'package:bookstore/presentation/pages/login/desktop/view.dart';
import 'package:bookstore/presentation/pages/login/tablet/view.dart';
import 'package:bookstore/presentation/pages/register/mobile/view.dart';
import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: RegisterMobilePage(),
      tabletBody: LoginTabletPage(),
      desktopBody: LoginDesktopPage(),
    );
  }
}

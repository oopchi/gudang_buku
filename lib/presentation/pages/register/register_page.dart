import 'package:bookstore/presentation/pages/login/desktop/view.dart';
import 'package:bookstore/presentation/pages/login/mobile/view.dart';
import 'package:bookstore/presentation/pages/login/tablet/view.dart';
import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: LoginMobilePage(),
      tabletBody: LoginTabletPage(),
      desktopBody: LoginDesktopPage(),
    );
  }
}

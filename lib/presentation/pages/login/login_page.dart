import 'package:gudangBuku/presentation/pages/login/desktop/view.dart';
import 'package:gudangBuku/presentation/pages/login/mobile/view.dart';
import 'package:gudangBuku/presentation/pages/login/tablet/view.dart';
import 'package:gudangBuku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: LoginMobilePage(),
      tabletBody: LoginMobilePage(),
      desktopBody: LoginMobilePage(),
    );
  }
}

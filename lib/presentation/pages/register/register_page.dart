import 'package:gudang_buku/presentation/pages/login/desktop/view.dart';
import 'package:gudang_buku/presentation/pages/login/tablet/view.dart';
import 'package:gudang_buku/presentation/pages/register/mobile/view.dart';
import 'package:gudang_buku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: RegisterMobilePage(),
      tabletBody: RegisterMobilePage(),
      desktopBody: RegisterMobilePage(),
    );
  }
}

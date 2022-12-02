import 'package:bookstore/presentation/pages/home/mobile/view.dart';
import 'package:bookstore/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: HomeMobilePage(),
      tabletBody: HomeMobilePage(),
      desktopBody: HomeMobilePage(),
    );
  }
}

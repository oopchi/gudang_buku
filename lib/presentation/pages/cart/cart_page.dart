import 'package:gudang_buku/presentation/pages/cart/mobile/view.dart';
import 'package:gudang_buku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: CartMobilePage(),
      tabletBody: CartMobilePage(),
      desktopBody: CartMobilePage(),
    );
  }
}

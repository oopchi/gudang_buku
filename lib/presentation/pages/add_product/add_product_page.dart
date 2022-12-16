import 'package:gudang_buku/presentation/pages/add_product/mobile/view.dart';
import 'package:gudang_buku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: AddProductMobilePage(),
      tabletBody: AddProductMobilePage(),
      desktopBody: AddProductMobilePage(),
    );
  }
}

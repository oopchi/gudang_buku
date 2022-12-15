import 'package:gudangBuku/domain/controller/shop_view_controller.dart';
import 'package:gudangBuku/domain/model/filter_model.dart';
import 'package:gudangBuku/presentation/pages/product/mobile/view.dart';
import 'package:gudangBuku/presentation/pages/shop/mobile/state.dart';
import 'package:gudangBuku/presentation/pages/shop/mobile/view.dart';
import 'package:gudangBuku/presentation/widget/responsive_helper.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: ProductMobilePage(
        productId: productId,
      ),
      tabletBody: ProductMobilePage(
        productId: productId,
      ),
      desktopBody: ProductMobilePage(
        productId: productId,
      ),
    );
  }
}

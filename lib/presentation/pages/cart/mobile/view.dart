import 'package:gudang_buku/inter/repository/favorite_repository_fs.dart';
import 'package:gudang_buku/inter/repository/transaction_detail_repository_fs.dart';
import 'package:gudang_buku/inter/repository/transaction_repository_fs.dart';
import 'package:gudang_buku/service/auth_service_impl.dart';
import 'package:gudang_buku/domain/controller/discount_controller.dart';
import 'package:gudang_buku/domain/controller/product_controller.dart';
import 'package:gudang_buku/presentation/pages/cart/mobile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit.dart';

class CartMobilePage extends StatefulWidget {
  const CartMobilePage({super.key});

  @override
  State<CartMobilePage> createState() => _CartMobilePageState();
}

class _CartMobilePageState extends State<CartMobilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CartMobileCubit(
          isMounted: () => mounted,
          discountController: Provider.of<DiscountController>(
            context,
            listen: false,
          ),
          authServiceFS: Provider.of<AuthServiceImpl>(
            context,
            listen: false,
          ),
          productController: Provider.of<ProductController>(
            context,
            listen: false,
          ),
          favoriteRepository: FavoriteRepositoryFS(),
          transactionDetailRepository: TransactionDetailRepositoryFS(),
          transactionRepository: TransactionRepositoryFS(),
        )..load();
      },
      child: Builder(
        builder: (context) => const CartMobileBody(),
      ),
    );
  }
}

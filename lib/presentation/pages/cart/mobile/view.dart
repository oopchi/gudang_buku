import 'package:gudangBuku/data/repository/favorite_repository_fs.dart';
import 'package:gudangBuku/data/repository/transaction_detail_repository_fs.dart';
import 'package:gudangBuku/data/repository/transaction_repository_fs.dart';
import 'package:gudangBuku/data/service/auth_service_fs.dart';
import 'package:gudangBuku/domain/controller/product_controller.dart';
import 'package:gudangBuku/presentation/pages/cart/mobile/components/body.dart';
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
          authServiceFS: Provider.of<AuthServiceFS>(
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

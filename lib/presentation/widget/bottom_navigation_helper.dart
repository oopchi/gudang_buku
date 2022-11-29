import 'package:bookstore/config/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffold extends StatelessWidget {
  const BottomNavigationScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(context),
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            context.goNamed(AppRoutes.home);
            break;
          case 1:
            context.goNamed(AppRoutes.shop);
            break;
          case 2:
            context.goNamed(AppRoutes.cart);
            break;
          case 3:
            context.goNamed(AppRoutes.favorites);
            break;
          case 4:
            context.goNamed(AppRoutes.profile);
            break;
          default:
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shop,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
        ),
      ],
    );
  }
}

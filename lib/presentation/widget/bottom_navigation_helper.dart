import 'package:gudang_buku/config/constant/dimensions.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScaffold extends StatelessWidget {
  const BottomNavigationScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

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
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNavigationBar(context),
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: AppDimensions.bottomNavBarHeight.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        18.0.w,
        .0,
        18.0.w,
        25.0.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildIconButton(
            activeIcon: Icons.home,
            inactiveIcon: Icons.home,
            label: 'Home',
            isSelected: currentIndex == 0,
            onTap: () => context.goNamed(AppRoutes.home.name),
          ),
          _buildIconButton(
            activeIcon: Icons.shopping_cart,
            inactiveIcon: Icons.shopping_cart,
            label: 'Shop',
            isSelected: currentIndex == 1,
            onTap: () => context.goNamed(AppRoutes.shop.name),
          ),
          _buildIconButton(
            activeIcon: Icons.shopping_bag,
            inactiveIcon: Icons.shopping_bag,
            label: 'Bag',
            isSelected: currentIndex == 2,
            onTap: () => context.goNamed(AppRoutes.cart.name),
          ),
          _buildIconButton(
            activeIcon: Icons.favorite,
            inactiveIcon: Icons.favorite,
            label: 'Favorite',
            isSelected: currentIndex == 3,
            onTap: () => context.goNamed(AppRoutes.favorites.name),
          ),
          _buildIconButton(
            activeIcon: Icons.account_circle,
            inactiveIcon: Icons.account_circle_outlined,
            label: 'Profile',
            isSelected: currentIndex == 4,
            onTap: () => context.goNamed(AppRoutes.addProduct.name),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData activeIcon,
    required IconData inactiveIcon,
    required String label,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Column(
            children: <Widget>[
              Icon(
                isSelected ? activeIcon : inactiveIcon,
                size: 30.0.sp,
                color: isSelected
                    ? const Color(0xFFDB3022)
                    : const Color(0xFF9B9B9B),
              ),
              Spacing.vertical(2.0.sp),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 10.0.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFFDB3022)
                      : const Color(0xFF9B9B9B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

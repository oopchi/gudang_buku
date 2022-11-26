import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:flutter/material.dart';

class HomeMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeMobileAppBar({super.key});

  final double height = 120.0;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.neutral,
        elevation: .0,
        flexibleSpace: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Row(
          children: <Widget>[
            const Spacing.horizontal(5.0),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              iconSize: 35.0,
              padding: const EdgeInsets.all(30.0),
              constraints: const BoxConstraints(),
              color: AppColor.primary,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    iconSize: 40.0,
                    onPressed: () {},
                    padding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(),
                    icon: CircleAvatar(
                      child: Image.network(
                        'https://example.com/',
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_checkout),
                    iconSize: 35.0,
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(10.0),
                    color: AppColor.primary,
                  ),
                  const Spacing.horizontal(25.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

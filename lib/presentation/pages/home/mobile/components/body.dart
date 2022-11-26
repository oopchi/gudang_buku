import 'package:bookstore/presentation/pages/home/mobile/components/category.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/header.dart';
import 'package:bookstore/presentation/pages/home/mobile/components/search_bar.dart';
import 'package:flutter/material.dart';

class HomeMobileBody extends StatelessWidget {
  const HomeMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            const HomeMobileHeader(),
            const HomeMobileSearchBar(),
          ],
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                key: const PageStorageKey<String>('HomeViewCustomScrollView'),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: const <Widget>[
                        HomeMobileCategory(),
                      ],
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(
                      top: 102.0,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Positioned(
        //   bottom: .0,
        //   left: .0,
        //   right: .0,
        //   child: _buildBottomNavBar(),
        // ),
      ],
    );
  }
}

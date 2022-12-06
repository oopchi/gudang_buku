import 'package:flutter/material.dart';

class AppSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  AppSliverPersistentHeaderDelegate({
    required this.builder,
    required this.height,
  });

  final Widget Function(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) builder;
  final double height;

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
  }

  @override
  bool shouldRebuild(AppSliverPersistentHeaderDelegate oldDelegate) => true;
}

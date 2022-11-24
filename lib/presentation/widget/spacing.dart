import 'package:flutter/material.dart';

class Spacing extends SizedBox {
  const Spacing({
    super.key,
    super.width,
    super.height,
    super.child,
  });

  const Spacing.horizontal(
    double width, {
    super.key,
    super.child,
  }) : super(width: width);

  const Spacing.vertical(
    double height, {
    super.key,
    super.child,
  }) : super(height: height);
}

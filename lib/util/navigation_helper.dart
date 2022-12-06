import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNav {
  static void back(BuildContext context) {
    if (!context.canPop()) return;

    final String urlString = GoRouter.of(context).location;

    final String newUrl = urlString.substring(0, urlString.lastIndexOf('/'));

    context.go(newUrl);
  }
}

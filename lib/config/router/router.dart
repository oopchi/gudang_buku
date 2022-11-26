import 'package:bookstore/config/router/middleware/auth.dart';
import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppRouter {
  AppRouter._internal();

  factory AppRouter() => _instance;

  static final AppRouter _instance = AppRouter._internal();

  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomePage(),
        // redirect: (context, state) async {
        //   final Box<GenreResponse> genre =
        //       await Hive.openBox<GenreResponse>(LocalStorageKeys.genre.label);

        //   if (!await AuthMiddleware.isAuthenticated()) {
        //     return '/home';
        //   }

        //   return '/home';
        // },
      ),
    ],
  );
}

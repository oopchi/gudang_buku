import 'package:bookstore/presentation/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._internal();

  factory AppRouter() => _instance;

  static final AppRouter _instance = AppRouter._internal();

  final router = GoRouter(
    initialLocation: '/home',
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

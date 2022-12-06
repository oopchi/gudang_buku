import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/domain/controller/shop_view_controller.dart';
import 'package:bookstore/domain/model/filter_model.dart';
import 'package:bookstore/presentation/pages/home/home_page.dart';
import 'package:bookstore/presentation/pages/login/login_page.dart';
import 'package:bookstore/presentation/pages/register/register_page.dart';
import 'package:bookstore/presentation/pages/shop/mobile/state.dart';
import 'package:bookstore/presentation/pages/shop/shop_page.dart';
import 'package:bookstore/presentation/widget/bottom_navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  AppRouter._internal();

  factory AppRouter() => _instance;

  static final AppRouter _instance = AppRouter._internal();

  final router = GoRouter(
    initialLocation: AppRoutes.home.fullPath,
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.landingPage.name,
        path: AppRoutes.landingPage.path,
        builder: (context, state) => const HomePage(),
        redirect: (context, state) async => await Provider.of<AuthServiceFS>(
          context,
          listen: false,
        ).isLoggedIn()
            ? AppRoutes.home.fullPath
            : null,
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.landingPageToSignUp.name,
            path: AppRoutes.landingPageToSignUp.path,
            builder: (context, state) => const RegisterPage(),
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? AppRoutes.home.fullPath
                    : null,
          ),
          GoRoute(
            name: AppRoutes.landingPageToLogin.name,
            path: AppRoutes.landingPageToLogin.path,
            builder: (context, state) => const LoginPage(),
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? AppRoutes.home.fullPath
                    : null,
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.loginToForgotPassword.name,
                path: AppRoutes.loginToForgotPassword.path,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          switch (state.fullpath) {
            case '/home':
              return BottomNavigationScaffold(
                currentIndex: 0,
                child: child,
              );
            case '/shop':
              return BottomNavigationScaffold(
                currentIndex: 1,
                child: child,
              );
            case '/cart':
              return BottomNavigationScaffold(
                currentIndex: 2,
                child: child,
              );
            case '/favorites':
              return BottomNavigationScaffold(
                currentIndex: 3,
                child: child,
              );
            case '/profile':
              return BottomNavigationScaffold(
                currentIndex: 4,
                child: child,
              );
            default:
              return child;
          }
        },
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.home.name,
            path: AppRoutes.home.path,
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? null
                    : AppRoutes.landingPageToLogin.fullPath,
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.homeToShop.name,
                path: AppRoutes
                    .homeToShop.path, // pake query param bukan path param
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.shop.name,
            path: AppRoutes.shop.path,
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? null
                    : AppRoutes.landingPageToLogin.fullPath,
            builder: (context, state) {
              final Map<String, String> q = state.queryParams;
              SortBy? sortBy;
              final List<FilterModel> filterModels = <FilterModel>[];

              if (q['sortBy'] != null) {
                sortBy = SortByExt.getObjFromString(q['sortBy']!);
              }

              if (q['pmax'] != null || q['pmin'] != null) {
                const FilterType filterType = FilterType.price;

                final double min = double.tryParse(q['pmin'] ?? '0') ?? .0;
                final double max = double.tryParse(q['pmax'] ?? '0') ?? .0;

                final filterModel = FilterModel.fromParam(filterType, min, max);

                filterModels.add(filterModel);
              }

              if (q['rmax'] != null || q['rmin'] != null) {
                const FilterType filterType = FilterType.rating;

                final double min = double.tryParse(q['rmin'] ?? '0') ?? .0;
                final double max = double.tryParse(q['rmax'] ?? '0') ?? .0;

                final filterModel = FilterModel.fromParam(filterType, min, max);

                filterModels.add(filterModel);
              }

              final ListType listType =
                  ListTypeExt.fromString(q['listType']) ?? ListType.list;

              final String genreId = q['genreId'] ?? '';

              return ShopPage(
                key: UniqueKey(),
                filterModels: filterModels,
                sortBy: sortBy,
                listType: listType,
                genreId: genreId,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.shopToProduct.name,
                path: AppRoutes.shopToProduct.path,
                builder: (context, state) => const ShopPage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.favorites.name,
            path: AppRoutes.favorites.path,
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? null
                    : AppRoutes.landingPageToLogin.fullPath,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: AppRoutes.cart.name,
            path: AppRoutes.cart.path,
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? null
                    : AppRoutes.landingPageToLogin.fullPath,
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.cartToCheckout.name,
                path: AppRoutes.cartToCheckout.path,
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.cartToCheckoutToPaymentMethods.name,
                    path: AppRoutes.cartToCheckoutToPaymentMethods.path,
                    builder: (context, state) => const HomePage(),
                    routes: <RouteBase>[
                      GoRoute(
                        name:
                            AppRoutes.cartToCheckoutToPaymentMethodsToAdd.name,
                        path:
                            AppRoutes.cartToCheckoutToPaymentMethodsToAdd.path,
                        builder: (context, state) => const HomePage(),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: AppRoutes.cartToCheckoutToShippingAddress.name,
                    path: AppRoutes.cartToCheckoutToShippingAddress.path,
                    builder: (context, state) => const HomePage(),
                    routes: <RouteBase>[
                      GoRoute(
                        name:
                            AppRoutes.cartToCheckoutToShippingAddressToAdd.name,
                        path:
                            AppRoutes.cartToCheckoutToShippingAddressToAdd.path,
                        builder: (context, state) => const HomePage(),
                      ),
                      GoRoute(
                        name: AppRoutes
                            .cartToCheckoutToShippingAddressToEdit.name,
                        path: AppRoutes
                            .cartToCheckoutToShippingAddressToEdit.path,
                        builder: (context, state) => const HomePage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.profile.name,
            path: AppRoutes.profile.path,
            redirect: (context, state) async =>
                await Provider.of<AuthServiceFS>(
              context,
              listen: false,
            ).isLoggedIn()
                    ? null
                    : AppRoutes.landingPageToLogin.fullPath,
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.profileToOrders.name,
                path: AppRoutes.profileToOrders.path,
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToOrdersToOrderDetails.name,
                    path: AppRoutes.profileToOrdersToOrderDetails.path,
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToSettings.name,
                path: AppRoutes.profileToSettings.path,
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                name: AppRoutes.profileToReviews.name,
                path: AppRoutes.profileToReviews.path,
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                name: AppRoutes.profileToPaymentMethods.name,
                path: AppRoutes.profileToPaymentMethods.path,
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToPaymentMethodsToAdd.name,
                    path: AppRoutes.profileToPaymentMethodsToAdd.path,
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToShippingAddress.name,
                path: AppRoutes.profileToShippingAddress.path,
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToShippingAddressToAdd.name,
                    path: AppRoutes.profileToShippingAddressToAdd.path,
                    builder: (context, state) => const HomePage(),
                  ),
                  GoRoute(
                    name: AppRoutes.profileToShippingAddressToEdit.name,
                    path: AppRoutes.profileToShippingAddressToEdit.path,
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToPromoCodes.name,
                path: AppRoutes.profileToPromoCodes.path,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

import 'dart:async';

import 'package:gudangBuku/presentation/pages/cart/cart_page.dart';
import 'package:gudangBuku/presentation/widget/loading_helper.dart';
import 'package:gudangBuku/presentation/widget/route_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gudangBuku/config/constant/routes.dart';
import 'package:gudangBuku/domain/model/filter_model.dart';
import 'package:gudangBuku/presentation/pages/add_product/add_product_page.dart';
import 'package:gudangBuku/presentation/pages/favorites/favorites_page.dart';
import 'package:gudangBuku/presentation/pages/home/home_page.dart';
import 'package:gudangBuku/presentation/pages/login/login_page.dart';
import 'package:gudangBuku/presentation/pages/product/product_page.dart';
import 'package:gudangBuku/presentation/pages/register/register_page.dart';
import 'package:gudangBuku/presentation/pages/shop/shop_page.dart';
import 'package:gudangBuku/presentation/widget/bottom_navigation_helper.dart';
import 'package:gudangBuku/presentation/widget/error_helper.dart';
import 'package:gudangBuku/util/list_type_helper.dart';
import 'package:gudangBuku/util/sort_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._internal() {
    _init();
  }

  static final AppRouter _instance = AppRouter._internal();

  factory AppRouter() => _instance;

  bool _isInit = false;

  bool _isLoggedIn = false;

  late final StreamSubscription<User?> _userSubs;

  late final StreamController _streamController;

  late final Stream _userStream;

  late final GoRouter router;

  late final GoRouterRefreshStream _goRouterRefreshStream;

  void _init() {
    _streamController = StreamController(
      onListen: _isInit
          ? null
          : () => _userSubs =
                  FirebaseAuth.instance.authStateChanges().listen((event) {
                _isLoggedIn = event != null;
                _isInit = true;
                _streamController.add(event);
              }),
      onCancel: () async => _userSubs.cancel(),
    );
    _userStream = _streamController.stream.asBroadcastStream();
    _goRouterRefreshStream = GoRouterRefreshStream(_userStream);

    router = GoRouter(
      redirectLimit: 10,
      debugLogDiagnostics: true,
      refreshListenable: _goRouterRefreshStream,
      initialLocation: AppRoutes.landingPageToLogin.fullPath,
      errorBuilder: (context, state) => const NotFoundView(),
      redirect: (context, state) async {
        if (!_isInit) {
          await _userStream.first;
        }

        final RegExp regExp =
            RegExp(r'(home)|(shop)|(cart)|(favorites)|(profile)');

        if (regExp.hasMatch(state.location)) {
          return _isLoggedIn ? null : AppRoutes.landingPageToLogin.fullPath;
        } else if (state.location == '/login' || state.location == '/sign-up') {
          return _isLoggedIn ? AppRoutes.home.fullPath : null;
        }
// else if (state.location == 'add-product') {
//         return await _authServiceFS.isAdmin() ? null : AppRoutes.home.name;
//       }
        return null;
      },
      routes: <RouteBase>[
        ShellRoute(
          builder: (context, state, child) => child,
          routes: <RouteBase>[
            GoRoute(
              name: AppRoutes.addProduct.name,
              path: AppRoutes.addProduct.path,
              builder: (context, state) => const AddProductPage(),
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

                  final filterModel =
                      FilterModel.fromParam(filterType, min, max);

                  filterModels.add(filterModel);
                }

                if (q['rmax'] != null || q['rmin'] != null) {
                  const FilterType filterType = FilterType.rating;

                  final double min = double.tryParse(q['rmin'] ?? '0') ?? .0;
                  final double max = double.tryParse(q['rmax'] ?? '0') ?? .0;

                  final filterModel =
                      FilterModel.fromParam(filterType, min, max);

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
                  builder: (context, state) =>
                      ProductPage(productId: state.params['product']!),
                ),
              ],
            ),
            GoRoute(
              name: AppRoutes.favorites.name,
              path: AppRoutes.favorites.path,
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

                  final filterModel =
                      FilterModel.fromParam(filterType, min, max);

                  filterModels.add(filterModel);
                }

                if (q['rmax'] != null || q['rmin'] != null) {
                  const FilterType filterType = FilterType.rating;

                  final double min = double.tryParse(q['rmin'] ?? '0') ?? .0;
                  final double max = double.tryParse(q['rmax'] ?? '0') ?? .0;

                  final filterModel =
                      FilterModel.fromParam(filterType, min, max);

                  filterModels.add(filterModel);
                }

                final ListType listType =
                    ListTypeExt.fromString(q['listType']) ?? ListType.list;

                final String genreId = q['genreId'] ?? '';
                return FavoritesPage(
                  filterModels: filterModels,
                  genreId: genreId,
                  listType: listType,
                  sortBy: sortBy,
                );
              },
            ),
            GoRoute(
              name: AppRoutes.cart.name,
              path: AppRoutes.cart.path,
              builder: (context, state) => const CartPage(),
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
                          name: AppRoutes
                              .cartToCheckoutToPaymentMethodsToAdd.name,
                          path: AppRoutes
                              .cartToCheckoutToPaymentMethodsToAdd.path,
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
                          name: AppRoutes
                              .cartToCheckoutToShippingAddressToAdd.name,
                          path: AppRoutes
                              .cartToCheckoutToShippingAddressToAdd.path,
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
        GoRoute(
          name: AppRoutes.landingPage.name,
          path: AppRoutes.landingPage.path,
          builder: (context, state) => const AppLoadingView(),
          routes: <RouteBase>[
            GoRoute(
              name: AppRoutes.landingPageToSignUp.name,
              path: AppRoutes.landingPageToSignUp.path,
              builder: (context, state) => const RegisterPage(),
            ),
            GoRoute(
              name: AppRoutes.landingPageToLogin.name,
              path: AppRoutes.landingPageToLogin.path,
              builder: (context, state) => const LoginPage(),
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
      ],
    );
  }
}

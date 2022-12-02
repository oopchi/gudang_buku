import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/data/service/auth_service_fs.dart';
import 'package:bookstore/presentation/pages/home/home_page.dart';
import 'package:bookstore/presentation/pages/login/login_page.dart';
import 'package:bookstore/presentation/pages/register/register_page.dart';
import 'package:bookstore/presentation/widget/bottom_navigation_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  AppRouter._internal();

  factory AppRouter() => _instance;

  static final AppRouter _instance = AppRouter._internal();

  final router = GoRouter(
    initialLocation: AppRoutes.landingPageToLogin.fullPath,
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.landingPage.name,
        path: AppRoutes.landingPage.path,
        builder: (context, state) => const HomePage(),
        // redirect: (context, state) async =>
        // await Provider.of<AuthServiceFS>(context).isLoggedIn()
        //     ? AppRoutes.home.fullPath
        //     : null,
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
            // redirect: (context, state) => AuthServiceFS().isLoggedIn()
            //     ? null
            //     : AppRoutes.landingPageToLogin.fullPath,
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
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.shopToProduct.name,
                path: AppRoutes.shopToProduct.path,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.favorites.name,
            path: AppRoutes.favorites.path,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: AppRoutes.cart.name,
            path: AppRoutes.cart.path,
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

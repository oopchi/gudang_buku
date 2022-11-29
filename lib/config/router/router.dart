import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/presentation/pages/home/home_page.dart';
import 'package:bookstore/presentation/widget/bottom_navigation_helper.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._internal();

  factory AppRouter() => _instance;

  static final AppRouter _instance = AppRouter._internal();

  final router = GoRouter(
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.landingPage,
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.landingPageToSignUp,
            path: 'sign-up',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: AppRoutes.landingPageToLogin,
            path: 'login',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.loginToForgotPassword,
                path: 'forgot-password',
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
            name: AppRoutes.home,
            path: '/home',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.homeToShop,
                path: 'shop', // pake query param bukan path param
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.shop,
            path: '/shop',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.shopToProduct,
                path: ':product',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.favorites,
            path: '/favorites',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: AppRoutes.cart,
            path: '/cart',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.cartToCheckout,
                path: 'checkout',
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.cartToCheckoutToPaymentMethods,
                    path: 'payment-methods',
                    builder: (context, state) => const HomePage(),
                    routes: <RouteBase>[
                      GoRoute(
                        name: AppRoutes.cartToCheckoutToPaymentMethodsToAdd,
                        path: 'add',
                        builder: (context, state) => const HomePage(),
                      ),
                    ],
                  ),
                  GoRoute(
                    name: AppRoutes.cartToCheckoutToShippingAddress,
                    path: 'shipping-address',
                    builder: (context, state) => const HomePage(),
                    routes: <RouteBase>[
                      GoRoute(
                        name: AppRoutes.cartToCheckoutToShippingAddressToAdd,
                        path: 'add',
                        builder: (context, state) => const HomePage(),
                      ),
                      GoRoute(
                        name: AppRoutes.cartToCheckoutToShippingAddressToEdit,
                        path: ':shippingAddress',
                        builder: (context, state) => const HomePage(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.profile,
            path: '/profile',
            builder: (context, state) => const HomePage(),
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.profileToOrders,
                path: 'orders',
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToOrdersToOrderDetails,
                    path: ':order',
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToSettings,
                path: 'settings',
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                name: AppRoutes.profileToReviews,
                path: 'reviews',
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                name: AppRoutes.profileToPaymentMethods,
                path: 'payment-methods',
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToPaymentMethodsToAdd,
                    path: 'add',
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToShippingAddress,
                path: 'shipping-address',
                builder: (context, state) => const HomePage(),
                routes: <RouteBase>[
                  GoRoute(
                    name: AppRoutes.profileToShippingAddressToAdd,
                    path: 'add',
                    builder: (context, state) => const HomePage(),
                  ),
                  GoRoute(
                    name: AppRoutes.profileToShippingAddressToEdit,
                    path: ':shippingAddress',
                    builder: (context, state) => const HomePage(),
                  ),
                ],
              ),
              GoRoute(
                name: AppRoutes.profileToPromoCodes,
                path: 'promo-codes',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

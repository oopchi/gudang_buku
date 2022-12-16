enum AppRoutes {
  addProduct,
  landingPage,
  landingPageToSignUp,
  landingPageToLogin,
  loginToForgotPassword,
  home,
  shop,
  shopToProduct,
  favorites,
  cart,
  cartToCheckout,
  profile,
  profileToOrders,
  profileToOrdersToOrderDetails,
  profileToSettings,
  profileToReviews,
  profileToShippingAddress,
  profileToPromoCodes,
  profileToPaymentMethods,
}

extension AppRoutesExt on AppRoutes {
  static final Map<AppRoutes, String> _names = <AppRoutes, String>{
    AppRoutes.addProduct: 'add-product',
    AppRoutes.landingPage: 'landingPage',
    AppRoutes.landingPageToSignUp: 'landingPageToSignUp',
    AppRoutes.landingPageToLogin: 'landingPageToLogin',
    AppRoutes.loginToForgotPassword: 'loginToForgotPassword',
    AppRoutes.home: 'home',
    AppRoutes.shop: 'shop',
    AppRoutes.shopToProduct: 'shopToProduct',
    AppRoutes.favorites: 'favorites',
    AppRoutes.cart: 'cart',
    AppRoutes.cartToCheckout: 'cartToCheckout',
    AppRoutes.profile: 'profile',
    AppRoutes.profileToOrders: 'profileToOrders',
    AppRoutes.profileToOrdersToOrderDetails: 'profileToOrdersToOrderDetails',
    AppRoutes.profileToSettings: 'profileToSettings',
    AppRoutes.profileToReviews: 'profileToReviews',
    AppRoutes.profileToShippingAddress: 'profileToShippingAddress',
    AppRoutes.profileToPromoCodes: 'profileToPromoCodes',
    AppRoutes.profileToPaymentMethods: 'profileToPaymentMethods',
  };

  String get name => _names[this]!;

  static final Map<AppRoutes, String> _paths = <AppRoutes, String>{
    AppRoutes.addProduct: '/add-product',
    AppRoutes.landingPage: '/',
    AppRoutes.landingPageToSignUp: 'sign-up',
    AppRoutes.landingPageToLogin: 'login',
    AppRoutes.loginToForgotPassword: 'forgot-password',
    AppRoutes.home: '/home',
    AppRoutes.shop: '/shop',
    AppRoutes.shopToProduct: ':product',
    AppRoutes.favorites: '/favorites',
    AppRoutes.cart: '/cart',
    AppRoutes.cartToCheckout: 'checkout',
    AppRoutes.profile: '/profile',
    AppRoutes.profileToOrders: 'orders',
    AppRoutes.profileToOrdersToOrderDetails: ':orderId',
    AppRoutes.profileToSettings: 'settings',
    AppRoutes.profileToReviews: 'reviews',
    AppRoutes.profileToShippingAddress: 'shipping-address',
    AppRoutes.profileToPromoCodes: 'promo-codes',
    AppRoutes.profileToPaymentMethods: 'payment-methods',
  };

  String get path => _paths[this]!;

  static final Map<AppRoutes, String> _fullPaths = <AppRoutes, String>{
    AppRoutes.addProduct: '/add-product',
    AppRoutes.landingPage: '/',
    AppRoutes.landingPageToSignUp: '/sign-up',
    AppRoutes.landingPageToLogin: '/login',
    AppRoutes.loginToForgotPassword: '/forgot-password',
    AppRoutes.home: '/home',
    AppRoutes.shop: '/shop',
    AppRoutes.shopToProduct: '/shop/:product',
    AppRoutes.favorites: '/favorites',
    AppRoutes.cart: '/cart',
    AppRoutes.cartToCheckout: '/cart/checkout',
    AppRoutes.profile: '/profile',
    AppRoutes.profileToOrders: '/profile/orders',
    AppRoutes.profileToOrdersToOrderDetails: '/profile/orders/:orderId',
    AppRoutes.profileToSettings: '/profile/settings',
    AppRoutes.profileToReviews: '/profile/reviews',
    AppRoutes.profileToShippingAddress: '/profile/shipping-address',
    AppRoutes.profileToPromoCodes: '/profile/promo-codes',
    AppRoutes.profileToPaymentMethods: '/profile/payment-methods',
  };

  String get fullPath => _fullPaths[this]!;
}

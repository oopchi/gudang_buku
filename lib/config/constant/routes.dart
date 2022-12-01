enum AppRoutes {
  landingPage,
  landingPageToSignUp,
  landingPageToLogin,
  loginToForgotPassword,
  home,
  homeToShop,
  shop,
  shopToProduct,
  favorites,
  cart,
  cartToCheckout,
  cartToCheckoutToPaymentMethods,
  cartToCheckoutToShippingAddress,
  cartToCheckoutToShippingAddressToAdd,
  cartToCheckoutToShippingAddressToEdit,
  cartToCheckoutToPaymentMethodsToAdd,
  profile,
  profileToOrders,
  profileToOrdersToOrderDetails,
  profileToSettings,
  profileToReviews,
  profileToShippingAddress,
  profileToPromoCodes,
  profileToPaymentMethods,
  profileToPaymentMethodsToAdd,
  profileToShippingAddressToAdd,
  profileToShippingAddressToEdit,
}

extension AppRoutesExt on AppRoutes {
  static final Map<AppRoutes, String> _names = <AppRoutes, String>{
    AppRoutes.landingPage: 'landingPage',
    AppRoutes.landingPageToSignUp: 'landingPageToSignUp',
    AppRoutes.landingPageToLogin: 'landingPageToLogin',
    AppRoutes.loginToForgotPassword: 'loginToForgotPassword',
    AppRoutes.home: 'home',
    AppRoutes.homeToShop: 'homeToShop',
    AppRoutes.shop: 'shop',
    AppRoutes.shopToProduct: 'shopToProduct',
    AppRoutes.favorites: 'favorites',
    AppRoutes.cart: 'cart',
    AppRoutes.cartToCheckout: 'cartToCheckout',
    AppRoutes.cartToCheckoutToPaymentMethods: 'cartToCheckoutToPaymentMethods',
    AppRoutes.cartToCheckoutToShippingAddress:
        'cartToCheckoutToShippingAddress',
    AppRoutes.cartToCheckoutToShippingAddressToAdd:
        'cartToCheckoutToShippingAddressToAdd',
    AppRoutes.cartToCheckoutToShippingAddressToEdit:
        'cartToCheckoutToShippingAddressToEdit',
    AppRoutes.cartToCheckoutToPaymentMethodsToAdd:
        'cartToCheckoutToPaymentMethodsToAdd',
    AppRoutes.profile: 'profile',
    AppRoutes.profileToOrders: 'profileToOrders',
    AppRoutes.profileToOrdersToOrderDetails: 'profileToOrdersToOrderDetails',
    AppRoutes.profileToSettings: 'profileToSettings',
    AppRoutes.profileToReviews: 'profileToReviews',
    AppRoutes.profileToShippingAddress: 'profileToShippingAddress',
    AppRoutes.profileToPromoCodes: 'profileToPromoCodes',
    AppRoutes.profileToPaymentMethods: 'profileToPaymentMethods',
    AppRoutes.profileToPaymentMethodsToAdd: 'profileToPaymentMethodsToAdd',
    AppRoutes.profileToShippingAddressToAdd: 'profileToShippingAddressToAdd',
    AppRoutes.profileToShippingAddressToEdit: 'profileToShippingAddressToEdit',
  };

  String get name => _names[this]!;

  static final Map<AppRoutes, String> _paths = <AppRoutes, String>{
    AppRoutes.landingPage: '/',
    AppRoutes.landingPageToSignUp: 'sign-up',
    AppRoutes.landingPageToLogin: 'login',
    AppRoutes.loginToForgotPassword: 'forgot-password',
    AppRoutes.home: '/home',
    AppRoutes.homeToShop: 'shop',
    AppRoutes.shop: '/shop',
    AppRoutes.shopToProduct: ':product',
    AppRoutes.favorites: '/favorites',
    AppRoutes.cart: '/cart',
    AppRoutes.cartToCheckout: 'checkout',
    AppRoutes.cartToCheckoutToPaymentMethods: 'payment-methods',
    AppRoutes.cartToCheckoutToShippingAddress: 'shipping-address',
    AppRoutes.cartToCheckoutToShippingAddressToAdd: 'add',
    AppRoutes.cartToCheckoutToShippingAddressToEdit: ':shippingAddress',
    AppRoutes.cartToCheckoutToPaymentMethodsToAdd: 'add',
    AppRoutes.profile: '/profile',
    AppRoutes.profileToOrders: 'orders',
    AppRoutes.profileToOrdersToOrderDetails: ':orderId',
    AppRoutes.profileToSettings: 'settings',
    AppRoutes.profileToReviews: 'reviews',
    AppRoutes.profileToShippingAddress: 'shipping-address',
    AppRoutes.profileToPromoCodes: 'promo-codes',
    AppRoutes.profileToPaymentMethods: 'payment-methods',
    AppRoutes.profileToPaymentMethodsToAdd: 'add',
    AppRoutes.profileToShippingAddressToAdd: 'add',
    AppRoutes.profileToShippingAddressToEdit: ':shippingAddress',
  };

  String get path => _paths[this]!;

  static final Map<AppRoutes, String> _fullPaths = <AppRoutes, String>{
    AppRoutes.landingPage: '/',
    AppRoutes.landingPageToSignUp: '/sign-up',
    AppRoutes.landingPageToLogin: '/login',
    AppRoutes.loginToForgotPassword: '/forgot-password',
    AppRoutes.home: '/home',
    AppRoutes.homeToShop: '/home/shop',
    AppRoutes.shop: '/shop',
    AppRoutes.shopToProduct: '/shop/:product',
    AppRoutes.favorites: '/favorites',
    AppRoutes.cart: '/cart',
    AppRoutes.cartToCheckout: '/cart/checkout',
    AppRoutes.cartToCheckoutToPaymentMethods: '/cart/checkout/payment-methods',
    AppRoutes.cartToCheckoutToShippingAddress:
        '/cart/checkout/shipping-address',
    AppRoutes.cartToCheckoutToShippingAddressToAdd:
        '/cart/checkout/shipping-address/add',
    AppRoutes.cartToCheckoutToShippingAddressToEdit:
        '/cart/checkout/shipping-address/:shippingAddress',
    AppRoutes.cartToCheckoutToPaymentMethodsToAdd:
        '/cart/checkout/payment-methods/add',
    AppRoutes.profile: '/profile',
    AppRoutes.profileToOrders: '/profile/orders',
    AppRoutes.profileToOrdersToOrderDetails: '/profile/orders/:orderId',
    AppRoutes.profileToSettings: '/profile/settings',
    AppRoutes.profileToReviews: '/profile/reviews',
    AppRoutes.profileToShippingAddress: '/profile/shipping-address',
    AppRoutes.profileToPromoCodes: '/profile/promo-codes',
    AppRoutes.profileToPaymentMethods: '/profile/payment-methods',
    AppRoutes.profileToPaymentMethodsToAdd: '/profile/payment-methods/add',
    AppRoutes.profileToShippingAddressToAdd: '/profile/shipping-address/add',
    AppRoutes.profileToShippingAddressToEdit:
        '/profile/shipping-address/:shippingAddress',
  };

  String get fullPath => _fullPaths[this]!;
}

enum SortBy {
  popular,
  newest,
  customerReview,
  priceLowestToHighest,
  priceHighestToLowest,
}

extension SortByExt on SortBy {
  static final Map<SortBy, String> _texts = <SortBy, String>{
    SortBy.popular: 'Popular',
    SortBy.newest: 'Newest',
    SortBy.customerReview: 'Customer Review',
    SortBy.priceHighestToLowest: 'Price: Highest To Lowest',
    SortBy.priceLowestToHighest: 'Price: Lowest To Highest',
  };

  String get text => _texts[this]!;

  static final Map<String, SortBy> _objects = <String, SortBy>{
    'popular': SortBy.popular,
    'newest': SortBy.newest,
    'customer-review': SortBy.customerReview,
    'price-highest-to-lowest': SortBy.priceHighestToLowest,
    'price-lowest-to-highest': SortBy.priceLowestToHighest,
  };

  static final Map<SortBy, String> _objectNames = <SortBy, String>{
    SortBy.popular: 'popular',
    SortBy.newest: 'newest',
    SortBy.customerReview: 'customer-review',
    SortBy.priceHighestToLowest: 'price-highest-to-lowest',
    SortBy.priceLowestToHighest: 'price-lowest-to-highest',
  };

  String get objectName => _objectNames[this]!;

  static SortBy? getObjFromString(String name) =>
      _objects[name.trim().toLowerCase()];
}

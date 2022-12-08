enum ListType {
  list,
  grid,
}

extension ListTypeExt on ListType {
  static final Map<ListType, String> _texts = <ListType, String>{
    ListType.list: 'list',
    ListType.grid: 'grid',
  };

  String get text => _texts[this]!;

  static final Map<String, ListType> _objs = <String, ListType>{
    'list': ListType.list,
    'grid': ListType.grid,
  };

  static ListType? fromString(String? name) =>
      _objs[name?.trim().toLowerCase()];
}

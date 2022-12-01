enum LocalStoragePath {
  address,
  allowedMedia,
  author,
  book,
  chat,
  courier,
  discount,
  genre,
  media,
  paymentMethod,
  restock,
  role,
  transactionDetail,
  transaction,
  userDiscount,
  user,
}

extension LocalStoragePathExt on LocalStoragePath {
  static const Map<LocalStoragePath, String> texts = <LocalStoragePath, String>{
    LocalStoragePath.address: 'address',
    LocalStoragePath.allowedMedia: 'allowedMedia',
    LocalStoragePath.author: 'author',
    LocalStoragePath.book: 'book',
    LocalStoragePath.chat: 'chat',
    LocalStoragePath.courier: 'courier',
    LocalStoragePath.discount: 'discount',
    LocalStoragePath.genre: 'genre',
    LocalStoragePath.media: 'media',
    LocalStoragePath.paymentMethod: 'paymentMethod',
    LocalStoragePath.restock: 'restock',
    LocalStoragePath.role: 'role',
    LocalStoragePath.transaction: 'transaction',
    LocalStoragePath.transactionDetail: 'transactionDetail',
    LocalStoragePath.userDiscount: 'userDiscount',
    LocalStoragePath.user: 'user',
  };

  String get text => texts[this]!;
}

abstract class LocalStorage {
  Future<Object?> write<T>(LocalStoragePath path, T obj);
  Future<Object?> overwrite<T>(LocalStoragePath path, T obj);

  Future<List<T>> readAll<T>(LocalStoragePath path);

  Future<T?> readAt<T>(LocalStoragePath path, int index);

  Future<bool> containsKey<T>(LocalStoragePath path, dynamic key, T obj);

  Future<bool> isEmpty<T>(LocalStoragePath path);

  Future<void> delete<T>(LocalStoragePath path, dynamic index);
}

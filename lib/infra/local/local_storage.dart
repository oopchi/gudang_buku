enum LocalStoragePath {
  user,
  accessToken,
  refreshToken,
  email,
  password,
  googleToken,
}

extension LocalStoragePathExt on LocalStoragePath {
  static const Map<LocalStoragePath, String> texts = <LocalStoragePath, String>{
    LocalStoragePath.user: 'user',
    LocalStoragePath.accessToken: 'accessToken',
    LocalStoragePath.refreshToken: 'refreshToken',
    LocalStoragePath.email: 'email',
    LocalStoragePath.password: 'password',
    LocalStoragePath.googleToken: 'googleToken',
  };

  String get text => texts[this]!;
}

abstract class LocalStorage {
  Future<Object?> write<T>(LocalStoragePath path, T obj);
  Future<Object?> overwrite<T>(LocalStoragePath path, T obj);

  Future<List<T>> readAll<T>(LocalStoragePath path);

  Future<T?> readAt<T>(LocalStoragePath path, int index);

  Future<bool> containsKey<T>(LocalStoragePath path, dynamic key);

  Future<bool> isEmpty<T>(LocalStoragePath path);

  Future<void> delete<T>(LocalStoragePath path, dynamic index);
}

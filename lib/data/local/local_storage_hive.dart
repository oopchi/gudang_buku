import 'package:bookstore/domain/local/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHive implements LocalStorage {
  LocalStorageHive._();

  factory LocalStorageHive() => _instance;

  static final LocalStorageHive _instance = LocalStorageHive._();

  Future<void> init() async {
    await Hive.initFlutter();

    // Hive.registerAdapter(AddressResponseAdapter());
    // Hive.registerAdapter(AllowedMediaResponseAdapter());
    // Hive.registerAdapter(AuthorResponseAdapter());
    // Hive.registerAdapter(BookResponseAdapter());
    // Hive.registerAdapter(ChatResponseAdapter());
    // Hive.registerAdapter(CourierResponseAdapter());
    // Hive.registerAdapter(DiscountResponseAdapter());
    // Hive.registerAdapter(GenreResponseAdapter());
    // Hive.registerAdapter(MediaResponseAdapter());
    // Hive.registerAdapter(PaymentMethodResponseAdapter());
    // Hive.registerAdapter(RestockResponseAdapter());
    // Hive.registerAdapter(RoleResponseAdapter());
    // Hive.registerAdapter(TransactionDetailResponseAdapter());
    // Hive.registerAdapter(TransactionResponseAdapter());
    // Hive.registerAdapter(UserDiscountResponseAdapter());
    // Hive.registerAdapter(UserResponseAdapter());
  }

  @override
  Future<Object?> write<T>(LocalStoragePath path, T obj) async {
    final Box<T> box = await Hive.openBox<T>(path.text);
    final int key = await box.add(obj);

    await box.close();

    return key;
  }

  @override
  Future<List<T>> readAll<T>(LocalStoragePath path) async {
    final Box<T> box = await Hive.openBox<T>(path.text);
    final List<T> results = box.values.toList();

    await box.close();

    return results;
  }

  @override
  Future<T?> readAt<T>(LocalStoragePath path, int index) async {
    if (!await containsKey(path, index)) return null;

    try {
      final Box<T> box = await Hive.openBox<T>(path.text);

      final T? result = box.getAt(index);

      await box.close();

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> containsKey<T>(LocalStoragePath path, dynamic key) async {
    final Box<T> box = await Hive.openBox<T>(path.text);

    final bool containsKey = box.containsKey(key);

    await box.close();

    return containsKey;
  }

  @override
  Future<bool> isEmpty<T>(LocalStoragePath path) async {
    final Box<T> box = await Hive.openBox<T>(path.text);

    final bool isEmpty = box.isEmpty;

    await box.close();

    return isEmpty;
  }

  @override
  Future<Object?> overwrite<T>(LocalStoragePath path, T obj) async {
    final Box<T> box = await Hive.openBox<T>(path.text);
    if (box.isEmpty) {
      await box.add(obj);
    } else {
      await box.putAt(0, obj);
    }

    await box.close();

    return 0;
  }

  @override
  Future<void> delete<T>(LocalStoragePath path, dynamic index) async {
    final Box<T> box = await Hive.openBox<T>(path.text);

    await box.deleteAt(0);

    await box.close();
  }
}

import 'package:gudang_buku/domain/local/local_storage.dart';
import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHive implements LocalStorage {
  LocalStorageHive._();

  factory LocalStorageHive() => _instance;

  static final LocalStorageHive _instance = LocalStorageHive._();

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());

    if (!Hive.isBoxOpen(LocalStoragePath.user.name)) {
      await Hive.openBox(LocalStoragePath.user.name);
    }
  }

  @override
  Future<Object?> write<T>(LocalStoragePath path, T obj) async {
    final Box<T> box = Hive.box<T>(path.text);
    final int key = await box.add(obj);

    return key;
  }

  @override
  Future<List<T>> readAll<T>(LocalStoragePath path) async {
    final Box<T> box = Hive.box<T>(path.text);
    final List<T> results = box.values.toList();

    return results;
  }

  @override
  Future<T?> readAt<T>(LocalStoragePath path, int index) async {
    if (!await containsKey(path, index)) return null;

    try {
      final Box<T> box = Hive.box<T>(path.text);

      final T? result = box.getAt(index);

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> containsKey<T>(LocalStoragePath path, dynamic key) async {
    final Box<T> box = Hive.box<T>(path.text);

    final bool containsKey = box.containsKey(key);

    return containsKey;
  }

  @override
  Future<bool> isEmpty<T>(LocalStoragePath path) async {
    final Box<T> box = Hive.box<T>(path.text);

    final bool isEmpty = box.isEmpty;

    return isEmpty;
  }

  @override
  Future<Object?> overwrite<T>(LocalStoragePath path, T obj) async {
    final Box<T> box = Hive.box<T>(path.text);
    if (box.isEmpty) {
      await box.add(obj);
    } else {
      await box.putAt(0, obj);
    }

    return 0;
  }

  @override
  Future<void> delete<T>(LocalStoragePath path, dynamic index) async {
    final Box<T> box = Hive.box<T>(path.text);

    if (box.isNotEmpty) {
      await box.deleteAt(0);
    }
  }
}

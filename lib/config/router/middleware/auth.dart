import 'dart:async';

import 'package:gudang_buku/domain/model/user_model.dart';
import 'package:gudang_buku/infra/local/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthMiddleware {
  static Future<bool> isAuthenticated() async {
    final Box<UserModel> userBox =
        await Hive.openBox<UserModel>(LocalStoragePath.user.text);

    if (userBox.isEmpty) {
      return false;
    }

    return true;
  }
}

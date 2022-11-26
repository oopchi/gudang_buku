import 'dart:async';

import 'package:bookstore/data/local/local_storage_hive.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthMiddleware {
  static Future<bool> isAuthenticated() async {
    final Box<UserResponse> userBox =
        await Hive.openBox<UserResponse>(LocalStorageKeys.user.label);

    if (userBox.isEmpty) {
      return false;
    }

    return true;
  }
}

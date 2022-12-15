import 'dart:async';

import 'package:gudangBuku/domain/local/local_storage.dart';
import 'package:gudangBuku/domain/dto/user_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthMiddleware {
  static Future<bool> isAuthenticated() async {
    final Box<UserResponse> userBox =
        await Hive.openBox<UserResponse>(LocalStoragePath.user.text);

    if (userBox.isEmpty) {
      return false;
    }

    return true;
  }
}

import 'dart:io';

import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageServiceFS {
  // Return full path of the file on firebase not the url
  static Future<Either<Failure, String>> uploadFileToCloud({
    required File file,
  }) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refDirImages = refRoot.child('medias');

    final String newPath = DateTime.now().millisecondsSinceEpoch.toString();
    Reference refImage = refDirImages.child(newPath);

    try {
      await refImage.putFile(file);
      return Right(refImage.fullPath);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, String>> uploadUInt8ListToCloud({
    required Uint8List file,
  }) async {
    Reference refRoot = FirebaseStorage.instance.ref();
    Reference refDirImages = refRoot.child('medias');

    final String newPath = DateTime.now().millisecondsSinceEpoch.toString();
    Reference refImage = refDirImages.child(newPath);

    try {
      await refImage.putData(file);
      return Right(refImage.fullPath);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  static Future<String> getUrlFromPath(String path) async {
    return FirebaseStorage.instance.ref(path).getDownloadURL();
  }
}

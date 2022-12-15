import 'package:flutter/foundation.dart';

import 'image_picker_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'package:gudangBuku/domain/service/image_picker_not_web.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'image_picker_web.dart';

class ImageAndVideoPicker {
  static Future<List<Uint8List>> getImages() => pickImages();
  static Future<Uint8List?> getVideo() => pickVideo();
}

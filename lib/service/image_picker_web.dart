import 'package:flutter/foundation.dart';
import 'package:image_picker_web/image_picker_web.dart';

Future<List<Uint8List>> pickImages() async {
  return await ImagePickerWeb.getMultiImagesAsBytes() ?? [];
}

Future<Uint8List?> pickVideo() async {
  return await ImagePickerWeb.getVideoAsBytes();
}

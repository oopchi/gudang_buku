import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<List<Uint8List>> pickImages() async {
  final List<Uint8List> pickedImages = [];
  final ImagePicker picker = ImagePicker();

  final List<XFile> pickedImagesXFile = await picker.pickMultiImage();

  for (final img in pickedImagesXFile) {
    pickedImages.add(await img.readAsBytes());
  }

  return pickedImages;
}

Future<Uint8List?> pickVideo() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedVideoXFile = await picker.pickVideo(
    source: ImageSource.gallery,
  );

  return await pickedVideoXFile?.readAsBytes();
}

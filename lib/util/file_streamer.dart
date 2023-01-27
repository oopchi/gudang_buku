import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/util/failure_helper.dart';

extension ImageDataExt on ImageData {
  Either<Failure, void> add(ImageData data) {
    try {
      imageID = data.imageID;
      switch (data.whichData()) {
        case ImageData_Data.chunk:
          final List<int> ch = chunk;
          ch.addAll(data.chunk);
          chunk = ch;
          return const Right(null);
        case ImageData_Data.metaData:
          final ImageMetaData mtdt = metaData;

          mtdt.imageExtension = data.metaData.imageExtension;
          mtdt.mimeType = data.metaData.mimeType;

          metaData = mtdt;
          return const Right(null);
        case ImageData_Data.notSet:
          break;
      }
    } catch (e) {}
    return Left(ServerFailure('hehe'));
  }
}

class FileStreamer {
  FileStreamer({
    this.fileExtension,
    this.mimeType,
    this.fileID = 0,
  });

  final BytesBuilder _bytesBuilder = BytesBuilder();
  String? fileExtension;
  String? mimeType;
  late int fileID;

  Uint8List get bytes => _bytesBuilder.toBytes();

  set bytes(Uint8List data) => _bytesBuilder
    ..clear()
    ..add(data);

  Either<Failure, void> receiveFile({
    required ImageData data,
  }) {
    try {
      fileID = data.imageID.toInt();
      switch (data.whichData()) {
        case ImageData_Data.chunk:
          _bytesBuilder.add(data.chunk);
          return const Right(null);
        case ImageData_Data.metaData:
          fileExtension = data.metaData.imageExtension;
          mimeType = data.metaData.mimeType;
          return const Right(null);
        case ImageData_Data.notSet:
          break;
      }
    } catch (e) {}
    return Left(ServerFailure("hehe"));
  }
}

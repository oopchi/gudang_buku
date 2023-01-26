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
          chunk.addAll(data.chunk);
          return const Right(null);
        case ImageData_Data.metaData:
          metaData.imageExtension = data.metaData.imageExtension;
          metaData.mimeType = data.metaData.mimeType;
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

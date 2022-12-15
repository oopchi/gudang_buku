import 'dart:io';

import 'package:gudangBuku/domain/dto/media_response.dart';
import 'package:gudangBuku/domain/repository/media_repository.dart';
import 'package:gudangBuku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudangBuku/util/failure_helper.dart';

class MediaRepositoryFS implements MediaRepository {
  MediaRepositoryFS._internal();

  factory MediaRepositoryFS() => _instance;

  static final MediaRepositoryFS _instance = MediaRepositoryFS._internal();

  final CollectionReference medias =
      FirebaseFirestore.instance.collection('medias');

  @override
  Future<Either<Failure, List<MediaResponse>>> fetchAllMedias() async {
    try {
      return await medias.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return MediaResponse.fromJson(data);
          }).toList());
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<MediaResponse>>> fetchAllMediasWithBookId({
    required String bookId,
  }) async {
    try {
      return await medias
          .where(
            'bookId',
            isEqualTo: bookId,
          )
          .get()
          .then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return MediaResponse.fromJson(data);
          }).toList());
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> addMedia(
      {required MediaResponse mediaResponse}) async {
    try {
      return await medias.add(mediaResponse.toJson()).then(
        (DocumentReference<Object?> result) {
          return Right(result.id);
        },
        onError: (e) => Left(DatabaseFailure(e.toString())),
      );
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

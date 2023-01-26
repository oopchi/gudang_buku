import 'dart:io';

import 'package:gudang_buku/domain/dto_fs/event_response.dart';
import 'package:gudang_buku/infra/repository/event_repository.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class EventRepositoryFS implements EventRepository {
  EventRepositoryFS._internal();

  factory EventRepositoryFS() => _instance;

  static final EventRepositoryFS _instance = EventRepositoryFS._internal();

  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

  @override
  Future<Either<Failure, List<EventResponse>>> fetchAllEvents() async {
    try {
      return await events.get().then(
        (QuerySnapshot<Object?> result) {
          return Right(result.docs.map((QueryDocumentSnapshot<Object?> e) {
            final Map<String, dynamic> data = e.data() as Map<String, dynamic>;

            data['id'] = e.reference.id;

            return EventResponse.fromJson(data);
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
}

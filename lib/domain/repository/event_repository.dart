import 'package:gudangBuku/domain/dto/event_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class EventRepository {
  Future<Either<Failure, List<EventResponse>>> fetchAllEvents();
}

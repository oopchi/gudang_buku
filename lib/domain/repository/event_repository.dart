import 'package:gudang_buku/domain/dto/event_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class EventRepository {
  Future<Either<Failure, List<EventResponse>>> fetchAllEvents();
}

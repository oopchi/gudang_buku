import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/model/discovery_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class DiscoveryService {
  Future<Either<Failure, List<DiscoveryModel>>> getAllDiscoveries();
}

import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/access_token_request.pb.dart';
import 'package:gudang_buku/domain/model/token_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class SessionService {
  Future<Either<Failure, TokenModel>> renewAccessToken(
      RenewAccessTokenRequest request);
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/access_token_request.pb.dart';
import 'package:gudang_buku/domain/dto/access_token_response.pb.dart';
import 'package:gudang_buku/domain/dto/session_service.pbgrpc.dart';
import 'package:gudang_buku/domain/model/token_model.dart';
import 'package:gudang_buku/service/session_service.dart';
import 'package:gudang_buku/util/exception_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';

class SessionServiceImpl implements SessionService {
  const SessionServiceImpl({
    required SessionServiceClient service,
  }) : _service = service;

  final SessionServiceClient _service;

  @override
  Future<Either<Failure, TokenModel>> renewAccessToken(
      RenewAccessTokenRequest request) async {
    try {
      final RenewAccessTokenResponse response =
          await _service.renewAccessToken(request);

      final TokenModel tokenModel = TokenModel(
        token: response.accessToken,
        expiresAt: response.accessTokenExpiresAt.toDateTime(),
      );

      return Right(tokenModel);
    } on GrpcError catch (e) {
      return Left(ServerFailure('error code ${e.code}'));
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

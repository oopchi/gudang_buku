///
//  Generated code. Do not modify.
//  source: session_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'access_token_request.pb.dart' as $4;
import 'access_token_response.pb.dart' as $5;
export 'session_service.pb.dart';

class SessionServiceClient extends $grpc.Client {
  static final _$renewAccessToken = $grpc.ClientMethod<
          $4.RenewAccessTokenRequest, $5.RenewAccessTokenResponse>(
      '/pb.SessionService/RenewAccessToken',
      ($4.RenewAccessTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $5.RenewAccessTokenResponse.fromBuffer(value));

  SessionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.RenewAccessTokenResponse> renewAccessToken(
      $4.RenewAccessTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renewAccessToken, request, options: options);
  }
}

abstract class SessionServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.SessionService';

  SessionServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.RenewAccessTokenRequest,
            $5.RenewAccessTokenResponse>(
        'RenewAccessToken',
        renewAccessToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.RenewAccessTokenRequest.fromBuffer(value),
        ($5.RenewAccessTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.RenewAccessTokenResponse> renewAccessToken_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.RenewAccessTokenRequest> request) async {
    return renewAccessToken(call, await request);
  }

  $async.Future<$5.RenewAccessTokenResponse> renewAccessToken(
      $grpc.ServiceCall call, $4.RenewAccessTokenRequest request);
}
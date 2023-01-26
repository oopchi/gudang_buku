///
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_request.pb.dart' as $10;
import 'user_response.pb.dart' as $11;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$10.CreateUserRequest, $11.UserResponse>(
          '/pb.UserService/CreateUser',
          ($10.CreateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $11.UserResponse.fromBuffer(value));
  static final _$loginUser =
      $grpc.ClientMethod<$10.LoginUserRequest, $11.LoginUserResponse>(
          '/pb.UserService/LoginUser',
          ($10.LoginUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $11.LoginUserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$11.UserResponse> createUser(
      $async.Stream<$10.CreateUserRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createUser, request, options: options);
  }

  $grpc.ResponseStream<$11.LoginUserResponse> loginUser(
      $10.LoginUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$loginUser, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$10.CreateUserRequest, $11.UserResponse>(
        'CreateUser',
        createUser,
        true,
        true,
        ($core.List<$core.int> value) =>
            $10.CreateUserRequest.fromBuffer(value),
        ($11.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.LoginUserRequest, $11.LoginUserResponse>(
        'LoginUser',
        loginUser_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $10.LoginUserRequest.fromBuffer(value),
        ($11.LoginUserResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$11.LoginUserResponse> loginUser_Pre($grpc.ServiceCall call,
      $async.Future<$10.LoginUserRequest> request) async* {
    yield* loginUser(call, await request);
  }

  $async.Stream<$11.UserResponse> createUser(
      $grpc.ServiceCall call, $async.Stream<$10.CreateUserRequest> request);
  $async.Stream<$11.LoginUserResponse> loginUser(
      $grpc.ServiceCall call, $10.LoginUserRequest request);
}

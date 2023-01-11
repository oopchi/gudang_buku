///
//  Generated code. Do not modify.
//  source: user_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_request.pb.dart' as $6;
import 'user_response.pb.dart' as $7;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$6.CreateUserRequest, $7.UserResponse>(
          '/pb.UserService/CreateUser',
          ($6.CreateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.UserResponse.fromBuffer(value));
  static final _$loginUser =
      $grpc.ClientMethod<$6.LoginUserRequest, $7.LoginUserResponse>(
          '/pb.UserService/LoginUser',
          ($6.LoginUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.LoginUserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$7.UserResponse> createUser($6.CreateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$7.LoginUserResponse> loginUser(
      $6.LoginUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginUser, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.CreateUserRequest, $7.UserResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateUserRequest.fromBuffer(value),
        ($7.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.LoginUserRequest, $7.LoginUserResponse>(
        'LoginUser',
        loginUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.LoginUserRequest.fromBuffer(value),
        ($7.LoginUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.UserResponse> createUser_Pre($grpc.ServiceCall call,
      $async.Future<$6.CreateUserRequest> request) async {
    return createUser(call, await request);
  }

  $async.Future<$7.LoginUserResponse> loginUser_Pre($grpc.ServiceCall call,
      $async.Future<$6.LoginUserRequest> request) async {
    return loginUser(call, await request);
  }

  $async.Future<$7.UserResponse> createUser(
      $grpc.ServiceCall call, $6.CreateUserRequest request);
  $async.Future<$7.LoginUserResponse> loginUser(
      $grpc.ServiceCall call, $6.LoginUserRequest request);
}

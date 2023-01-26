///
//  Generated code. Do not modify.
//  source: discount_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'discount_request.pb.dart' as $2;
import 'discount_response.pb.dart' as $3;
export 'discount_service.pb.dart';

class DiscountServiceClient extends $grpc.Client {
  static final _$createDiscount =
      $grpc.ClientMethod<$2.CreateDiscountRequest, $3.DiscountResponse>(
          '/pb.DiscountService/CreateDiscount',
          ($2.CreateDiscountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.DiscountResponse.fromBuffer(value));
  static final _$listDiscounts =
      $grpc.ClientMethod<$2.ListDiscountRequest, $3.DiscountResponse>(
          '/pb.DiscountService/ListDiscounts',
          ($2.ListDiscountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.DiscountResponse.fromBuffer(value));

  DiscountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$3.DiscountResponse> createDiscount(
      $2.CreateDiscountRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$createDiscount, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.DiscountResponse> listDiscounts(
      $2.ListDiscountRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listDiscounts, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class DiscountServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.DiscountService';

  DiscountServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$2.CreateDiscountRequest, $3.DiscountResponse>(
            'CreateDiscount',
            createDiscount_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $2.CreateDiscountRequest.fromBuffer(value),
            ($3.DiscountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListDiscountRequest, $3.DiscountResponse>(
        'ListDiscounts',
        listDiscounts_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $2.ListDiscountRequest.fromBuffer(value),
        ($3.DiscountResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$3.DiscountResponse> createDiscount_Pre($grpc.ServiceCall call,
      $async.Future<$2.CreateDiscountRequest> request) async* {
    yield* createDiscount(call, await request);
  }

  $async.Stream<$3.DiscountResponse> listDiscounts_Pre($grpc.ServiceCall call,
      $async.Future<$2.ListDiscountRequest> request) async* {
    yield* listDiscounts(call, await request);
  }

  $async.Stream<$3.DiscountResponse> createDiscount(
      $grpc.ServiceCall call, $2.CreateDiscountRequest request);
  $async.Stream<$3.DiscountResponse> listDiscounts(
      $grpc.ServiceCall call, $2.ListDiscountRequest request);
}

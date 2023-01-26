///
//  Generated code. Do not modify.
//  source: discovery_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'discovery_request.pb.dart' as $4;
import 'discovery_response.pb.dart' as $5;
export 'discovery_service.pb.dart';

class DiscoveryServiceClient extends $grpc.Client {
  static final _$createDiscovery =
      $grpc.ClientMethod<$4.CreateDiscoveryRequest, $5.DiscoveryResponse>(
          '/pb.DiscoveryService/CreateDiscovery',
          ($4.CreateDiscoveryRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.DiscoveryResponse.fromBuffer(value));
  static final _$listDiscoveries =
      $grpc.ClientMethod<$4.ListDiscoveryRequest, $5.DiscoveryResponse>(
          '/pb.DiscoveryService/ListDiscoveries',
          ($4.ListDiscoveryRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.DiscoveryResponse.fromBuffer(value));

  DiscoveryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$5.DiscoveryResponse> createDiscovery(
      $async.Stream<$4.CreateDiscoveryRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createDiscovery, request, options: options);
  }

  $grpc.ResponseStream<$5.DiscoveryResponse> listDiscoveries(
      $4.ListDiscoveryRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listDiscoveries, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class DiscoveryServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.DiscoveryService';

  DiscoveryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$4.CreateDiscoveryRequest, $5.DiscoveryResponse>(
            'CreateDiscovery',
            createDiscovery,
            true,
            true,
            ($core.List<$core.int> value) =>
                $4.CreateDiscoveryRequest.fromBuffer(value),
            ($5.DiscoveryResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.ListDiscoveryRequest, $5.DiscoveryResponse>(
            'ListDiscoveries',
            listDiscoveries_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $4.ListDiscoveryRequest.fromBuffer(value),
            ($5.DiscoveryResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$5.DiscoveryResponse> listDiscoveries_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.ListDiscoveryRequest> request) async* {
    yield* listDiscoveries(call, await request);
  }

  $async.Stream<$5.DiscoveryResponse> createDiscovery(
      $grpc.ServiceCall call, $async.Stream<$4.CreateDiscoveryRequest> request);
  $async.Stream<$5.DiscoveryResponse> listDiscoveries(
      $grpc.ServiceCall call, $4.ListDiscoveryRequest request);
}

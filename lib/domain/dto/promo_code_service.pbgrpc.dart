///
//  Generated code. Do not modify.
//  source: promo_code_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'promo_code_request.pb.dart' as $2;
import 'promo_code_response.pb.dart' as $3;
export 'promo_code_service.pb.dart';

class PromoCodeServiceClient extends $grpc.Client {
  static final _$createPromoCode =
      $grpc.ClientMethod<$2.CreatePromoCodeRequest, $3.PromoCodeResponse>(
          '/pb.PromoCodeService/CreatePromoCode',
          ($2.CreatePromoCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.PromoCodeResponse.fromBuffer(value));
  static final _$softDeletePromoCode =
      $grpc.ClientMethod<$2.DeletePromoCodeRequest, $3.ListPromoCodeResponse>(
          '/pb.PromoCodeService/SoftDeletePromoCode',
          ($2.DeletePromoCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListPromoCodeResponse.fromBuffer(value));
  static final _$forceDeletePromoCode =
      $grpc.ClientMethod<$2.DeletePromoCodeRequest, $3.ListPromoCodeResponse>(
          '/pb.PromoCodeService/ForceDeletePromoCode',
          ($2.DeletePromoCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ListPromoCodeResponse.fromBuffer(value));
  static final _$listOngoingPromoCodes =
      $grpc.ClientMethod<$2.ListOngoingPromoCodesRequest, $3.PromoCodeResponse>(
          '/pb.PromoCodeService/ListOngoingPromoCodes',
          ($2.ListOngoingPromoCodesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.PromoCodeResponse.fromBuffer(value));

  PromoCodeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.PromoCodeResponse> createPromoCode(
      $async.Stream<$2.CreatePromoCodeRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createPromoCode, request, options: options)
        .single;
  }

  $grpc.ResponseFuture<$3.ListPromoCodeResponse> softDeletePromoCode(
      $2.DeletePromoCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$softDeletePromoCode, request, options: options);
  }

  $grpc.ResponseFuture<$3.ListPromoCodeResponse> forceDeletePromoCode(
      $2.DeletePromoCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forceDeletePromoCode, request, options: options);
  }

  $grpc.ResponseStream<$3.PromoCodeResponse> listOngoingPromoCodes(
      $2.ListOngoingPromoCodesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listOngoingPromoCodes, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class PromoCodeServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.PromoCodeService';

  PromoCodeServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$2.CreatePromoCodeRequest, $3.PromoCodeResponse>(
            'CreatePromoCode',
            createPromoCode,
            true,
            false,
            ($core.List<$core.int> value) =>
                $2.CreatePromoCodeRequest.fromBuffer(value),
            ($3.PromoCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeletePromoCodeRequest,
            $3.ListPromoCodeResponse>(
        'SoftDeletePromoCode',
        softDeletePromoCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DeletePromoCodeRequest.fromBuffer(value),
        ($3.ListPromoCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeletePromoCodeRequest,
            $3.ListPromoCodeResponse>(
        'ForceDeletePromoCode',
        forceDeletePromoCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DeletePromoCodeRequest.fromBuffer(value),
        ($3.ListPromoCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListOngoingPromoCodesRequest,
            $3.PromoCodeResponse>(
        'ListOngoingPromoCodes',
        listOngoingPromoCodes_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $2.ListOngoingPromoCodesRequest.fromBuffer(value),
        ($3.PromoCodeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.ListPromoCodeResponse> softDeletePromoCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.DeletePromoCodeRequest> request) async {
    return softDeletePromoCode(call, await request);
  }

  $async.Future<$3.ListPromoCodeResponse> forceDeletePromoCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.DeletePromoCodeRequest> request) async {
    return forceDeletePromoCode(call, await request);
  }

  $async.Stream<$3.PromoCodeResponse> listOngoingPromoCodes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.ListOngoingPromoCodesRequest> request) async* {
    yield* listOngoingPromoCodes(call, await request);
  }

  $async.Future<$3.PromoCodeResponse> createPromoCode(
      $grpc.ServiceCall call, $async.Stream<$2.CreatePromoCodeRequest> request);
  $async.Future<$3.ListPromoCodeResponse> softDeletePromoCode(
      $grpc.ServiceCall call, $2.DeletePromoCodeRequest request);
  $async.Future<$3.ListPromoCodeResponse> forceDeletePromoCode(
      $grpc.ServiceCall call, $2.DeletePromoCodeRequest request);
  $async.Stream<$3.PromoCodeResponse> listOngoingPromoCodes(
      $grpc.ServiceCall call, $2.ListOngoingPromoCodesRequest request);
}

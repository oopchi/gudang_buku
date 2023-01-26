///
//  Generated code. Do not modify.
//  source: promo_code_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'promo_code_request.pb.dart' as $6;
import 'promo_code_response.pb.dart' as $7;
export 'promo_code_service.pb.dart';

class PromoCodeServiceClient extends $grpc.Client {
  static final _$createPromoCode =
      $grpc.ClientMethod<$6.CreatePromoCodeRequest, $7.PromoCodeResponse>(
          '/pb.PromoCodeService/CreatePromoCode',
          ($6.CreatePromoCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.PromoCodeResponse.fromBuffer(value));
  static final _$softDeletePromoCodes =
      $grpc.ClientMethod<$6.DeletePromoCodesRequest, $7.PromoCodeResponse>(
          '/pb.PromoCodeService/SoftDeletePromoCodes',
          ($6.DeletePromoCodesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.PromoCodeResponse.fromBuffer(value));
  static final _$forceDeletePromoCodes =
      $grpc.ClientMethod<$6.DeletePromoCodesRequest, $7.PromoCodeResponse>(
          '/pb.PromoCodeService/ForceDeletePromoCodes',
          ($6.DeletePromoCodesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.PromoCodeResponse.fromBuffer(value));
  static final _$listOngoingPromoCodes =
      $grpc.ClientMethod<$6.ListOngoingPromoCodesRequest, $7.PromoCodeResponse>(
          '/pb.PromoCodeService/ListOngoingPromoCodes',
          ($6.ListOngoingPromoCodesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $7.PromoCodeResponse.fromBuffer(value));

  PromoCodeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$7.PromoCodeResponse> createPromoCode(
      $async.Stream<$6.CreatePromoCodeRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createPromoCode, request, options: options);
  }

  $grpc.ResponseStream<$7.PromoCodeResponse> softDeletePromoCodes(
      $6.DeletePromoCodesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$softDeletePromoCodes, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$7.PromoCodeResponse> forceDeletePromoCodes(
      $6.DeletePromoCodesRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$forceDeletePromoCodes, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$7.PromoCodeResponse> listOngoingPromoCodes(
      $6.ListOngoingPromoCodesRequest request,
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
        $grpc.ServiceMethod<$6.CreatePromoCodeRequest, $7.PromoCodeResponse>(
            'CreatePromoCode',
            createPromoCode,
            true,
            true,
            ($core.List<$core.int> value) =>
                $6.CreatePromoCodeRequest.fromBuffer(value),
            ($7.PromoCodeResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$6.DeletePromoCodesRequest, $7.PromoCodeResponse>(
            'SoftDeletePromoCodes',
            softDeletePromoCodes_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $6.DeletePromoCodesRequest.fromBuffer(value),
            ($7.PromoCodeResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$6.DeletePromoCodesRequest, $7.PromoCodeResponse>(
            'ForceDeletePromoCodes',
            forceDeletePromoCodes_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $6.DeletePromoCodesRequest.fromBuffer(value),
            ($7.PromoCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ListOngoingPromoCodesRequest,
            $7.PromoCodeResponse>(
        'ListOngoingPromoCodes',
        listOngoingPromoCodes_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $6.ListOngoingPromoCodesRequest.fromBuffer(value),
        ($7.PromoCodeResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$7.PromoCodeResponse> softDeletePromoCodes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$6.DeletePromoCodesRequest> request) async* {
    yield* softDeletePromoCodes(call, await request);
  }

  $async.Stream<$7.PromoCodeResponse> forceDeletePromoCodes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$6.DeletePromoCodesRequest> request) async* {
    yield* forceDeletePromoCodes(call, await request);
  }

  $async.Stream<$7.PromoCodeResponse> listOngoingPromoCodes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$6.ListOngoingPromoCodesRequest> request) async* {
    yield* listOngoingPromoCodes(call, await request);
  }

  $async.Stream<$7.PromoCodeResponse> createPromoCode(
      $grpc.ServiceCall call, $async.Stream<$6.CreatePromoCodeRequest> request);
  $async.Stream<$7.PromoCodeResponse> softDeletePromoCodes(
      $grpc.ServiceCall call, $6.DeletePromoCodesRequest request);
  $async.Stream<$7.PromoCodeResponse> forceDeletePromoCodes(
      $grpc.ServiceCall call, $6.DeletePromoCodesRequest request);
  $async.Stream<$7.PromoCodeResponse> listOngoingPromoCodes(
      $grpc.ServiceCall call, $6.ListOngoingPromoCodesRequest request);
}

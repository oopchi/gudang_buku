///
//  Generated code. Do not modify.
//  source: book_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'book_request.pb.dart' as $0;
import 'book_response.pb.dart' as $1;
export 'book_service.pb.dart';

class BookServiceClient extends $grpc.Client {
  static final _$createBook =
      $grpc.ClientMethod<$0.CreateBookRequest, $1.BookResponse>(
          '/pb.BookService/CreateBook',
          ($0.CreateBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$getBook =
      $grpc.ClientMethod<$0.GetBookRequest, $1.BookResponse>(
          '/pb.BookService/GetBook',
          ($0.GetBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$listBook =
      $grpc.ClientMethod<$0.ListBookRequest, $1.ListBookResponse>(
          '/pb.BookService/ListBook',
          ($0.ListBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ListBookResponse.fromBuffer(value));
  static final _$softDeleteBook =
      $grpc.ClientMethod<$0.DeleteBookRequest, $1.ListBookResponse>(
          '/pb.BookService/SoftDeleteBook',
          ($0.DeleteBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ListBookResponse.fromBuffer(value));
  static final _$forceDeleteBook =
      $grpc.ClientMethod<$0.DeleteBookRequest, $1.ListBookResponse>(
          '/pb.BookService/ForceDeleteBook',
          ($0.DeleteBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ListBookResponse.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.BookResponse> createBook($0.CreateBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBook, request, options: options);
  }

  $grpc.ResponseFuture<$1.BookResponse> getBook($0.GetBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBook, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBookResponse> listBook($0.ListBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBook, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBookResponse> softDeleteBook(
      $0.DeleteBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$softDeleteBook, request, options: options);
  }

  $grpc.ResponseFuture<$1.ListBookResponse> forceDeleteBook(
      $0.DeleteBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forceDeleteBook, request, options: options);
  }
}

abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateBookRequest, $1.BookResponse>(
        'CreateBook',
        createBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateBookRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBookRequest, $1.BookResponse>(
        'GetBook',
        getBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBookRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBookRequest, $1.ListBookResponse>(
        'ListBook',
        listBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListBookRequest.fromBuffer(value),
        ($1.ListBookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBookRequest, $1.ListBookResponse>(
        'SoftDeleteBook',
        softDeleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteBookRequest.fromBuffer(value),
        ($1.ListBookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBookRequest, $1.ListBookResponse>(
        'ForceDeleteBook',
        forceDeleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteBookRequest.fromBuffer(value),
        ($1.ListBookResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.BookResponse> createBook_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateBookRequest> request) async {
    return createBook(call, await request);
  }

  $async.Future<$1.BookResponse> getBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBookRequest> request) async {
    return getBook(call, await request);
  }

  $async.Future<$1.ListBookResponse> listBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ListBookRequest> request) async {
    return listBook(call, await request);
  }

  $async.Future<$1.ListBookResponse> softDeleteBook_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteBookRequest> request) async {
    return softDeleteBook(call, await request);
  }

  $async.Future<$1.ListBookResponse> forceDeleteBook_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteBookRequest> request) async {
    return forceDeleteBook(call, await request);
  }

  $async.Future<$1.BookResponse> createBook(
      $grpc.ServiceCall call, $0.CreateBookRequest request);
  $async.Future<$1.BookResponse> getBook(
      $grpc.ServiceCall call, $0.GetBookRequest request);
  $async.Future<$1.ListBookResponse> listBook(
      $grpc.ServiceCall call, $0.ListBookRequest request);
  $async.Future<$1.ListBookResponse> softDeleteBook(
      $grpc.ServiceCall call, $0.DeleteBookRequest request);
  $async.Future<$1.ListBookResponse> forceDeleteBook(
      $grpc.ServiceCall call, $0.DeleteBookRequest request);
}

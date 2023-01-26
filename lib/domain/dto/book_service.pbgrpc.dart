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
  static final _$listBooks =
      $grpc.ClientMethod<$0.ListBooksRequest, $1.BookResponse>(
          '/pb.BookService/ListBooks',
          ($0.ListBooksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$softDeleteBooks =
      $grpc.ClientMethod<$0.DeleteBooksRequest, $1.BookResponse>(
          '/pb.BookService/SoftDeleteBooks',
          ($0.DeleteBooksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$forceDeleteBooks =
      $grpc.ClientMethod<$0.DeleteBooksRequest, $1.BookResponse>(
          '/pb.BookService/ForceDeleteBooks',
          ($0.DeleteBooksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$addUserFavoriteBook =
      $grpc.ClientMethod<$0.AddUserFavoriteBookRequest, $1.BookResponse>(
          '/pb.BookService/AddUserFavoriteBook',
          ($0.AddUserFavoriteBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$listUserFavoriteBooks =
      $grpc.ClientMethod<$0.ListUserFavoriteBooksRequest, $1.BookResponse>(
          '/pb.BookService/ListUserFavoriteBooks',
          ($0.ListUserFavoriteBooksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));
  static final _$deleteUserFavoriteBook =
      $grpc.ClientMethod<$0.DeleteUserFavoriteBookRequest, $1.BookResponse>(
          '/pb.BookService/DeleteUserFavoriteBook',
          ($0.DeleteUserFavoriteBookRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.BookResponse.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$1.BookResponse> createBook(
      $async.Stream<$0.CreateBookRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createBook, request, options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> getBook($0.GetBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getBook, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> listBooks($0.ListBooksRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listBooks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> softDeleteBooks(
      $0.DeleteBooksRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$softDeleteBooks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> forceDeleteBooks(
      $0.DeleteBooksRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$forceDeleteBooks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> addUserFavoriteBook(
      $0.AddUserFavoriteBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$addUserFavoriteBook, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> listUserFavoriteBooks(
      $0.ListUserFavoriteBooksRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listUserFavoriteBooks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.BookResponse> deleteUserFavoriteBook(
      $0.DeleteUserFavoriteBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$deleteUserFavoriteBook, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateBookRequest, $1.BookResponse>(
        'CreateBook',
        createBook,
        true,
        true,
        ($core.List<$core.int> value) => $0.CreateBookRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBookRequest, $1.BookResponse>(
        'GetBook',
        getBook_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetBookRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBooksRequest, $1.BookResponse>(
        'ListBooks',
        listBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ListBooksRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBooksRequest, $1.BookResponse>(
        'SoftDeleteBooks',
        softDeleteBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.DeleteBooksRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBooksRequest, $1.BookResponse>(
        'ForceDeleteBooks',
        forceDeleteBooks_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.DeleteBooksRequest.fromBuffer(value),
        ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddUserFavoriteBookRequest, $1.BookResponse>(
            'AddUserFavoriteBook',
            addUserFavoriteBook_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.AddUserFavoriteBookRequest.fromBuffer(value),
            ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListUserFavoriteBooksRequest, $1.BookResponse>(
            'ListUserFavoriteBooks',
            listUserFavoriteBooks_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.ListUserFavoriteBooksRequest.fromBuffer(value),
            ($1.BookResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteUserFavoriteBookRequest, $1.BookResponse>(
            'DeleteUserFavoriteBook',
            deleteUserFavoriteBook_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.DeleteUserFavoriteBookRequest.fromBuffer(value),
            ($1.BookResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$1.BookResponse> getBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBookRequest> request) async* {
    yield* getBook(call, await request);
  }

  $async.Stream<$1.BookResponse> listBooks_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListBooksRequest> request) async* {
    yield* listBooks(call, await request);
  }

  $async.Stream<$1.BookResponse> softDeleteBooks_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteBooksRequest> request) async* {
    yield* softDeleteBooks(call, await request);
  }

  $async.Stream<$1.BookResponse> forceDeleteBooks_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteBooksRequest> request) async* {
    yield* forceDeleteBooks(call, await request);
  }

  $async.Stream<$1.BookResponse> addUserFavoriteBook_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddUserFavoriteBookRequest> request) async* {
    yield* addUserFavoriteBook(call, await request);
  }

  $async.Stream<$1.BookResponse> listUserFavoriteBooks_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListUserFavoriteBooksRequest> request) async* {
    yield* listUserFavoriteBooks(call, await request);
  }

  $async.Stream<$1.BookResponse> deleteUserFavoriteBook_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteUserFavoriteBookRequest> request) async* {
    yield* deleteUserFavoriteBook(call, await request);
  }

  $async.Stream<$1.BookResponse> createBook(
      $grpc.ServiceCall call, $async.Stream<$0.CreateBookRequest> request);
  $async.Stream<$1.BookResponse> getBook(
      $grpc.ServiceCall call, $0.GetBookRequest request);
  $async.Stream<$1.BookResponse> listBooks(
      $grpc.ServiceCall call, $0.ListBooksRequest request);
  $async.Stream<$1.BookResponse> softDeleteBooks(
      $grpc.ServiceCall call, $0.DeleteBooksRequest request);
  $async.Stream<$1.BookResponse> forceDeleteBooks(
      $grpc.ServiceCall call, $0.DeleteBooksRequest request);
  $async.Stream<$1.BookResponse> addUserFavoriteBook(
      $grpc.ServiceCall call, $0.AddUserFavoriteBookRequest request);
  $async.Stream<$1.BookResponse> listUserFavoriteBooks(
      $grpc.ServiceCall call, $0.ListUserFavoriteBooksRequest request);
  $async.Stream<$1.BookResponse> deleteUserFavoriteBook(
      $grpc.ServiceCall call, $0.DeleteUserFavoriteBookRequest request);
}

///
//  Generated code. Do not modify.
//  source: book_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $8;
import 'author_response.pb.dart' as $9;
import 'genre_response.pb.dart' as $10;
import 'pagination_response.pb.dart' as $11;

class BookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stock', $pb.PbFieldType.O3)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'weight', $pb.PbFieldType.OD)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productStatus', protoName: 'productStatus')
    ..aOM<$8.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $8.Timestamp.create)
    ..aOM<$8.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $8.Timestamp.create)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageRating', $pb.PbFieldType.OD, protoName: 'averageRating')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfRating', protoName: 'numOfRating')
    ..aInt64(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfBought', protoName: 'numOfBought')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRated', protoName: 'isRated')
    ..pc<$9.AuthorResponse>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors', $pb.PbFieldType.PM, subBuilder: $9.AuthorResponse.create)
    ..pc<$10.GenreResponse>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'genres', $pb.PbFieldType.PM, subBuilder: $10.GenreResponse.create)
    ..hasRequiredFields = false
  ;

  BookResponse._() : super();
  factory BookResponse({
    $fixnum.Int64? id,
    $core.String? title,
    $core.String? description,
    $core.double? price,
    $core.int? stock,
    $core.double? weight,
    $core.String? productStatus,
    $8.Timestamp? createdAt,
    $8.Timestamp? updatedAt,
    $core.double? averageRating,
    $fixnum.Int64? numOfRating,
    $fixnum.Int64? numOfBought,
    $core.bool? isRated,
    $core.Iterable<$9.AuthorResponse>? authors,
    $core.Iterable<$10.GenreResponse>? genres,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (price != null) {
      _result.price = price;
    }
    if (stock != null) {
      _result.stock = stock;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (productStatus != null) {
      _result.productStatus = productStatus;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (averageRating != null) {
      _result.averageRating = averageRating;
    }
    if (numOfRating != null) {
      _result.numOfRating = numOfRating;
    }
    if (numOfBought != null) {
      _result.numOfBought = numOfBought;
    }
    if (isRated != null) {
      _result.isRated = isRated;
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    if (genres != null) {
      _result.genres.addAll(genres);
    }
    return _result;
  }
  factory BookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookResponse clone() => BookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookResponse copyWith(void Function(BookResponse) updates) => super.copyWith((message) => updates(message as BookResponse)) as BookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BookResponse create() => BookResponse._();
  BookResponse createEmptyInstance() => create();
  static $pb.PbList<BookResponse> createRepeated() => $pb.PbList<BookResponse>();
  @$core.pragma('dart2js:noInline')
  static BookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookResponse>(create);
  static BookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get price => $_getN(3);
  @$pb.TagNumber(4)
  set price($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get stock => $_getIZ(4);
  @$pb.TagNumber(5)
  set stock($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStock() => $_has(4);
  @$pb.TagNumber(5)
  void clearStock() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get weight => $_getN(5);
  @$pb.TagNumber(6)
  set weight($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get productStatus => $_getSZ(6);
  @$pb.TagNumber(7)
  set productStatus($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasProductStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearProductStatus() => clearField(7);

  @$pb.TagNumber(8)
  $8.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($8.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $8.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $8.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($8.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $8.Timestamp ensureUpdatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.double get averageRating => $_getN(9);
  @$pb.TagNumber(10)
  set averageRating($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAverageRating() => $_has(9);
  @$pb.TagNumber(10)
  void clearAverageRating() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get numOfRating => $_getI64(10);
  @$pb.TagNumber(11)
  set numOfRating($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNumOfRating() => $_has(10);
  @$pb.TagNumber(11)
  void clearNumOfRating() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get numOfBought => $_getI64(11);
  @$pb.TagNumber(12)
  set numOfBought($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNumOfBought() => $_has(11);
  @$pb.TagNumber(12)
  void clearNumOfBought() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isRated => $_getBF(12);
  @$pb.TagNumber(13)
  set isRated($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsRated() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsRated() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$9.AuthorResponse> get authors => $_getList(13);

  @$pb.TagNumber(15)
  $core.List<$10.GenreResponse> get genres => $_getList(14);
}

class ListBookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<BookResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'books', $pb.PbFieldType.PM, subBuilder: BookResponse.create)
    ..aOM<$11.PaginationResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $11.PaginationResponse.create)
    ..hasRequiredFields = false
  ;

  ListBookResponse._() : super();
  factory ListBookResponse({
    $core.Iterable<BookResponse>? books,
    $11.PaginationResponse? pagination,
  }) {
    final _result = create();
    if (books != null) {
      _result.books.addAll(books);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory ListBookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBookResponse clone() => ListBookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBookResponse copyWith(void Function(ListBookResponse) updates) => super.copyWith((message) => updates(message as ListBookResponse)) as ListBookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBookResponse create() => ListBookResponse._();
  ListBookResponse createEmptyInstance() => create();
  static $pb.PbList<ListBookResponse> createRepeated() => $pb.PbList<ListBookResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBookResponse>(create);
  static ListBookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BookResponse> get books => $_getList(0);

  @$pb.TagNumber(2)
  $11.PaginationResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($11.PaginationResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $11.PaginationResponse ensurePagination() => $_ensure(1);
}


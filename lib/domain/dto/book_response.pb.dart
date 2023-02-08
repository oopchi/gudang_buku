///
//  Generated code. Do not modify.
//  source: book_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;
import 'pagination_response.pb.dart' as $14;
import 'genre_response.pb.dart' as $15;
import 'google/protobuf/timestamp.pb.dart' as $12;
import 'author_response.pb.dart' as $16;

enum BookResponse_Data {
  content, 
  imageData, 
  pagination, 
  notSet
}

class BookResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, BookResponse_Data> _BookResponse_DataByTag = {
    1 : BookResponse_Data.content,
    2 : BookResponse_Data.imageData,
    3 : BookResponse_Data.pagination,
    0 : BookResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<BookContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: BookContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..aOM<$14.PaginationResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $14.PaginationResponse.create)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  BookResponse._() : super();
  factory BookResponse({
    BookContent? content,
    $13.ImageData? imageData,
    $14.PaginationResponse? pagination,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    if (id != null) {
      _result.id = id;
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

  BookResponse_Data whichData() => _BookResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BookContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(BookContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  BookContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  $13.ImageData get imageData => $_getN(1);
  @$pb.TagNumber(2)
  set imageData($13.ImageData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageData() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageData() => clearField(2);
  @$pb.TagNumber(2)
  $13.ImageData ensureImageData() => $_ensure(1);

  @$pb.TagNumber(3)
  $14.PaginationResponse get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($14.PaginationResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $14.PaginationResponse ensurePagination() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get id => $_getI64(3);
  @$pb.TagNumber(4)
  set id($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);
}

class BookContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BookContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$15.GenreResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'genres', $pb.PbFieldType.PM, subBuilder: $15.GenreResponse.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stock', $pb.PbFieldType.O3)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'weight', $pb.PbFieldType.OD)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productStatus', protoName: 'productStatus')
    ..aOM<$12.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..aOM<$12.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'averageRating', $pb.PbFieldType.OD, protoName: 'averageRating')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfRating', protoName: 'numOfRating')
    ..aInt64(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfBought', protoName: 'numOfBought')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRated', protoName: 'isRated')
    ..pc<$16.AuthorResponse>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors', $pb.PbFieldType.PM, subBuilder: $16.AuthorResponse.create)
    ..aOB(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFavorite', protoName: 'isFavorite')
    ..hasRequiredFields = false
  ;

  BookContent._() : super();
  factory BookContent({
    $core.Iterable<$15.GenreResponse>? genres,
    $core.String? title,
    $core.String? description,
    $core.double? price,
    $core.int? stock,
    $core.double? weight,
    $core.String? productStatus,
    $12.Timestamp? createdAt,
    $12.Timestamp? updatedAt,
    $core.double? averageRating,
    $fixnum.Int64? numOfRating,
    $fixnum.Int64? numOfBought,
    $core.bool? isRated,
    $core.Iterable<$16.AuthorResponse>? authors,
    $core.bool? isFavorite,
  }) {
    final _result = create();
    if (genres != null) {
      _result.genres.addAll(genres);
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
    if (isFavorite != null) {
      _result.isFavorite = isFavorite;
    }
    return _result;
  }
  factory BookContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookContent clone() => BookContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookContent copyWith(void Function(BookContent) updates) => super.copyWith((message) => updates(message as BookContent)) as BookContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BookContent create() => BookContent._();
  BookContent createEmptyInstance() => create();
  static $pb.PbList<BookContent> createRepeated() => $pb.PbList<BookContent>();
  @$core.pragma('dart2js:noInline')
  static BookContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookContent>(create);
  static BookContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$15.GenreResponse> get genres => $_getList(0);

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
  $12.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($12.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $12.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $12.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($12.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $12.Timestamp ensureUpdatedAt() => $_ensure(8);

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
  $core.List<$16.AuthorResponse> get authors => $_getList(13);

  @$pb.TagNumber(15)
  $core.bool get isFavorite => $_getBF(14);
  @$pb.TagNumber(15)
  set isFavorite($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsFavorite() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsFavorite() => clearField(15);
}


///
//  Generated code. Do not modify.
//  source: book_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;

enum CreateBookRequest_Data {
  content, 
  imageData, 
  notSet
}

class CreateBookRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateBookRequest_Data> _CreateBookRequest_DataByTag = {
    1 : CreateBookRequest_Data.content,
    2 : CreateBookRequest_Data.imageData,
    0 : CreateBookRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateBookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<CreateBookContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: CreateBookContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..hasRequiredFields = false
  ;

  CreateBookRequest._() : super();
  factory CreateBookRequest({
    CreateBookContent? content,
    $13.ImageData? imageData,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    return _result;
  }
  factory CreateBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBookRequest clone() => CreateBookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBookRequest copyWith(void Function(CreateBookRequest) updates) => super.copyWith((message) => updates(message as CreateBookRequest)) as CreateBookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateBookRequest create() => CreateBookRequest._();
  CreateBookRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBookRequest> createRepeated() => $pb.PbList<CreateBookRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBookRequest>(create);
  static CreateBookRequest? _defaultInstance;

  CreateBookRequest_Data whichData() => _CreateBookRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CreateBookContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(CreateBookContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  CreateBookContent ensureContent() => $_ensure(0);

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
}

class CreateBookContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateBookContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stock', $pb.PbFieldType.O3)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'weight', $pb.PbFieldType.OD)
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'genres')
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..hasRequiredFields = false
  ;

  CreateBookContent._() : super();
  factory CreateBookContent({
    $core.String? title,
    $core.String? description,
    $core.double? price,
    $core.int? stock,
    $core.double? weight,
    $core.Iterable<$core.String>? genres,
    $core.Iterable<$core.String>? authors,
  }) {
    final _result = create();
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
    if (genres != null) {
      _result.genres.addAll(genres);
    }
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    return _result;
  }
  factory CreateBookContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBookContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBookContent clone() => CreateBookContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBookContent copyWith(void Function(CreateBookContent) updates) => super.copyWith((message) => updates(message as CreateBookContent)) as CreateBookContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateBookContent create() => CreateBookContent._();
  CreateBookContent createEmptyInstance() => create();
  static $pb.PbList<CreateBookContent> createRepeated() => $pb.PbList<CreateBookContent>();
  @$core.pragma('dart2js:noInline')
  static CreateBookContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBookContent>(create);
  static CreateBookContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get stock => $_getIZ(3);
  @$pb.TagNumber(4)
  set stock($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStock() => $_has(3);
  @$pb.TagNumber(4)
  void clearStock() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get weight => $_getN(4);
  @$pb.TagNumber(5)
  set weight($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get genres => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get authors => $_getList(6);
}

class GetBookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetBookRequest._() : super();
  factory GetBookRequest({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBookRequest clone() => GetBookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBookRequest copyWith(void Function(GetBookRequest) updates) => super.copyWith((message) => updates(message as GetBookRequest)) as GetBookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBookRequest create() => GetBookRequest._();
  GetBookRequest createEmptyInstance() => create();
  static $pb.PbList<GetBookRequest> createRepeated() => $pb.PbList<GetBookRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBookRequest>(create);
  static GetBookRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class AddUserFavoriteBookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddUserFavoriteBookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookID', protoName: 'bookID')
    ..hasRequiredFields = false
  ;

  AddUserFavoriteBookRequest._() : super();
  factory AddUserFavoriteBookRequest({
    $fixnum.Int64? bookID,
  }) {
    final _result = create();
    if (bookID != null) {
      _result.bookID = bookID;
    }
    return _result;
  }
  factory AddUserFavoriteBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserFavoriteBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserFavoriteBookRequest clone() => AddUserFavoriteBookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserFavoriteBookRequest copyWith(void Function(AddUserFavoriteBookRequest) updates) => super.copyWith((message) => updates(message as AddUserFavoriteBookRequest)) as AddUserFavoriteBookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddUserFavoriteBookRequest create() => AddUserFavoriteBookRequest._();
  AddUserFavoriteBookRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserFavoriteBookRequest> createRepeated() => $pb.PbList<AddUserFavoriteBookRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserFavoriteBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserFavoriteBookRequest>(create);
  static AddUserFavoriteBookRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bookID => $_getI64(0);
  @$pb.TagNumber(1)
  set bookID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearBookID() => clearField(1);
}

class DeleteUserFavoriteBookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUserFavoriteBookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookID', protoName: 'bookID')
    ..hasRequiredFields = false
  ;

  DeleteUserFavoriteBookRequest._() : super();
  factory DeleteUserFavoriteBookRequest({
    $fixnum.Int64? bookID,
  }) {
    final _result = create();
    if (bookID != null) {
      _result.bookID = bookID;
    }
    return _result;
  }
  factory DeleteUserFavoriteBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUserFavoriteBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUserFavoriteBookRequest clone() => DeleteUserFavoriteBookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUserFavoriteBookRequest copyWith(void Function(DeleteUserFavoriteBookRequest) updates) => super.copyWith((message) => updates(message as DeleteUserFavoriteBookRequest)) as DeleteUserFavoriteBookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUserFavoriteBookRequest create() => DeleteUserFavoriteBookRequest._();
  DeleteUserFavoriteBookRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteUserFavoriteBookRequest> createRepeated() => $pb.PbList<DeleteUserFavoriteBookRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserFavoriteBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUserFavoriteBookRequest>(create);
  static DeleteUserFavoriteBookRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bookID => $_getI64(0);
  @$pb.TagNumber(1)
  set bookID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBookID() => $_has(0);
  @$pb.TagNumber(1)
  void clearBookID() => clearField(1);
}

class ListUserFavoriteBooksRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListUserFavoriteBooksRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageID', $pb.PbFieldType.O3, protoName: 'pageID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sort')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minPrice', $pb.PbFieldType.OD, protoName: 'minPrice')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxPrice', $pb.PbFieldType.OD, protoName: 'maxPrice')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRating', $pb.PbFieldType.O3, protoName: 'minRating')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxRating', $pb.PbFieldType.O3, protoName: 'maxRating')
    ..hasRequiredFields = false
  ;

  ListUserFavoriteBooksRequest._() : super();
  factory ListUserFavoriteBooksRequest({
    $core.int? pageID,
    $core.int? pageSize,
    $core.String? sort,
    $core.double? minPrice,
    $core.double? maxPrice,
    $core.int? minRating,
    $core.int? maxRating,
  }) {
    final _result = create();
    if (pageID != null) {
      _result.pageID = pageID;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    if (minPrice != null) {
      _result.minPrice = minPrice;
    }
    if (maxPrice != null) {
      _result.maxPrice = maxPrice;
    }
    if (minRating != null) {
      _result.minRating = minRating;
    }
    if (maxRating != null) {
      _result.maxRating = maxRating;
    }
    return _result;
  }
  factory ListUserFavoriteBooksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListUserFavoriteBooksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListUserFavoriteBooksRequest clone() => ListUserFavoriteBooksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListUserFavoriteBooksRequest copyWith(void Function(ListUserFavoriteBooksRequest) updates) => super.copyWith((message) => updates(message as ListUserFavoriteBooksRequest)) as ListUserFavoriteBooksRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListUserFavoriteBooksRequest create() => ListUserFavoriteBooksRequest._();
  ListUserFavoriteBooksRequest createEmptyInstance() => create();
  static $pb.PbList<ListUserFavoriteBooksRequest> createRepeated() => $pb.PbList<ListUserFavoriteBooksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListUserFavoriteBooksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListUserFavoriteBooksRequest>(create);
  static ListUserFavoriteBooksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageID => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageID() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sort => $_getSZ(2);
  @$pb.TagNumber(3)
  set sort($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSort() => $_has(2);
  @$pb.TagNumber(3)
  void clearSort() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get minPrice => $_getN(3);
  @$pb.TagNumber(4)
  set minPrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get maxPrice => $_getN(4);
  @$pb.TagNumber(5)
  set maxPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get minRating => $_getIZ(5);
  @$pb.TagNumber(6)
  set minRating($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinRating() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinRating() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get maxRating => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxRating($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxRating() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxRating() => clearField(7);
}

class ListBooksRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBooksRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageID', $pb.PbFieldType.O3, protoName: 'pageID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sort')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minPrice', $pb.PbFieldType.OD, protoName: 'minPrice')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxPrice', $pb.PbFieldType.OD, protoName: 'maxPrice')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minRating', $pb.PbFieldType.O3, protoName: 'minRating')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxRating', $pb.PbFieldType.O3, protoName: 'maxRating')
    ..hasRequiredFields = false
  ;

  ListBooksRequest._() : super();
  factory ListBooksRequest({
    $core.int? pageID,
    $core.int? pageSize,
    $core.String? sort,
    $core.double? minPrice,
    $core.double? maxPrice,
    $core.int? minRating,
    $core.int? maxRating,
  }) {
    final _result = create();
    if (pageID != null) {
      _result.pageID = pageID;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (sort != null) {
      _result.sort = sort;
    }
    if (minPrice != null) {
      _result.minPrice = minPrice;
    }
    if (maxPrice != null) {
      _result.maxPrice = maxPrice;
    }
    if (minRating != null) {
      _result.minRating = minRating;
    }
    if (maxRating != null) {
      _result.maxRating = maxRating;
    }
    return _result;
  }
  factory ListBooksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBooksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBooksRequest clone() => ListBooksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBooksRequest copyWith(void Function(ListBooksRequest) updates) => super.copyWith((message) => updates(message as ListBooksRequest)) as ListBooksRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBooksRequest create() => ListBooksRequest._();
  ListBooksRequest createEmptyInstance() => create();
  static $pb.PbList<ListBooksRequest> createRepeated() => $pb.PbList<ListBooksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListBooksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBooksRequest>(create);
  static ListBooksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageID => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageID() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sort => $_getSZ(2);
  @$pb.TagNumber(3)
  set sort($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSort() => $_has(2);
  @$pb.TagNumber(3)
  void clearSort() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get minPrice => $_getN(3);
  @$pb.TagNumber(4)
  set minPrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get maxPrice => $_getN(4);
  @$pb.TagNumber(5)
  set maxPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get minRating => $_getIZ(5);
  @$pb.TagNumber(6)
  set minRating($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinRating() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinRating() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get maxRating => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxRating($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxRating() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxRating() => clearField(7);
}

class DeleteBooksRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteBooksRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  DeleteBooksRequest._() : super();
  factory DeleteBooksRequest({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory DeleteBooksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBooksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBooksRequest clone() => DeleteBooksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBooksRequest copyWith(void Function(DeleteBooksRequest) updates) => super.copyWith((message) => updates(message as DeleteBooksRequest)) as DeleteBooksRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteBooksRequest create() => DeleteBooksRequest._();
  DeleteBooksRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBooksRequest> createRepeated() => $pb.PbList<DeleteBooksRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBooksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBooksRequest>(create);
  static DeleteBooksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ids => $_getList(0);
}


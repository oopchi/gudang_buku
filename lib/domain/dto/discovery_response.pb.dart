///
//  Generated code. Do not modify.
//  source: discovery_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;
import 'book_response.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $12;

enum DiscoveryResponse_Data {
  content, 
  imageData, 
  book, 
  notSet
}

class DiscoveryResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DiscoveryResponse_Data> _DiscoveryResponse_DataByTag = {
    1 : DiscoveryResponse_Data.content,
    2 : DiscoveryResponse_Data.imageData,
    3 : DiscoveryResponse_Data.book,
    0 : DiscoveryResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscoveryResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DiscoveryContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: DiscoveryContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..aOM<$1.BookResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'book', subBuilder: $1.BookResponse.create)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DiscoveryResponse._() : super();
  factory DiscoveryResponse({
    DiscoveryContent? content,
    $13.ImageData? imageData,
    $1.BookResponse? book,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    if (book != null) {
      _result.book = book;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DiscoveryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoveryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscoveryResponse clone() => DiscoveryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscoveryResponse copyWith(void Function(DiscoveryResponse) updates) => super.copyWith((message) => updates(message as DiscoveryResponse)) as DiscoveryResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoveryResponse create() => DiscoveryResponse._();
  DiscoveryResponse createEmptyInstance() => create();
  static $pb.PbList<DiscoveryResponse> createRepeated() => $pb.PbList<DiscoveryResponse>();
  @$core.pragma('dart2js:noInline')
  static DiscoveryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoveryResponse>(create);
  static DiscoveryResponse? _defaultInstance;

  DiscoveryResponse_Data whichData() => _DiscoveryResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DiscoveryContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(DiscoveryContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  DiscoveryContent ensureContent() => $_ensure(0);

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
  $1.BookResponse get book => $_getN(2);
  @$pb.TagNumber(3)
  set book($1.BookResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBook() => $_has(2);
  @$pb.TagNumber(3)
  void clearBook() => clearField(3);
  @$pb.TagNumber(3)
  $1.BookResponse ensureBook() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get id => $_getI64(3);
  @$pb.TagNumber(4)
  set id($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);
}

class DiscoveryContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscoveryContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$12.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayOrder', $pb.PbFieldType.O3, protoName: 'displayOrder')
    ..aOM<$12.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  DiscoveryContent._() : super();
  factory DiscoveryContent({
    $12.Timestamp? updatedAt,
    $core.int? displayOrder,
    $12.Timestamp? createdAt,
  }) {
    final _result = create();
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (displayOrder != null) {
      _result.displayOrder = displayOrder;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory DiscoveryContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoveryContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscoveryContent clone() => DiscoveryContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscoveryContent copyWith(void Function(DiscoveryContent) updates) => super.copyWith((message) => updates(message as DiscoveryContent)) as DiscoveryContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoveryContent create() => DiscoveryContent._();
  DiscoveryContent createEmptyInstance() => create();
  static $pb.PbList<DiscoveryContent> createRepeated() => $pb.PbList<DiscoveryContent>();
  @$core.pragma('dart2js:noInline')
  static DiscoveryContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoveryContent>(create);
  static DiscoveryContent? _defaultInstance;

  @$pb.TagNumber(1)
  $12.Timestamp get updatedAt => $_getN(0);
  @$pb.TagNumber(1)
  set updatedAt($12.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedAt() => clearField(1);
  @$pb.TagNumber(1)
  $12.Timestamp ensureUpdatedAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get displayOrder => $_getIZ(1);
  @$pb.TagNumber(2)
  set displayOrder($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayOrder() => clearField(2);

  @$pb.TagNumber(3)
  $12.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($12.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $12.Timestamp ensureCreatedAt() => $_ensure(2);
}


///
//  Generated code. Do not modify.
//  source: discount_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'book_response.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $12;

enum DiscountResponse_Data {
  content, 
  book, 
  notSet
}

class DiscountResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DiscountResponse_Data> _DiscountResponse_DataByTag = {
    1 : DiscountResponse_Data.content,
    2 : DiscountResponse_Data.book,
    0 : DiscountResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscountResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<DiscountContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: DiscountContent.create)
    ..aOM<$1.BookResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'book', subBuilder: $1.BookResponse.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  DiscountResponse._() : super();
  factory DiscountResponse({
    DiscountContent? content,
    $1.BookResponse? book,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (book != null) {
      _result.book = book;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DiscountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscountResponse clone() => DiscountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscountResponse copyWith(void Function(DiscountResponse) updates) => super.copyWith((message) => updates(message as DiscountResponse)) as DiscountResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscountResponse create() => DiscountResponse._();
  DiscountResponse createEmptyInstance() => create();
  static $pb.PbList<DiscountResponse> createRepeated() => $pb.PbList<DiscountResponse>();
  @$core.pragma('dart2js:noInline')
  static DiscountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscountResponse>(create);
  static DiscountResponse? _defaultInstance;

  DiscountResponse_Data whichData() => _DiscountResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DiscountContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(DiscountContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  DiscountContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.BookResponse get book => $_getN(1);
  @$pb.TagNumber(2)
  set book($1.BookResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBook() => $_has(1);
  @$pb.TagNumber(2)
  void clearBook() => clearField(2);
  @$pb.TagNumber(2)
  $1.BookResponse ensureBook() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

class DiscountContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DiscountContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$12.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountAmount', $pb.PbFieldType.OD, protoName: 'discountAmount')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumDiscountAmount', $pb.PbFieldType.OD, protoName: 'maximumDiscountAmount')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountType', protoName: 'discountType')
    ..aOM<$12.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationDate', protoName: 'expirationDate', subBuilder: $12.Timestamp.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfUse', $pb.PbFieldType.O3, protoName: 'numOfUse')
    ..aOM<$12.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  DiscountContent._() : super();
  factory DiscountContent({
    $12.Timestamp? updatedAt,
    $core.double? discountAmount,
    $core.double? maximumDiscountAmount,
    $core.String? discountType,
    $12.Timestamp? expirationDate,
    $core.int? numOfUse,
    $12.Timestamp? createdAt,
  }) {
    final _result = create();
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (discountAmount != null) {
      _result.discountAmount = discountAmount;
    }
    if (maximumDiscountAmount != null) {
      _result.maximumDiscountAmount = maximumDiscountAmount;
    }
    if (discountType != null) {
      _result.discountType = discountType;
    }
    if (expirationDate != null) {
      _result.expirationDate = expirationDate;
    }
    if (numOfUse != null) {
      _result.numOfUse = numOfUse;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory DiscountContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscountContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DiscountContent clone() => DiscountContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DiscountContent copyWith(void Function(DiscountContent) updates) => super.copyWith((message) => updates(message as DiscountContent)) as DiscountContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscountContent create() => DiscountContent._();
  DiscountContent createEmptyInstance() => create();
  static $pb.PbList<DiscountContent> createRepeated() => $pb.PbList<DiscountContent>();
  @$core.pragma('dart2js:noInline')
  static DiscountContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscountContent>(create);
  static DiscountContent? _defaultInstance;

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
  $core.double get discountAmount => $_getN(1);
  @$pb.TagNumber(2)
  set discountAmount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiscountAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiscountAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get maximumDiscountAmount => $_getN(2);
  @$pb.TagNumber(3)
  set maximumDiscountAmount($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaximumDiscountAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaximumDiscountAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get discountType => $_getSZ(3);
  @$pb.TagNumber(4)
  set discountType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDiscountType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDiscountType() => clearField(4);

  @$pb.TagNumber(5)
  $12.Timestamp get expirationDate => $_getN(4);
  @$pb.TagNumber(5)
  set expirationDate($12.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpirationDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpirationDate() => clearField(5);
  @$pb.TagNumber(5)
  $12.Timestamp ensureExpirationDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get numOfUse => $_getIZ(5);
  @$pb.TagNumber(6)
  set numOfUse($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumOfUse() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumOfUse() => clearField(6);

  @$pb.TagNumber(7)
  $12.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($12.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $12.Timestamp ensureCreatedAt() => $_ensure(6);
}


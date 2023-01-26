///
//  Generated code. Do not modify.
//  source: promo_code_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;
import 'pagination_response.pb.dart' as $14;
import 'google/protobuf/timestamp.pb.dart' as $12;

enum PromoCodeResponse_Data {
  content, 
  imageData, 
  pagination, 
  notSet
}

class PromoCodeResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, PromoCodeResponse_Data> _PromoCodeResponse_DataByTag = {
    1 : PromoCodeResponse_Data.content,
    2 : PromoCodeResponse_Data.imageData,
    3 : PromoCodeResponse_Data.pagination,
    0 : PromoCodeResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PromoCodeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<PromoCodeContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: PromoCodeContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..aOM<$14.PaginationResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $14.PaginationResponse.create)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PromoCodeResponse._() : super();
  factory PromoCodeResponse({
    PromoCodeContent? content,
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
  factory PromoCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromoCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromoCodeResponse clone() => PromoCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromoCodeResponse copyWith(void Function(PromoCodeResponse) updates) => super.copyWith((message) => updates(message as PromoCodeResponse)) as PromoCodeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromoCodeResponse create() => PromoCodeResponse._();
  PromoCodeResponse createEmptyInstance() => create();
  static $pb.PbList<PromoCodeResponse> createRepeated() => $pb.PbList<PromoCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static PromoCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromoCodeResponse>(create);
  static PromoCodeResponse? _defaultInstance;

  PromoCodeResponse_Data whichData() => _PromoCodeResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  PromoCodeContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(PromoCodeContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  PromoCodeContent ensureContent() => $_ensure(0);

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

class PromoCodeContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PromoCodeContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$12.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountAmount', $pb.PbFieldType.OD, protoName: 'discountAmount')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountType', protoName: 'discountType')
    ..aOM<$12.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationDate', protoName: 'expirationDate', subBuilder: $12.Timestamp.create)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minimumPurchaseAmount', $pb.PbFieldType.OD, protoName: 'minimumPurchaseAmount')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumDiscountAmount', $pb.PbFieldType.OD, protoName: 'maximumDiscountAmount')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfUse', $pb.PbFieldType.O3, protoName: 'numOfUse')
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promoClassID', protoName: 'promoClassID')
    ..aOM<$12.Timestamp>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  PromoCodeContent._() : super();
  factory PromoCodeContent({
    $12.Timestamp? updatedAt,
    $core.String? code,
    $core.double? discountAmount,
    $core.String? discountType,
    $12.Timestamp? expirationDate,
    $core.double? minimumPurchaseAmount,
    $core.double? maximumDiscountAmount,
    $core.int? numOfUse,
    $fixnum.Int64? promoClassID,
    $12.Timestamp? createdAt,
  }) {
    final _result = create();
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (code != null) {
      _result.code = code;
    }
    if (discountAmount != null) {
      _result.discountAmount = discountAmount;
    }
    if (discountType != null) {
      _result.discountType = discountType;
    }
    if (expirationDate != null) {
      _result.expirationDate = expirationDate;
    }
    if (minimumPurchaseAmount != null) {
      _result.minimumPurchaseAmount = minimumPurchaseAmount;
    }
    if (maximumDiscountAmount != null) {
      _result.maximumDiscountAmount = maximumDiscountAmount;
    }
    if (numOfUse != null) {
      _result.numOfUse = numOfUse;
    }
    if (promoClassID != null) {
      _result.promoClassID = promoClassID;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory PromoCodeContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromoCodeContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromoCodeContent clone() => PromoCodeContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromoCodeContent copyWith(void Function(PromoCodeContent) updates) => super.copyWith((message) => updates(message as PromoCodeContent)) as PromoCodeContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromoCodeContent create() => PromoCodeContent._();
  PromoCodeContent createEmptyInstance() => create();
  static $pb.PbList<PromoCodeContent> createRepeated() => $pb.PbList<PromoCodeContent>();
  @$core.pragma('dart2js:noInline')
  static PromoCodeContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromoCodeContent>(create);
  static PromoCodeContent? _defaultInstance;

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
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get discountAmount => $_getN(2);
  @$pb.TagNumber(3)
  set discountAmount($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiscountAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscountAmount() => clearField(3);

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
  $core.double get minimumPurchaseAmount => $_getN(5);
  @$pb.TagNumber(6)
  set minimumPurchaseAmount($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinimumPurchaseAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinimumPurchaseAmount() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get maximumDiscountAmount => $_getN(6);
  @$pb.TagNumber(7)
  set maximumDiscountAmount($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaximumDiscountAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaximumDiscountAmount() => clearField(7);

  @$pb.TagNumber(9)
  $core.int get numOfUse => $_getIZ(7);
  @$pb.TagNumber(9)
  set numOfUse($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasNumOfUse() => $_has(7);
  @$pb.TagNumber(9)
  void clearNumOfUse() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get promoClassID => $_getI64(8);
  @$pb.TagNumber(10)
  set promoClassID($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasPromoClassID() => $_has(8);
  @$pb.TagNumber(10)
  void clearPromoClassID() => clearField(10);

  @$pb.TagNumber(11)
  $12.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(11)
  set createdAt($12.Timestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(11)
  void clearCreatedAt() => clearField(11);
  @$pb.TagNumber(11)
  $12.Timestamp ensureCreatedAt() => $_ensure(9);
}


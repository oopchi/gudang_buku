///
//  Generated code. Do not modify.
//  source: promo_code_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $8;

class ListOngoingPromoCodesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListOngoingPromoCodesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageID', $pb.PbFieldType.O3, protoName: 'pageID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3, protoName: 'pageSize')
    ..hasRequiredFields = false
  ;

  ListOngoingPromoCodesRequest._() : super();
  factory ListOngoingPromoCodesRequest({
    $core.int? pageID,
    $core.int? pageSize,
  }) {
    final _result = create();
    if (pageID != null) {
      _result.pageID = pageID;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    return _result;
  }
  factory ListOngoingPromoCodesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListOngoingPromoCodesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListOngoingPromoCodesRequest clone() => ListOngoingPromoCodesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListOngoingPromoCodesRequest copyWith(void Function(ListOngoingPromoCodesRequest) updates) => super.copyWith((message) => updates(message as ListOngoingPromoCodesRequest)) as ListOngoingPromoCodesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListOngoingPromoCodesRequest create() => ListOngoingPromoCodesRequest._();
  ListOngoingPromoCodesRequest createEmptyInstance() => create();
  static $pb.PbList<ListOngoingPromoCodesRequest> createRepeated() => $pb.PbList<ListOngoingPromoCodesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListOngoingPromoCodesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListOngoingPromoCodesRequest>(create);
  static ListOngoingPromoCodesRequest? _defaultInstance;

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
}

class DeletePromoCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePromoCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  DeletePromoCodeRequest._() : super();
  factory DeletePromoCodeRequest({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory DeletePromoCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePromoCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePromoCodeRequest clone() => DeletePromoCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePromoCodeRequest copyWith(void Function(DeletePromoCodeRequest) updates) => super.copyWith((message) => updates(message as DeletePromoCodeRequest)) as DeletePromoCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePromoCodeRequest create() => DeletePromoCodeRequest._();
  DeletePromoCodeRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePromoCodeRequest> createRepeated() => $pb.PbList<DeletePromoCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePromoCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePromoCodeRequest>(create);
  static DeletePromoCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ids => $_getList(0);
}

enum CreatePromoCodeRequest_Data {
  content, 
  chunk, 
  notSet
}

class CreatePromoCodeRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreatePromoCodeRequest_Data> _CreatePromoCodeRequest_DataByTag = {
    1 : CreatePromoCodeRequest_Data.content,
    2 : CreatePromoCodeRequest_Data.chunk,
    0 : CreatePromoCodeRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePromoCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<CreatePromoCodeContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: CreatePromoCodeContent.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  CreatePromoCodeRequest._() : super();
  factory CreatePromoCodeRequest({
    CreatePromoCodeContent? content,
    $core.List<$core.int>? chunk,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (chunk != null) {
      _result.chunk = chunk;
    }
    return _result;
  }
  factory CreatePromoCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromoCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromoCodeRequest clone() => CreatePromoCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromoCodeRequest copyWith(void Function(CreatePromoCodeRequest) updates) => super.copyWith((message) => updates(message as CreatePromoCodeRequest)) as CreatePromoCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePromoCodeRequest create() => CreatePromoCodeRequest._();
  CreatePromoCodeRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePromoCodeRequest> createRepeated() => $pb.PbList<CreatePromoCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePromoCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromoCodeRequest>(create);
  static CreatePromoCodeRequest? _defaultInstance;

  CreatePromoCodeRequest_Data whichData() => _CreatePromoCodeRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CreatePromoCodeContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(CreatePromoCodeContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  CreatePromoCodeContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);
}

class CreatePromoCodeContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePromoCodeContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountAmount', $pb.PbFieldType.OD, protoName: 'discountAmount')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountType', protoName: 'discountType')
    ..aOM<$8.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationDate', protoName: 'expirationDate', subBuilder: $8.Timestamp.create)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minimumPurchaseAmount', $pb.PbFieldType.OD, protoName: 'minimumPurchaseAmount')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumDiscountAmount', $pb.PbFieldType.OD, protoName: 'maximumDiscountAmount')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfUse', $pb.PbFieldType.O3, protoName: 'numOfUse')
    ..aInt64(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promoClassID', protoName: 'promoClassID')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageExtension', protoName: 'imageExtension')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mimeType', protoName: 'mimeType')
    ..hasRequiredFields = false
  ;

  CreatePromoCodeContent._() : super();
  factory CreatePromoCodeContent({
    $core.String? code,
    $core.double? discountAmount,
    $core.String? discountType,
    $8.Timestamp? expirationDate,
    $core.double? minimumPurchaseAmount,
    $core.double? maximumDiscountAmount,
    $core.int? numOfUse,
    $fixnum.Int64? promoClassID,
    $core.String? imageExtension,
    $core.String? mimeType,
  }) {
    final _result = create();
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
    if (imageExtension != null) {
      _result.imageExtension = imageExtension;
    }
    if (mimeType != null) {
      _result.mimeType = mimeType;
    }
    return _result;
  }
  factory CreatePromoCodeContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromoCodeContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromoCodeContent clone() => CreatePromoCodeContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromoCodeContent copyWith(void Function(CreatePromoCodeContent) updates) => super.copyWith((message) => updates(message as CreatePromoCodeContent)) as CreatePromoCodeContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePromoCodeContent create() => CreatePromoCodeContent._();
  CreatePromoCodeContent createEmptyInstance() => create();
  static $pb.PbList<CreatePromoCodeContent> createRepeated() => $pb.PbList<CreatePromoCodeContent>();
  @$core.pragma('dart2js:noInline')
  static CreatePromoCodeContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromoCodeContent>(create);
  static CreatePromoCodeContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get discountAmount => $_getN(1);
  @$pb.TagNumber(2)
  set discountAmount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDiscountAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiscountAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get discountType => $_getSZ(2);
  @$pb.TagNumber(3)
  set discountType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiscountType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscountType() => clearField(3);

  @$pb.TagNumber(4)
  $8.Timestamp get expirationDate => $_getN(3);
  @$pb.TagNumber(4)
  set expirationDate($8.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationDate() => clearField(4);
  @$pb.TagNumber(4)
  $8.Timestamp ensureExpirationDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.double get minimumPurchaseAmount => $_getN(4);
  @$pb.TagNumber(5)
  set minimumPurchaseAmount($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinimumPurchaseAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinimumPurchaseAmount() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get maximumDiscountAmount => $_getN(5);
  @$pb.TagNumber(6)
  set maximumDiscountAmount($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaximumDiscountAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaximumDiscountAmount() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get numOfUse => $_getIZ(6);
  @$pb.TagNumber(7)
  set numOfUse($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNumOfUse() => $_has(6);
  @$pb.TagNumber(7)
  void clearNumOfUse() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get promoClassID => $_getI64(7);
  @$pb.TagNumber(8)
  set promoClassID($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPromoClassID() => $_has(7);
  @$pb.TagNumber(8)
  void clearPromoClassID() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get imageExtension => $_getSZ(8);
  @$pb.TagNumber(9)
  set imageExtension($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasImageExtension() => $_has(8);
  @$pb.TagNumber(9)
  void clearImageExtension() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get mimeType => $_getSZ(9);
  @$pb.TagNumber(10)
  set mimeType($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMimeType() => $_has(9);
  @$pb.TagNumber(10)
  void clearMimeType() => clearField(10);
}


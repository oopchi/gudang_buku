///
//  Generated code. Do not modify.
//  source: discount_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $12;

class CreateDiscountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDiscountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountAmount', $pb.PbFieldType.OD, protoName: 'discountAmount')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumDiscountAmount', $pb.PbFieldType.OD, protoName: 'maximumDiscountAmount')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'discountType', protoName: 'discountType')
    ..aOM<$12.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationDate', protoName: 'expirationDate', subBuilder: $12.Timestamp.create)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numOfUse', $pb.PbFieldType.O3, protoName: 'numOfUse')
    ..p<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookIDs', $pb.PbFieldType.K6, protoName: 'bookIDs')
    ..hasRequiredFields = false
  ;

  CreateDiscountRequest._() : super();
  factory CreateDiscountRequest({
    $core.double? discountAmount,
    $core.double? maximumDiscountAmount,
    $core.String? discountType,
    $12.Timestamp? expirationDate,
    $core.int? numOfUse,
    $core.Iterable<$fixnum.Int64>? bookIDs,
  }) {
    final _result = create();
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
    if (bookIDs != null) {
      _result.bookIDs.addAll(bookIDs);
    }
    return _result;
  }
  factory CreateDiscountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDiscountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDiscountRequest clone() => CreateDiscountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDiscountRequest copyWith(void Function(CreateDiscountRequest) updates) => super.copyWith((message) => updates(message as CreateDiscountRequest)) as CreateDiscountRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDiscountRequest create() => CreateDiscountRequest._();
  CreateDiscountRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDiscountRequest> createRepeated() => $pb.PbList<CreateDiscountRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDiscountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDiscountRequest>(create);
  static CreateDiscountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get discountAmount => $_getN(0);
  @$pb.TagNumber(1)
  set discountAmount($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDiscountAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearDiscountAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get maximumDiscountAmount => $_getN(1);
  @$pb.TagNumber(2)
  set maximumDiscountAmount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaximumDiscountAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaximumDiscountAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get discountType => $_getSZ(2);
  @$pb.TagNumber(3)
  set discountType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiscountType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscountType() => clearField(3);

  @$pb.TagNumber(4)
  $12.Timestamp get expirationDate => $_getN(3);
  @$pb.TagNumber(4)
  set expirationDate($12.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationDate() => clearField(4);
  @$pb.TagNumber(4)
  $12.Timestamp ensureExpirationDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get numOfUse => $_getIZ(4);
  @$pb.TagNumber(5)
  set numOfUse($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumOfUse() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumOfUse() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$fixnum.Int64> get bookIDs => $_getList(5);
}

class ListDiscountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListDiscountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListDiscountRequest._() : super();
  factory ListDiscountRequest() => create();
  factory ListDiscountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDiscountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDiscountRequest clone() => ListDiscountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDiscountRequest copyWith(void Function(ListDiscountRequest) updates) => super.copyWith((message) => updates(message as ListDiscountRequest)) as ListDiscountRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListDiscountRequest create() => ListDiscountRequest._();
  ListDiscountRequest createEmptyInstance() => create();
  static $pb.PbList<ListDiscountRequest> createRepeated() => $pb.PbList<ListDiscountRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDiscountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDiscountRequest>(create);
  static ListDiscountRequest? _defaultInstance;
}


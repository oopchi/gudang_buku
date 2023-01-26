///
//  Generated code. Do not modify.
//  source: promo_class_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $12;

class PromoClassResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PromoClassResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumConcurrentPromo', $pb.PbFieldType.O3, protoName: 'maximumConcurrentPromo')
    ..aOM<$12.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  PromoClassResponse._() : super();
  factory PromoClassResponse({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? maximumConcurrentPromo,
    $12.Timestamp? createdAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (maximumConcurrentPromo != null) {
      _result.maximumConcurrentPromo = maximumConcurrentPromo;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory PromoClassResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromoClassResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromoClassResponse clone() => PromoClassResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromoClassResponse copyWith(void Function(PromoClassResponse) updates) => super.copyWith((message) => updates(message as PromoClassResponse)) as PromoClassResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromoClassResponse create() => PromoClassResponse._();
  PromoClassResponse createEmptyInstance() => create();
  static $pb.PbList<PromoClassResponse> createRepeated() => $pb.PbList<PromoClassResponse>();
  @$core.pragma('dart2js:noInline')
  static PromoClassResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromoClassResponse>(create);
  static PromoClassResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maximumConcurrentPromo => $_getIZ(2);
  @$pb.TagNumber(3)
  set maximumConcurrentPromo($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaximumConcurrentPromo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaximumConcurrentPromo() => clearField(3);

  @$pb.TagNumber(4)
  $12.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($12.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $12.Timestamp ensureCreatedAt() => $_ensure(3);
}

class ListPromoClassResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListPromoClassResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<PromoClassResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promos', $pb.PbFieldType.PM, subBuilder: PromoClassResponse.create)
    ..hasRequiredFields = false
  ;

  ListPromoClassResponse._() : super();
  factory ListPromoClassResponse({
    $core.Iterable<PromoClassResponse>? promos,
  }) {
    final _result = create();
    if (promos != null) {
      _result.promos.addAll(promos);
    }
    return _result;
  }
  factory ListPromoClassResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPromoClassResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPromoClassResponse clone() => ListPromoClassResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPromoClassResponse copyWith(void Function(ListPromoClassResponse) updates) => super.copyWith((message) => updates(message as ListPromoClassResponse)) as ListPromoClassResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListPromoClassResponse create() => ListPromoClassResponse._();
  ListPromoClassResponse createEmptyInstance() => create();
  static $pb.PbList<ListPromoClassResponse> createRepeated() => $pb.PbList<ListPromoClassResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPromoClassResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPromoClassResponse>(create);
  static ListPromoClassResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PromoClassResponse> get promos => $_getList(0);
}


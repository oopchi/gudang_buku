///
//  Generated code. Do not modify.
//  source: promo_class_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreatePromoClassRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePromoClassRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumConcurrentPromo', $pb.PbFieldType.O3, protoName: 'maximumConcurrentPromo')
    ..hasRequiredFields = false
  ;

  CreatePromoClassRequest._() : super();
  factory CreatePromoClassRequest({
    $core.String? name,
    $core.int? maximumConcurrentPromo,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (maximumConcurrentPromo != null) {
      _result.maximumConcurrentPromo = maximumConcurrentPromo;
    }
    return _result;
  }
  factory CreatePromoClassRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromoClassRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromoClassRequest clone() => CreatePromoClassRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromoClassRequest copyWith(void Function(CreatePromoClassRequest) updates) => super.copyWith((message) => updates(message as CreatePromoClassRequest)) as CreatePromoClassRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePromoClassRequest create() => CreatePromoClassRequest._();
  CreatePromoClassRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePromoClassRequest> createRepeated() => $pb.PbList<CreatePromoClassRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePromoClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromoClassRequest>(create);
  static CreatePromoClassRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maximumConcurrentPromo => $_getIZ(1);
  @$pb.TagNumber(2)
  set maximumConcurrentPromo($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaximumConcurrentPromo() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaximumConcurrentPromo() => clearField(2);
}

class UpdatePromoClassRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePromoClassRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maximumConcurrentPromo', $pb.PbFieldType.O3, protoName: 'maximumConcurrentPromo')
    ..hasRequiredFields = false
  ;

  UpdatePromoClassRequest._() : super();
  factory UpdatePromoClassRequest({
    $core.String? name,
    $core.int? maximumConcurrentPromo,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (maximumConcurrentPromo != null) {
      _result.maximumConcurrentPromo = maximumConcurrentPromo;
    }
    return _result;
  }
  factory UpdatePromoClassRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePromoClassRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePromoClassRequest clone() => UpdatePromoClassRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePromoClassRequest copyWith(void Function(UpdatePromoClassRequest) updates) => super.copyWith((message) => updates(message as UpdatePromoClassRequest)) as UpdatePromoClassRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePromoClassRequest create() => UpdatePromoClassRequest._();
  UpdatePromoClassRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePromoClassRequest> createRepeated() => $pb.PbList<UpdatePromoClassRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePromoClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePromoClassRequest>(create);
  static UpdatePromoClassRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maximumConcurrentPromo => $_getIZ(1);
  @$pb.TagNumber(2)
  set maximumConcurrentPromo($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaximumConcurrentPromo() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaximumConcurrentPromo() => clearField(2);
}


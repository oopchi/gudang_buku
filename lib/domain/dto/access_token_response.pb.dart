///
//  Generated code. Do not modify.
//  source: access_token_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $12;

class RenewAccessTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RenewAccessTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken')
    ..aOM<$12.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessTokenExpiresAt', protoName: 'accessTokenExpiresAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  RenewAccessTokenResponse._() : super();
  factory RenewAccessTokenResponse({
    $core.String? accessToken,
    $12.Timestamp? accessTokenExpiresAt,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (accessTokenExpiresAt != null) {
      _result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    return _result;
  }
  factory RenewAccessTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenewAccessTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenewAccessTokenResponse clone() => RenewAccessTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenewAccessTokenResponse copyWith(void Function(RenewAccessTokenResponse) updates) => super.copyWith((message) => updates(message as RenewAccessTokenResponse)) as RenewAccessTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RenewAccessTokenResponse create() => RenewAccessTokenResponse._();
  RenewAccessTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RenewAccessTokenResponse> createRepeated() => $pb.PbList<RenewAccessTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RenewAccessTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenewAccessTokenResponse>(create);
  static RenewAccessTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $12.Timestamp get accessTokenExpiresAt => $_getN(1);
  @$pb.TagNumber(2)
  set accessTokenExpiresAt($12.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessTokenExpiresAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessTokenExpiresAt() => clearField(2);
  @$pb.TagNumber(2)
  $12.Timestamp ensureAccessTokenExpiresAt() => $_ensure(1);
}


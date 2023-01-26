///
//  Generated code. Do not modify.
//  source: user_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;
import 'google/protobuf/timestamp.pb.dart' as $12;

enum UserResponse_Data {
  content, 
  imageData, 
  notSet
}

class UserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UserResponse_Data> _UserResponse_DataByTag = {
    1 : UserResponse_Data.content,
    2 : UserResponse_Data.imageData,
    0 : UserResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UserContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: UserContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  UserResponse._() : super();
  factory UserResponse({
    UserContent? content,
    $13.ImageData? imageData,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory UserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserResponse clone() => UserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserResponse copyWith(void Function(UserResponse) updates) => super.copyWith((message) => updates(message as UserResponse)) as UserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserResponse create() => UserResponse._();
  UserResponse createEmptyInstance() => create();
  static $pb.PbList<UserResponse> createRepeated() => $pb.PbList<UserResponse>();
  @$core.pragma('dart2js:noInline')
  static UserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserResponse>(create);
  static UserResponse? _defaultInstance;

  UserResponse_Data whichData() => _UserResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UserContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(UserContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  UserContent ensureContent() => $_ensure(0);

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
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

class UserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$12.Timestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emailVerified', protoName: 'emailVerified')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber', protoName: 'phoneNumber')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumberVerified', protoName: 'phoneNumberVerified')
    ..aOM<$12.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  UserContent._() : super();
  factory UserContent({
    $12.Timestamp? updatedAt,
    $core.String? name,
    $core.String? email,
    $core.bool? emailVerified,
    $core.String? phoneNumber,
    $core.bool? phoneNumberVerified,
    $12.Timestamp? createdAt,
  }) {
    final _result = create();
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (name != null) {
      _result.name = name;
    }
    if (email != null) {
      _result.email = email;
    }
    if (emailVerified != null) {
      _result.emailVerified = emailVerified;
    }
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (phoneNumberVerified != null) {
      _result.phoneNumberVerified = phoneNumberVerified;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    return _result;
  }
  factory UserContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserContent clone() => UserContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserContent copyWith(void Function(UserContent) updates) => super.copyWith((message) => updates(message as UserContent)) as UserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserContent create() => UserContent._();
  UserContent createEmptyInstance() => create();
  static $pb.PbList<UserContent> createRepeated() => $pb.PbList<UserContent>();
  @$core.pragma('dart2js:noInline')
  static UserContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserContent>(create);
  static UserContent? _defaultInstance;

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
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get emailVerified => $_getBF(3);
  @$pb.TagNumber(4)
  set emailVerified($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmailVerified() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmailVerified() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get phoneNumberVerified => $_getBF(5);
  @$pb.TagNumber(6)
  set phoneNumberVerified($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPhoneNumberVerified() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhoneNumberVerified() => clearField(6);

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

enum LoginUserResponse_Data {
  content, 
  userData, 
  notSet
}

class LoginUserResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LoginUserResponse_Data> _LoginUserResponse_DataByTag = {
    1 : LoginUserResponse_Data.content,
    2 : LoginUserResponse_Data.userData,
    0 : LoginUserResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<LoginUserContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: LoginUserContent.create)
    ..aOM<UserResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userData', protoName: 'userData', subBuilder: UserResponse.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  LoginUserResponse._() : super();
  factory LoginUserResponse({
    LoginUserContent? content,
    UserResponse? userData,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (userData != null) {
      _result.userData = userData;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory LoginUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserResponse clone() => LoginUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserResponse copyWith(void Function(LoginUserResponse) updates) => super.copyWith((message) => updates(message as LoginUserResponse)) as LoginUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserResponse create() => LoginUserResponse._();
  LoginUserResponse createEmptyInstance() => create();
  static $pb.PbList<LoginUserResponse> createRepeated() => $pb.PbList<LoginUserResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserResponse>(create);
  static LoginUserResponse? _defaultInstance;

  LoginUserResponse_Data whichData() => _LoginUserResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LoginUserContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(LoginUserContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  LoginUserContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  UserResponse get userData => $_getN(1);
  @$pb.TagNumber(2)
  set userData(UserResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserData() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserData() => clearField(2);
  @$pb.TagNumber(2)
  UserResponse ensureUserData() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);
}

class LoginUserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionID', protoName: 'sessionID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken')
    ..aOM<$12.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessTokenExpiresAt', protoName: 'accessTokenExpiresAt', subBuilder: $12.Timestamp.create)
    ..aOM<$12.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshTokenExpiresAt', protoName: 'refreshTokenExpiresAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  LoginUserContent._() : super();
  factory LoginUserContent({
    $core.String? sessionID,
    $core.String? accessToken,
    $core.String? refreshToken,
    $12.Timestamp? accessTokenExpiresAt,
    $12.Timestamp? refreshTokenExpiresAt,
  }) {
    final _result = create();
    if (sessionID != null) {
      _result.sessionID = sessionID;
    }
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (accessTokenExpiresAt != null) {
      _result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    if (refreshTokenExpiresAt != null) {
      _result.refreshTokenExpiresAt = refreshTokenExpiresAt;
    }
    return _result;
  }
  factory LoginUserContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserContent clone() => LoginUserContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserContent copyWith(void Function(LoginUserContent) updates) => super.copyWith((message) => updates(message as LoginUserContent)) as LoginUserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserContent create() => LoginUserContent._();
  LoginUserContent createEmptyInstance() => create();
  static $pb.PbList<LoginUserContent> createRepeated() => $pb.PbList<LoginUserContent>();
  @$core.pragma('dart2js:noInline')
  static LoginUserContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserContent>(create);
  static LoginUserContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set refreshToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRefreshToken() => clearField(3);

  @$pb.TagNumber(4)
  $12.Timestamp get accessTokenExpiresAt => $_getN(3);
  @$pb.TagNumber(4)
  set accessTokenExpiresAt($12.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAccessTokenExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccessTokenExpiresAt() => clearField(4);
  @$pb.TagNumber(4)
  $12.Timestamp ensureAccessTokenExpiresAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $12.Timestamp get refreshTokenExpiresAt => $_getN(4);
  @$pb.TagNumber(5)
  set refreshTokenExpiresAt($12.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRefreshTokenExpiresAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearRefreshTokenExpiresAt() => clearField(5);
  @$pb.TagNumber(5)
  $12.Timestamp ensureRefreshTokenExpiresAt() => $_ensure(4);
}


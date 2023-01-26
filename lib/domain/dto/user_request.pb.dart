///
//  Generated code. Do not modify.
//  source: user_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;

enum LoginUserRequest_Data {
  content, 
  googleContent, 
  notSet
}

class LoginUserRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, LoginUserRequest_Data> _LoginUserRequest_DataByTag = {
    1 : LoginUserRequest_Data.content,
    2 : LoginUserRequest_Data.googleContent,
    0 : LoginUserRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<LoginUserRequestContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: LoginUserRequestContent.create)
    ..aOM<LoginGoogleUserContent>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'googleContent', protoName: 'googleContent', subBuilder: LoginGoogleUserContent.create)
    ..hasRequiredFields = false
  ;

  LoginUserRequest._() : super();
  factory LoginUserRequest({
    LoginUserRequestContent? content,
    LoginGoogleUserContent? googleContent,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (googleContent != null) {
      _result.googleContent = googleContent;
    }
    return _result;
  }
  factory LoginUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserRequest clone() => LoginUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserRequest copyWith(void Function(LoginUserRequest) updates) => super.copyWith((message) => updates(message as LoginUserRequest)) as LoginUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserRequest create() => LoginUserRequest._();
  LoginUserRequest createEmptyInstance() => create();
  static $pb.PbList<LoginUserRequest> createRepeated() => $pb.PbList<LoginUserRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserRequest>(create);
  static LoginUserRequest? _defaultInstance;

  LoginUserRequest_Data whichData() => _LoginUserRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LoginUserRequestContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(LoginUserRequestContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  LoginUserRequestContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  LoginGoogleUserContent get googleContent => $_getN(1);
  @$pb.TagNumber(2)
  set googleContent(LoginGoogleUserContent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGoogleContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoogleContent() => clearField(2);
  @$pb.TagNumber(2)
  LoginGoogleUserContent ensureGoogleContent() => $_ensure(1);
}

class LoginUserRequestContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUserRequestContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginUserRequestContent._() : super();
  factory LoginUserRequestContent({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginUserRequestContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserRequestContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserRequestContent clone() => LoginUserRequestContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserRequestContent copyWith(void Function(LoginUserRequestContent) updates) => super.copyWith((message) => updates(message as LoginUserRequestContent)) as LoginUserRequestContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUserRequestContent create() => LoginUserRequestContent._();
  LoginUserRequestContent createEmptyInstance() => create();
  static $pb.PbList<LoginUserRequestContent> createRepeated() => $pb.PbList<LoginUserRequestContent>();
  @$core.pragma('dart2js:noInline')
  static LoginUserRequestContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserRequestContent>(create);
  static LoginUserRequestContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginGoogleUserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginGoogleUserContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idToken', protoName: 'idToken')
    ..hasRequiredFields = false
  ;

  LoginGoogleUserContent._() : super();
  factory LoginGoogleUserContent({
    $core.String? idToken,
  }) {
    final _result = create();
    if (idToken != null) {
      _result.idToken = idToken;
    }
    return _result;
  }
  factory LoginGoogleUserContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginGoogleUserContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginGoogleUserContent clone() => LoginGoogleUserContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginGoogleUserContent copyWith(void Function(LoginGoogleUserContent) updates) => super.copyWith((message) => updates(message as LoginGoogleUserContent)) as LoginGoogleUserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginGoogleUserContent create() => LoginGoogleUserContent._();
  LoginGoogleUserContent createEmptyInstance() => create();
  static $pb.PbList<LoginGoogleUserContent> createRepeated() => $pb.PbList<LoginGoogleUserContent>();
  @$core.pragma('dart2js:noInline')
  static LoginGoogleUserContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginGoogleUserContent>(create);
  static LoginGoogleUserContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set idToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdToken() => clearField(1);
}

enum CreateUserRequest_Data {
  content, 
  imageData, 
  googleContent, 
  notSet
}

class CreateUserRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateUserRequest_Data> _CreateUserRequest_DataByTag = {
    1 : CreateUserRequest_Data.content,
    2 : CreateUserRequest_Data.imageData,
    3 : CreateUserRequest_Data.googleContent,
    0 : CreateUserRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<CreateUserContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: CreateUserContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..aOM<CreateGoogleUserContent>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'googleContent', protoName: 'googleContent', subBuilder: CreateGoogleUserContent.create)
    ..hasRequiredFields = false
  ;

  CreateUserRequest._() : super();
  factory CreateUserRequest({
    CreateUserContent? content,
    $13.ImageData? imageData,
    CreateGoogleUserContent? googleContent,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    if (googleContent != null) {
      _result.googleContent = googleContent;
    }
    return _result;
  }
  factory CreateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserRequest clone() => CreateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserRequest copyWith(void Function(CreateUserRequest) updates) => super.copyWith((message) => updates(message as CreateUserRequest)) as CreateUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserRequest create() => CreateUserRequest._();
  CreateUserRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserRequest> createRepeated() => $pb.PbList<CreateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserRequest>(create);
  static CreateUserRequest? _defaultInstance;

  CreateUserRequest_Data whichData() => _CreateUserRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CreateUserContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(CreateUserContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  CreateUserContent ensureContent() => $_ensure(0);

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
  CreateGoogleUserContent get googleContent => $_getN(2);
  @$pb.TagNumber(3)
  set googleContent(CreateGoogleUserContent v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGoogleContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoogleContent() => clearField(3);
  @$pb.TagNumber(3)
  CreateGoogleUserContent ensureGoogleContent() => $_ensure(2);
}

class CreateGoogleUserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateGoogleUserContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idToken', protoName: 'idToken')
    ..hasRequiredFields = false
  ;

  CreateGoogleUserContent._() : super();
  factory CreateGoogleUserContent({
    $core.String? idToken,
  }) {
    final _result = create();
    if (idToken != null) {
      _result.idToken = idToken;
    }
    return _result;
  }
  factory CreateGoogleUserContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGoogleUserContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGoogleUserContent clone() => CreateGoogleUserContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGoogleUserContent copyWith(void Function(CreateGoogleUserContent) updates) => super.copyWith((message) => updates(message as CreateGoogleUserContent)) as CreateGoogleUserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateGoogleUserContent create() => CreateGoogleUserContent._();
  CreateGoogleUserContent createEmptyInstance() => create();
  static $pb.PbList<CreateGoogleUserContent> createRepeated() => $pb.PbList<CreateGoogleUserContent>();
  @$core.pragma('dart2js:noInline')
  static CreateGoogleUserContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGoogleUserContent>(create);
  static CreateGoogleUserContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set idToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdToken() => clearField(1);
}

class CreateUserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUserContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  CreateUserContent._() : super();
  factory CreateUserContent({
    $core.String? name,
    $core.String? password,
    $core.String? email,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (password != null) {
      _result.password = password;
    }
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory CreateUserContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserContent clone() => CreateUserContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserContent copyWith(void Function(CreateUserContent) updates) => super.copyWith((message) => updates(message as CreateUserContent)) as CreateUserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUserContent create() => CreateUserContent._();
  CreateUserContent createEmptyInstance() => create();
  static $pb.PbList<CreateUserContent> createRepeated() => $pb.PbList<CreateUserContent>();
  @$core.pragma('dart2js:noInline')
  static CreateUserContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserContent>(create);
  static CreateUserContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}


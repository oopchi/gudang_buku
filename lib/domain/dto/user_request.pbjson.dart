///
//  Generated code. Do not modify.
//  source: user_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginUserRequestDescriptor instead')
const LoginUserRequest$json = const {
  '1': 'LoginUserRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.LoginUserRequestContent', '9': 0, '10': 'content'},
    const {'1': 'googleContent', '3': 2, '4': 1, '5': 11, '6': '.pb.LoginGoogleUserContent', '9': 0, '10': 'googleContent'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `LoginUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserRequestDescriptor = $convert.base64Decode('ChBMb2dpblVzZXJSZXF1ZXN0EjcKB2NvbnRlbnQYASABKAsyGy5wYi5Mb2dpblVzZXJSZXF1ZXN0Q29udGVudEgAUgdjb250ZW50EkIKDWdvb2dsZUNvbnRlbnQYAiABKAsyGi5wYi5Mb2dpbkdvb2dsZVVzZXJDb250ZW50SABSDWdvb2dsZUNvbnRlbnRCBgoEZGF0YQ==');
@$core.Deprecated('Use loginUserRequestContentDescriptor instead')
const LoginUserRequestContent$json = const {
  '1': 'LoginUserRequestContent',
  '2': const [
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'password'},
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'email'},
  ],
};

/// Descriptor for `LoginUserRequestContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserRequestContentDescriptor = $convert.base64Decode('ChdMb2dpblVzZXJSZXF1ZXN0Q29udGVudBImCghwYXNzd29yZBgCIAEoCUIK+kIHcgUQBhj+AVIIcGFzc3dvcmQSHQoFZW1haWwYASABKAlCB/pCBHICYAFSBWVtYWls');
@$core.Deprecated('Use loginGoogleUserContentDescriptor instead')
const LoginGoogleUserContent$json = const {
  '1': 'LoginGoogleUserContent',
  '2': const [
    const {'1': 'idToken', '3': 1, '4': 1, '5': 9, '10': 'idToken'},
  ],
};

/// Descriptor for `LoginGoogleUserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginGoogleUserContentDescriptor = $convert.base64Decode('ChZMb2dpbkdvb2dsZVVzZXJDb250ZW50EhgKB2lkVG9rZW4YASABKAlSB2lkVG9rZW4=');
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.CreateUserContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
    const {'1': 'googleContent', '3': 3, '4': 1, '5': 11, '6': '.pb.CreateGoogleUserContent', '9': 0, '10': 'googleContent'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBIxCgdjb250ZW50GAEgASgLMhUucGIuQ3JlYXRlVXNlckNvbnRlbnRIAFIHY29udGVudBItCglpbWFnZURhdGEYAiABKAsyDS5wYi5JbWFnZURhdGFIAFIJaW1hZ2VEYXRhEkMKDWdvb2dsZUNvbnRlbnQYAyABKAsyGy5wYi5DcmVhdGVHb29nbGVVc2VyQ29udGVudEgAUg1nb29nbGVDb250ZW50QgYKBGRhdGE=');
@$core.Deprecated('Use createGoogleUserContentDescriptor instead')
const CreateGoogleUserContent$json = const {
  '1': 'CreateGoogleUserContent',
  '2': const [
    const {'1': 'idToken', '3': 1, '4': 1, '5': 9, '10': 'idToken'},
  ],
};

/// Descriptor for `CreateGoogleUserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGoogleUserContentDescriptor = $convert.base64Decode('ChdDcmVhdGVHb29nbGVVc2VyQ29udGVudBIYCgdpZFRva2VuGAEgASgJUgdpZFRva2Vu');
@$core.Deprecated('Use createUserContentDescriptor instead')
const CreateUserContent$json = const {
  '1': 'CreateUserContent',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'name'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'password'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'email'},
  ],
};

/// Descriptor for `CreateUserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserContentDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyQ29udGVudBIzCgRuYW1lGAEgASgJQh/6QgZyBBADGGT6QhNyETIPXlthLXpBLVowLTlfXSskUgRuYW1lEiYKCHBhc3N3b3JkGAIgASgJQgr6QgdyBRAGGP4BUghwYXNzd29yZBIdCgVlbWFpbBgDIAEoCUIH+kIEcgJgAVIFZW1haWw=');

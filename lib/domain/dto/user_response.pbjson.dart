///
//  Generated code. Do not modify.
//  source: user_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = const {
  '1': 'UserResponse',
  '2': const [
    const {'1': 'id', '3': 3, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.UserContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode('CgxVc2VyUmVzcG9uc2USDgoCaWQYAyABKANSAmlkEisKB2NvbnRlbnQYASABKAsyDy5wYi5Vc2VyQ29udGVudEgAUgdjb250ZW50Ei0KCWltYWdlRGF0YRgCIAEoCzINLnBiLkltYWdlRGF0YUgAUglpbWFnZURhdGE6A4BDAUIGCgRkYXRh');
@$core.Deprecated('Use userContentDescriptor instead')
const UserContent$json = const {
  '1': 'UserContent',
  '2': const [
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'email', '17': true},
    const {'1': 'emailVerified', '3': 4, '4': 1, '5': 8, '10': 'emailVerified'},
    const {'1': 'phoneNumber', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'phoneNumber', '17': true},
    const {'1': 'phoneNumberVerified', '3': 6, '4': 1, '5': 8, '10': 'phoneNumberVerified'},
    const {'1': 'createdAt', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'updatedAt', '17': true},
  ],
  '7': const {},
  '8': const [
    const {'1': '_email'},
    const {'1': '_phoneNumber'},
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `UserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userContentDescriptor = $convert.base64Decode('CgtVc2VyQ29udGVudBISCgRuYW1lGAIgASgJUgRuYW1lEhkKBWVtYWlsGAMgASgJSABSBWVtYWlsiAEBEiQKDWVtYWlsVmVyaWZpZWQYBCABKAhSDWVtYWlsVmVyaWZpZWQSJQoLcGhvbmVOdW1iZXIYBSABKAlIAVILcGhvbmVOdW1iZXKIAQESMAoTcGhvbmVOdW1iZXJWZXJpZmllZBgGIAEoCFITcGhvbmVOdW1iZXJWZXJpZmllZBI4CgljcmVhdGVkQXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPQoJdXBkYXRlZEF0GAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgCUgl1cGRhdGVkQXSIAQE6A4BDAUIICgZfZW1haWxCDgoMX3Bob25lTnVtYmVyQgwKCl91cGRhdGVkQXQ=');
@$core.Deprecated('Use loginUserResponseDescriptor instead')
const LoginUserResponse$json = const {
  '1': 'LoginUserResponse',
  '2': const [
    const {'1': 'id', '3': 3, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.LoginUserContent', '9': 0, '10': 'content'},
    const {'1': 'userData', '3': 2, '4': 1, '5': 11, '6': '.pb.UserResponse', '9': 0, '10': 'userData'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `LoginUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserResponseDescriptor = $convert.base64Decode('ChFMb2dpblVzZXJSZXNwb25zZRIOCgJpZBgDIAEoA1ICaWQSMAoHY29udGVudBgBIAEoCzIULnBiLkxvZ2luVXNlckNvbnRlbnRIAFIHY29udGVudBIuCgh1c2VyRGF0YRgCIAEoCzIQLnBiLlVzZXJSZXNwb25zZUgAUgh1c2VyRGF0YUIGCgRkYXRh');
@$core.Deprecated('Use loginUserContentDescriptor instead')
const LoginUserContent$json = const {
  '1': 'LoginUserContent',
  '2': const [
    const {'1': 'sessionID', '3': 1, '4': 1, '5': 9, '10': 'sessionID'},
    const {'1': 'accessToken', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'accessTokenExpiresAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    const {'1': 'refreshTokenExpiresAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
  ],
  '7': const {},
};

/// Descriptor for `LoginUserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserContentDescriptor = $convert.base64Decode('ChBMb2dpblVzZXJDb250ZW50EhwKCXNlc3Npb25JRBgBIAEoCVIJc2Vzc2lvbklEEiAKC2FjY2Vzc1Rva2VuGAIgASgJUgthY2Nlc3NUb2tlbhIiCgxyZWZyZXNoVG9rZW4YAyABKAlSDHJlZnJlc2hUb2tlbhJOChRhY2Nlc3NUb2tlbkV4cGlyZXNBdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFGFjY2Vzc1Rva2VuRXhwaXJlc0F0ElAKFXJlZnJlc2hUb2tlbkV4cGlyZXNBdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFXJlZnJlc2hUb2tlbkV4cGlyZXNBdDoDgEMB');

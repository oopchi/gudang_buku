///
//  Generated code. Do not modify.
//  source: author_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authorResponseDescriptor instead')
const AuthorResponse$json = const {
  '1': 'AuthorResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'updatedAt', '17': true},
  ],
  '7': const {},
  '8': const [
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `AuthorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorResponseDescriptor = $convert.base64Decode('Cg5BdXRob3JSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRI4CgljcmVhdGVkQXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPQoJdXBkYXRlZEF0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgAUgl1cGRhdGVkQXSIAQE6A4BDAUIMCgpfdXBkYXRlZEF0');
@$core.Deprecated('Use listAuthorResponseDescriptor instead')
const ListAuthorResponse$json = const {
  '1': 'ListAuthorResponse',
  '2': const [
    const {'1': 'authors', '3': 1, '4': 3, '5': 11, '6': '.pb.AuthorResponse', '10': 'authors'},
  ],
  '7': const {},
};

/// Descriptor for `ListAuthorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listAuthorResponseDescriptor = $convert.base64Decode('ChJMaXN0QXV0aG9yUmVzcG9uc2USLAoHYXV0aG9ycxgBIAMoCzISLnBiLkF1dGhvclJlc3BvbnNlUgdhdXRob3JzOgOAQwE=');

///
//  Generated code. Do not modify.
//  source: genre_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use genreResponseDescriptor instead')
const GenreResponse$json = const {
  '1': 'GenreResponse',
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

/// Descriptor for `GenreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genreResponseDescriptor = $convert.base64Decode('Cg1HZW5yZVJlc3BvbnNlEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI9Cgl1cGRhdGVkQXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSCXVwZGF0ZWRBdIgBAToDgEMBQgwKCl91cGRhdGVkQXQ=');
@$core.Deprecated('Use listGenreResponseDescriptor instead')
const ListGenreResponse$json = const {
  '1': 'ListGenreResponse',
  '2': const [
    const {'1': 'authors', '3': 1, '4': 3, '5': 11, '6': '.pb.GenreResponse', '10': 'authors'},
  ],
  '7': const {},
};

/// Descriptor for `ListGenreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listGenreResponseDescriptor = $convert.base64Decode('ChFMaXN0R2VucmVSZXNwb25zZRIrCgdhdXRob3JzGAEgAygLMhEucGIuR2VucmVSZXNwb25zZVIHYXV0aG9yczoDgEMB');

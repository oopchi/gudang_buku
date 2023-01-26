///
//  Generated code. Do not modify.
//  source: discovery_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use discoveryResponseDescriptor instead')
const DiscoveryResponse$json = const {
  '1': 'DiscoveryResponse',
  '2': const [
    const {'1': 'id', '3': 4, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.DiscoveryContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
    const {'1': 'book', '3': 3, '4': 1, '5': 11, '6': '.pb.BookResponse', '9': 0, '10': 'book'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `DiscoveryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoveryResponseDescriptor = $convert.base64Decode('ChFEaXNjb3ZlcnlSZXNwb25zZRIOCgJpZBgEIAEoA1ICaWQSMAoHY29udGVudBgBIAEoCzIULnBiLkRpc2NvdmVyeUNvbnRlbnRIAFIHY29udGVudBItCglpbWFnZURhdGEYAiABKAsyDS5wYi5JbWFnZURhdGFIAFIJaW1hZ2VEYXRhEiYKBGJvb2sYAyABKAsyEC5wYi5Cb29rUmVzcG9uc2VIAFIEYm9va0IGCgRkYXRh');
@$core.Deprecated('Use discoveryContentDescriptor instead')
const DiscoveryContent$json = const {
  '1': 'DiscoveryContent',
  '2': const [
    const {'1': 'displayOrder', '3': 2, '4': 1, '5': 5, '10': 'displayOrder'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'updatedAt', '17': true},
  ],
  '7': const {},
  '8': const [
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `DiscoveryContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoveryContentDescriptor = $convert.base64Decode('ChBEaXNjb3ZlcnlDb250ZW50EiIKDGRpc3BsYXlPcmRlchgCIAEoBVIMZGlzcGxheU9yZGVyEjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI9Cgl1cGRhdGVkQXQYASABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSCXVwZGF0ZWRBdIgBAToDgEMBQgwKCl91cGRhdGVkQXQ=');

///
//  Generated code. Do not modify.
//  source: discovery_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createDiscoveryRequestDescriptor instead')
const CreateDiscoveryRequest$json = const {
  '1': 'CreateDiscoveryRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.CreateDiscoveryContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreateDiscoveryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDiscoveryRequestDescriptor = $convert.base64Decode('ChZDcmVhdGVEaXNjb3ZlcnlSZXF1ZXN0EjYKB2NvbnRlbnQYASABKAsyGi5wYi5DcmVhdGVEaXNjb3ZlcnlDb250ZW50SABSB2NvbnRlbnQSLQoJaW1hZ2VEYXRhGAIgASgLMg0ucGIuSW1hZ2VEYXRhSABSCWltYWdlRGF0YUIGCgRkYXRh');
@$core.Deprecated('Use createDiscoveryContentDescriptor instead')
const CreateDiscoveryContent$json = const {
  '1': 'CreateDiscoveryContent',
  '2': const [
    const {'1': 'displayOrder', '3': 1, '4': 1, '5': 5, '8': const {}, '9': 0, '10': 'displayOrder', '17': true},
    const {'1': 'bookIDs', '3': 2, '4': 3, '5': 3, '10': 'bookIDs'},
  ],
  '8': const [
    const {'1': '_displayOrder'},
  ],
};

/// Descriptor for `CreateDiscoveryContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDiscoveryContentDescriptor = $convert.base64Decode('ChZDcmVhdGVEaXNjb3ZlcnlDb250ZW50EjAKDGRpc3BsYXlPcmRlchgBIAEoBUIH+kIEGgIoAUgAUgxkaXNwbGF5T3JkZXKIAQESGAoHYm9va0lEcxgCIAMoA1IHYm9va0lEc0IPCg1fZGlzcGxheU9yZGVy');
@$core.Deprecated('Use listDiscoveryRequestDescriptor instead')
const ListDiscoveryRequest$json = const {
  '1': 'ListDiscoveryRequest',
};

/// Descriptor for `ListDiscoveryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDiscoveryRequestDescriptor = $convert.base64Decode('ChRMaXN0RGlzY292ZXJ5UmVxdWVzdA==');

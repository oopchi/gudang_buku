///
//  Generated code. Do not modify.
//  source: image_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use imageDataDescriptor instead')
const ImageData$json = const {
  '1': 'ImageData',
  '2': const [
    const {'1': 'imageID', '3': 3, '4': 1, '5': 3, '10': 'imageID'},
    const {'1': 'metaData', '3': 1, '4': 1, '5': 11, '6': '.pb.ImageMetaData', '9': 0, '10': 'metaData'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'chunk'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `ImageData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDataDescriptor = $convert.base64Decode('CglJbWFnZURhdGESGAoHaW1hZ2VJRBgDIAEoA1IHaW1hZ2VJRBIvCghtZXRhRGF0YRgBIAEoCzIRLnBiLkltYWdlTWV0YURhdGFIAFIIbWV0YURhdGESFgoFY2h1bmsYAiABKAxIAFIFY2h1bms6A4BDAUIGCgRkYXRh');
@$core.Deprecated('Use imageMetaDataDescriptor instead')
const ImageMetaData$json = const {
  '1': 'ImageMetaData',
  '2': const [
    const {'1': 'imageExtension', '3': 1, '4': 1, '5': 9, '10': 'imageExtension'},
    const {'1': 'mimeType', '3': 2, '4': 1, '5': 9, '10': 'mimeType'},
  ],
  '7': const {},
};

/// Descriptor for `ImageMetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageMetaDataDescriptor = $convert.base64Decode('Cg1JbWFnZU1ldGFEYXRhEiYKDmltYWdlRXh0ZW5zaW9uGAEgASgJUg5pbWFnZUV4dGVuc2lvbhIaCghtaW1lVHlwZRgCIAEoCVIIbWltZVR5cGU6A4BDAQ==');

///
//  Generated code. Do not modify.
//  source: discount_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use discountResponseDescriptor instead')
const DiscountResponse$json = const {
  '1': 'DiscountResponse',
  '2': const [
    const {'1': 'id', '3': 3, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.DiscountContent', '9': 0, '10': 'content'},
    const {'1': 'book', '3': 2, '4': 1, '5': 11, '6': '.pb.BookResponse', '9': 0, '10': 'book'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `DiscountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discountResponseDescriptor = $convert.base64Decode('ChBEaXNjb3VudFJlc3BvbnNlEg4KAmlkGAMgASgDUgJpZBIvCgdjb250ZW50GAEgASgLMhMucGIuRGlzY291bnRDb250ZW50SABSB2NvbnRlbnQSJgoEYm9vaxgCIAEoCzIQLnBiLkJvb2tSZXNwb25zZUgAUgRib29rQgYKBGRhdGE=');
@$core.Deprecated('Use discountContentDescriptor instead')
const DiscountContent$json = const {
  '1': 'DiscountContent',
  '2': const [
    const {'1': 'discountAmount', '3': 2, '4': 1, '5': 1, '8': const {}, '10': 'discountAmount'},
    const {'1': 'maximumDiscountAmount', '3': 3, '4': 1, '5': 1, '8': const {}, '9': 0, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'discountType', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'expirationDate', '17': true},
    const {'1': 'numOfUse', '3': 6, '4': 1, '5': 5, '8': const {}, '9': 2, '10': 'numOfUse', '17': true},
    const {'1': 'createdAt', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'updatedAt', '17': true},
  ],
  '7': const {},
  '8': const [
    const {'1': '_maximumDiscountAmount'},
    const {'1': '_expirationDate'},
    const {'1': '_numOfUse'},
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `DiscountContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discountContentDescriptor = $convert.base64Decode('Cg9EaXNjb3VudENvbnRlbnQSRAoOZGlzY291bnRBbW91bnQYAiABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSDmRpc2NvdW50QW1vdW50ElcKFW1heGltdW1EaXNjb3VudEFtb3VudBgDIAEoAUIc+kILEgkpAAAAAAAAAAD6QgsSCREAAAAgX6ACQkgAUhVtYXhpbXVtRGlzY291bnRBbW91bnSIAQESPQoMZGlzY291bnRUeXBlGAQgASgJQhn6QhZyFFIGYW1vdW50UgpwZXJjZW50YWdlUgxkaXNjb3VudFR5cGUSRwoOZXhwaXJhdGlvbkRhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSDmV4cGlyYXRpb25EYXRliAEBEigKCG51bU9mVXNlGAYgASgFQgf6QgQaAigASAJSCG51bU9mVXNliAEBEjgKCWNyZWF0ZWRBdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI9Cgl1cGRhdGVkQXQYASABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSANSCXVwZGF0ZWRBdIgBAToDgEMBQhgKFl9tYXhpbXVtRGlzY291bnRBbW91bnRCEQoPX2V4cGlyYXRpb25EYXRlQgsKCV9udW1PZlVzZUIMCgpfdXBkYXRlZEF0');

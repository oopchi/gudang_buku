///
//  Generated code. Do not modify.
//  source: discount_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createDiscountRequestDescriptor instead')
const CreateDiscountRequest$json = const {
  '1': 'CreateDiscountRequest',
  '2': const [
    const {'1': 'discountAmount', '3': 1, '4': 1, '5': 1, '8': const {}, '10': 'discountAmount'},
    const {'1': 'maximumDiscountAmount', '3': 2, '4': 1, '5': 1, '8': const {}, '9': 0, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'discountType', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'expirationDate', '17': true},
    const {'1': 'numOfUse', '3': 5, '4': 1, '5': 5, '8': const {}, '9': 2, '10': 'numOfUse', '17': true},
    const {'1': 'bookIDs', '3': 6, '4': 3, '5': 3, '10': 'bookIDs'},
  ],
  '8': const [
    const {'1': '_maximumDiscountAmount'},
    const {'1': '_expirationDate'},
    const {'1': '_numOfUse'},
  ],
};

/// Descriptor for `CreateDiscountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDiscountRequestDescriptor = $convert.base64Decode('ChVDcmVhdGVEaXNjb3VudFJlcXVlc3QSRAoOZGlzY291bnRBbW91bnQYASABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSDmRpc2NvdW50QW1vdW50ElcKFW1heGltdW1EaXNjb3VudEFtb3VudBgCIAEoAUIc+kILEgkpAAAAAAAAAAD6QgsSCREAAAAgX6ACQkgAUhVtYXhpbXVtRGlzY291bnRBbW91bnSIAQESPQoMZGlzY291bnRUeXBlGAMgASgJQhn6QhZyFFIGYW1vdW50UgpwZXJjZW50YWdlUgxkaXNjb3VudFR5cGUSRwoOZXhwaXJhdGlvbkRhdGUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSDmV4cGlyYXRpb25EYXRliAEBEigKCG51bU9mVXNlGAUgASgFQgf6QgQaAigASAJSCG51bU9mVXNliAEBEhgKB2Jvb2tJRHMYBiADKANSB2Jvb2tJRHNCGAoWX21heGltdW1EaXNjb3VudEFtb3VudEIRCg9fZXhwaXJhdGlvbkRhdGVCCwoJX251bU9mVXNl');
@$core.Deprecated('Use listDiscountRequestDescriptor instead')
const ListDiscountRequest$json = const {
  '1': 'ListDiscountRequest',
};

/// Descriptor for `ListDiscountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDiscountRequestDescriptor = $convert.base64Decode('ChNMaXN0RGlzY291bnRSZXF1ZXN0');

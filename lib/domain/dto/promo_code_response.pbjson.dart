///
//  Generated code. Do not modify.
//  source: promo_code_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use promoCodeResponseDescriptor instead')
const PromoCodeResponse$json = const {
  '1': 'PromoCodeResponse',
  '2': const [
    const {'1': 'id', '3': 4, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.PromoCodeContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.pb.PaginationResponse', '9': 0, '10': 'pagination'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `PromoCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promoCodeResponseDescriptor = $convert.base64Decode('ChFQcm9tb0NvZGVSZXNwb25zZRIOCgJpZBgEIAEoA1ICaWQSMAoHY29udGVudBgBIAEoCzIULnBiLlByb21vQ29kZUNvbnRlbnRIAFIHY29udGVudBItCglpbWFnZURhdGEYAiABKAsyDS5wYi5JbWFnZURhdGFIAFIJaW1hZ2VEYXRhEjgKCnBhZ2luYXRpb24YAyABKAsyFi5wYi5QYWdpbmF0aW9uUmVzcG9uc2VIAFIKcGFnaW5hdGlvbjoDgEMBQgYKBGRhdGE=');
@$core.Deprecated('Use promoCodeContentDescriptor instead')
const PromoCodeContent$json = const {
  '1': 'PromoCodeContent',
  '2': const [
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'discountAmount', '3': 3, '4': 1, '5': 1, '10': 'discountAmount'},
    const {'1': 'discountType', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'expirationDate', '17': true},
    const {'1': 'minimumPurchaseAmount', '3': 6, '4': 1, '5': 1, '9': 1, '10': 'minimumPurchaseAmount', '17': true},
    const {'1': 'maximumDiscountAmount', '3': 7, '4': 1, '5': 1, '9': 2, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'numOfUse', '3': 9, '4': 1, '5': 5, '10': 'numOfUse'},
    const {'1': 'promoClassID', '3': 10, '4': 1, '5': 3, '10': 'promoClassID'},
    const {'1': 'createdAt', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'updatedAt', '17': true},
  ],
  '8': const [
    const {'1': '_expirationDate'},
    const {'1': '_minimumPurchaseAmount'},
    const {'1': '_maximumDiscountAmount'},
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `PromoCodeContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promoCodeContentDescriptor = $convert.base64Decode('ChBQcm9tb0NvZGVDb250ZW50EhIKBGNvZGUYAiABKAlSBGNvZGUSJgoOZGlzY291bnRBbW91bnQYAyABKAFSDmRpc2NvdW50QW1vdW50Ej0KDGRpc2NvdW50VHlwZRgEIAEoCUIZ+kIWchRSBmFtb3VudFIKcGVyY2VudGFnZVIMZGlzY291bnRUeXBlEkcKDmV4cGlyYXRpb25EYXRlGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgAUg5leHBpcmF0aW9uRGF0ZYgBARI5ChVtaW5pbXVtUHVyY2hhc2VBbW91bnQYBiABKAFIAVIVbWluaW11bVB1cmNoYXNlQW1vdW50iAEBEjkKFW1heGltdW1EaXNjb3VudEFtb3VudBgHIAEoAUgCUhVtYXhpbXVtRGlzY291bnRBbW91bnSIAQESGgoIbnVtT2ZVc2UYCSABKAVSCG51bU9mVXNlEiIKDHByb21vQ2xhc3NJRBgKIAEoA1IMcHJvbW9DbGFzc0lEEjgKCWNyZWF0ZWRBdBgLIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI9Cgl1cGRhdGVkQXQYASABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSANSCXVwZGF0ZWRBdIgBAUIRCg9fZXhwaXJhdGlvbkRhdGVCGAoWX21pbmltdW1QdXJjaGFzZUFtb3VudEIYChZfbWF4aW11bURpc2NvdW50QW1vdW50QgwKCl91cGRhdGVkQXQ=');

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
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.PromoCodeContent', '9': 0, '10': 'content'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'chunk'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `PromoCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promoCodeResponseDescriptor = $convert.base64Decode('ChFQcm9tb0NvZGVSZXNwb25zZRIwCgdjb250ZW50GAEgASgLMhQucGIuUHJvbW9Db2RlQ29udGVudEgAUgdjb250ZW50EhYKBWNodW5rGAIgASgMSABSBWNodW5rQgYKBGRhdGE=');
@$core.Deprecated('Use promoCodeContentDescriptor instead')
const PromoCodeContent$json = const {
  '1': 'PromoCodeContent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'discountAmount', '3': 3, '4': 1, '5': 1, '10': 'discountAmount'},
    const {'1': 'discountType', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'expirationDate', '17': true},
    const {'1': 'minimumPurchaseAmount', '3': 6, '4': 1, '5': 1, '9': 1, '10': 'minimumPurchaseAmount', '17': true},
    const {'1': 'maximumDiscountAmount', '3': 7, '4': 1, '5': 1, '9': 2, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'numOfUse', '3': 9, '4': 1, '5': 5, '10': 'numOfUse'},
    const {'1': 'promoClassID', '3': 10, '4': 1, '5': 3, '10': 'promoClassID'},
    const {'1': 'createdAt', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 12, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 3, '10': 'updatedAt', '17': true},
  ],
  '8': const [
    const {'1': '_expirationDate'},
    const {'1': '_minimumPurchaseAmount'},
    const {'1': '_maximumDiscountAmount'},
    const {'1': '_updatedAt'},
  ],
};

/// Descriptor for `PromoCodeContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promoCodeContentDescriptor = $convert.base64Decode('ChBQcm9tb0NvZGVDb250ZW50Eg4KAmlkGAEgASgDUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEiYKDmRpc2NvdW50QW1vdW50GAMgASgBUg5kaXNjb3VudEFtb3VudBI9CgxkaXNjb3VudFR5cGUYBCABKAlCGfpCFnIUUgZhbW91bnRSCnBlcmNlbnRhZ2VSDGRpc2NvdW50VHlwZRJHCg5leHBpcmF0aW9uRGF0ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFIOZXhwaXJhdGlvbkRhdGWIAQESOQoVbWluaW11bVB1cmNoYXNlQW1vdW50GAYgASgBSAFSFW1pbmltdW1QdXJjaGFzZUFtb3VudIgBARI5ChVtYXhpbXVtRGlzY291bnRBbW91bnQYByABKAFIAlIVbWF4aW11bURpc2NvdW50QW1vdW50iAEBEhoKCG51bU9mVXNlGAkgASgFUghudW1PZlVzZRIiCgxwcm9tb0NsYXNzSUQYCiABKANSDHByb21vQ2xhc3NJRBI4CgljcmVhdGVkQXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPQoJdXBkYXRlZEF0GAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgDUgl1cGRhdGVkQXSIAQFCEQoPX2V4cGlyYXRpb25EYXRlQhgKFl9taW5pbXVtUHVyY2hhc2VBbW91bnRCGAoWX21heGltdW1EaXNjb3VudEFtb3VudEIMCgpfdXBkYXRlZEF0');
@$core.Deprecated('Use listPromoCodeResponseDescriptor instead')
const ListPromoCodeResponse$json = const {
  '1': 'ListPromoCodeResponse',
  '2': const [
    const {'1': 'promos', '3': 1, '4': 3, '5': 11, '6': '.pb.PromoCodeResponse', '10': 'promos'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationResponse', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `ListPromoCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromoCodeResponseDescriptor = $convert.base64Decode('ChVMaXN0UHJvbW9Db2RlUmVzcG9uc2USLQoGcHJvbW9zGAEgAygLMhUucGIuUHJvbW9Db2RlUmVzcG9uc2VSBnByb21vcxI2CgpwYWdpbmF0aW9uGAIgASgLMhYucGIuUGFnaW5hdGlvblJlc3BvbnNlUgpwYWdpbmF0aW9uOgOAQwE=');

///
//  Generated code. Do not modify.
//  source: promo_class_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use promoClassResponseDescriptor instead')
const PromoClassResponse$json = const {
  '1': 'PromoClassResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'maximumConcurrentPromo', '3': 3, '4': 1, '5': 5, '10': 'maximumConcurrentPromo'},
    const {'1': 'createdAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '7': const {},
};

/// Descriptor for `PromoClassResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promoClassResponseDescriptor = $convert.base64Decode('ChJQcm9tb0NsYXNzUmVzcG9uc2USDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSNgoWbWF4aW11bUNvbmN1cnJlbnRQcm9tbxgDIAEoBVIWbWF4aW11bUNvbmN1cnJlbnRQcm9tbxI4CgljcmVhdGVkQXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ6A4BDAQ==');
@$core.Deprecated('Use listPromoClassResponseDescriptor instead')
const ListPromoClassResponse$json = const {
  '1': 'ListPromoClassResponse',
  '2': const [
    const {'1': 'promos', '3': 1, '4': 3, '5': 11, '6': '.pb.PromoClassResponse', '10': 'promos'},
  ],
  '7': const {},
};

/// Descriptor for `ListPromoClassResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromoClassResponseDescriptor = $convert.base64Decode('ChZMaXN0UHJvbW9DbGFzc1Jlc3BvbnNlEi4KBnByb21vcxgBIAMoCzIWLnBiLlByb21vQ2xhc3NSZXNwb25zZVIGcHJvbW9zOgOAQwE=');

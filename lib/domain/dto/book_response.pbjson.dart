///
//  Generated code. Do not modify.
//  source: book_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use bookResponseDescriptor instead')
const BookResponse$json = const {
  '1': 'BookResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'price', '3': 4, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'stock', '3': 5, '4': 1, '5': 5, '10': 'stock'},
    const {'1': 'weight', '3': 6, '4': 1, '5': 1, '10': 'weight'},
    const {'1': 'productStatus', '3': 7, '4': 1, '5': 9, '8': const {}, '10': 'productStatus'},
    const {'1': 'createdAt', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'updatedAt', '17': true},
    const {'1': 'averageRating', '3': 10, '4': 1, '5': 1, '9': 2, '10': 'averageRating', '17': true},
    const {'1': 'numOfRating', '3': 11, '4': 1, '5': 3, '9': 3, '10': 'numOfRating', '17': true},
    const {'1': 'numOfBought', '3': 12, '4': 1, '5': 3, '9': 4, '10': 'numOfBought', '17': true},
    const {'1': 'isRated', '3': 13, '4': 1, '5': 8, '9': 5, '10': 'isRated', '17': true},
    const {'1': 'authors', '3': 14, '4': 3, '5': 11, '6': '.pb.AuthorResponse', '10': 'authors'},
    const {'1': 'genres', '3': 15, '4': 3, '5': 11, '6': '.pb.GenreResponse', '10': 'genres'},
  ],
  '8': const [
    const {'1': '_description'},
    const {'1': '_updatedAt'},
    const {'1': '_averageRating'},
    const {'1': '_numOfRating'},
    const {'1': '_numOfBought'},
    const {'1': '_isRated'},
  ],
};

/// Descriptor for `BookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookResponseDescriptor = $convert.base64Decode('CgxCb29rUmVzcG9uc2USDgoCaWQYASABKANSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARIUCgVwcmljZRgEIAEoAVIFcHJpY2USFAoFc3RvY2sYBSABKAVSBXN0b2NrEhYKBndlaWdodBgGIAEoAVIGd2VpZ2h0ElAKDXByb2R1Y3RTdGF0dXMYByABKAlCKvpCJ3IlUgxvdXRfb2Zfc3RvY2tSCGluX3N0b2NrUgtydW5uaW5nX2xvd1INcHJvZHVjdFN0YXR1cxI4CgljcmVhdGVkQXQYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPQoJdXBkYXRlZEF0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgBUgl1cGRhdGVkQXSIAQESKQoNYXZlcmFnZVJhdGluZxgKIAEoAUgCUg1hdmVyYWdlUmF0aW5niAEBEiUKC251bU9mUmF0aW5nGAsgASgDSANSC251bU9mUmF0aW5niAEBEiUKC251bU9mQm91Z2h0GAwgASgDSARSC251bU9mQm91Z2h0iAEBEh0KB2lzUmF0ZWQYDSABKAhIBVIHaXNSYXRlZIgBARIsCgdhdXRob3JzGA4gAygLMhIucGIuQXV0aG9yUmVzcG9uc2VSB2F1dGhvcnMSKQoGZ2VucmVzGA8gAygLMhEucGIuR2VucmVSZXNwb25zZVIGZ2VucmVzQg4KDF9kZXNjcmlwdGlvbkIMCgpfdXBkYXRlZEF0QhAKDl9hdmVyYWdlUmF0aW5nQg4KDF9udW1PZlJhdGluZ0IOCgxfbnVtT2ZCb3VnaHRCCgoIX2lzUmF0ZWQ=');
@$core.Deprecated('Use listBookResponseDescriptor instead')
const ListBookResponse$json = const {
  '1': 'ListBookResponse',
  '2': const [
    const {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.pb.BookResponse', '10': 'books'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationResponse', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `ListBookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBookResponseDescriptor = $convert.base64Decode('ChBMaXN0Qm9va1Jlc3BvbnNlEiYKBWJvb2tzGAEgAygLMhAucGIuQm9va1Jlc3BvbnNlUgVib29rcxI2CgpwYWdpbmF0aW9uGAIgASgLMhYucGIuUGFnaW5hdGlvblJlc3BvbnNlUgpwYWdpbmF0aW9uOgOAQwE=');

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
    const {'1': 'id', '3': 4, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.BookContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.pb.PaginationResponse', '9': 0, '10': 'pagination'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `BookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookResponseDescriptor = $convert.base64Decode('CgxCb29rUmVzcG9uc2USDgoCaWQYBCABKANSAmlkEisKB2NvbnRlbnQYASABKAsyDy5wYi5Cb29rQ29udGVudEgAUgdjb250ZW50Ei0KCWltYWdlRGF0YRgCIAEoCzINLnBiLkltYWdlRGF0YUgAUglpbWFnZURhdGESOAoKcGFnaW5hdGlvbhgDIAEoCzIWLnBiLlBhZ2luYXRpb25SZXNwb25zZUgAUgpwYWdpbmF0aW9uOgOAQwFCBgoEZGF0YQ==');
@$core.Deprecated('Use bookContentDescriptor instead')
const BookContent$json = const {
  '1': 'BookContent',
  '2': const [
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
    const {'1': 'genres', '3': 1, '4': 3, '5': 11, '6': '.pb.GenreResponse', '10': 'genres'},
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

/// Descriptor for `BookContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookContentDescriptor = $convert.base64Decode('CgtCb29rQ29udGVudBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSJQoLZGVzY3JpcHRpb24YAyABKAlIAFILZGVzY3JpcHRpb26IAQESFAoFcHJpY2UYBCABKAFSBXByaWNlEhQKBXN0b2NrGAUgASgFUgVzdG9jaxIWCgZ3ZWlnaHQYBiABKAFSBndlaWdodBJQCg1wcm9kdWN0U3RhdHVzGAcgASgJQir6QidyJVIMb3V0X29mX3N0b2NrUghpbl9zdG9ja1ILcnVubmluZ19sb3dSDXByb2R1Y3RTdGF0dXMSOAoJY3JlYXRlZEF0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Ej0KCXVwZGF0ZWRBdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAVIJdXBkYXRlZEF0iAEBEikKDWF2ZXJhZ2VSYXRpbmcYCiABKAFIAlINYXZlcmFnZVJhdGluZ4gBARIlCgtudW1PZlJhdGluZxgLIAEoA0gDUgtudW1PZlJhdGluZ4gBARIlCgtudW1PZkJvdWdodBgMIAEoA0gEUgtudW1PZkJvdWdodIgBARIdCgdpc1JhdGVkGA0gASgISAVSB2lzUmF0ZWSIAQESLAoHYXV0aG9ycxgOIAMoCzISLnBiLkF1dGhvclJlc3BvbnNlUgdhdXRob3JzEikKBmdlbnJlcxgBIAMoCzIRLnBiLkdlbnJlUmVzcG9uc2VSBmdlbnJlc0IOCgxfZGVzY3JpcHRpb25CDAoKX3VwZGF0ZWRBdEIQCg5fYXZlcmFnZVJhdGluZ0IOCgxfbnVtT2ZSYXRpbmdCDgoMX251bU9mQm91Z2h0QgoKCF9pc1JhdGVk');

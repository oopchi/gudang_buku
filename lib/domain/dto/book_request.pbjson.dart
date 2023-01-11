///
//  Generated code. Do not modify.
//  source: book_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createBookRequestDescriptor instead')
const CreateBookRequest$json = const {
  '1': 'CreateBookRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'price', '3': 3, '4': 1, '5': 1, '8': const {}, '10': 'price'},
    const {'1': 'stock', '3': 4, '4': 1, '5': 5, '8': const {}, '10': 'stock'},
    const {'1': 'weight', '3': 5, '4': 1, '5': 1, '8': const {}, '10': 'weight'},
    const {'1': 'genres', '3': 6, '4': 3, '5': 9, '8': const {}, '10': 'genres'},
    const {'1': 'authors', '3': 7, '4': 3, '5': 9, '8': const {}, '10': 'authors'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `CreateBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBookRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVCb29rUmVxdWVzdBIdCgV0aXRsZRgBIAEoCUIH+kIEcgIQA1IFdGl0bGUSJQoLZGVzY3JpcHRpb24YAiABKAlIAFILZGVzY3JpcHRpb26IAQESMgoFcHJpY2UYAyABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSBXByaWNlEiYKBXN0b2NrGAQgASgFQhD6QgQaAigA+kIGGgQQoI0GUgVzdG9jaxI0CgZ3ZWlnaHQYBSABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSBndlaWdodBIgCgZnZW5yZXMYBiADKAlCCPpCBZIBAggBUgZnZW5yZXMSIgoHYXV0aG9ycxgHIAMoCUII+kIFkgECCAFSB2F1dGhvcnNCDgoMX2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use getBookRequestDescriptor instead')
const GetBookRequest$json = const {
  '1': 'GetBookRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '8': const {}, '10': 'id'},
  ],
};

/// Descriptor for `GetBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBookRequestDescriptor = $convert.base64Decode('Cg5HZXRCb29rUmVxdWVzdBIXCgJpZBgBIAEoA0IH+kIEIgIgAFICaWQ=');
@$core.Deprecated('Use listBookRequestDescriptor instead')
const ListBookRequest$json = const {
  '1': 'ListBookRequest',
  '2': const [
    const {'1': 'pageID', '3': 1, '4': 1, '5': 5, '8': const {}, '9': 0, '10': 'pageID', '17': true},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '8': const {}, '9': 1, '10': 'pageSize', '17': true},
    const {'1': 'sort', '3': 3, '4': 1, '5': 9, '8': const {}, '9': 2, '10': 'sort', '17': true},
    const {'1': 'minPrice', '3': 4, '4': 1, '5': 1, '8': const {}, '9': 3, '10': 'minPrice', '17': true},
    const {'1': 'maxPrice', '3': 5, '4': 1, '5': 1, '8': const {}, '9': 4, '10': 'maxPrice', '17': true},
    const {'1': 'minRating', '3': 6, '4': 1, '5': 5, '8': const {}, '9': 5, '10': 'minRating', '17': true},
    const {'1': 'maxRating', '3': 7, '4': 1, '5': 5, '8': const {}, '9': 6, '10': 'maxRating', '17': true},
  ],
  '8': const [
    const {'1': '_pageID'},
    const {'1': '_pageSize'},
    const {'1': '_sort'},
    const {'1': '_minPrice'},
    const {'1': '_maxPrice'},
    const {'1': '_minRating'},
    const {'1': '_maxRating'},
  ],
};

/// Descriptor for `ListBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBookRequestDescriptor = $convert.base64Decode('Cg9MaXN0Qm9va1JlcXVlc3QSKwoGcGFnZUlEGAEgASgFQg76QgQaAigB+kIEGgJAAUgAUgZwYWdlSUSIAQESNgoIcGFnZVNpemUYAiABKAVCFfpCBBoCKAr6QgQaAhgo+kIEGgJAAUgBUghwYWdlU2l6ZYgBARJuCgRzb3J0GAMgASgJQlX6QlJyUFIGbGF0ZXN0Ugdwb3B1bGFyUg1oaWdoZXN0X3ByaWNlUgxsb3dlc3RfcHJpY2VSDmhpZ2hlc3RfcmF0aW5nUg1sb3dlc3RfcmF0aW5n0AEBSAJSBHNvcnSIAQESRAoIbWluUHJpY2UYBCABKAFCI/pCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkL6QgQSAkABSANSCG1pblByaWNliAEBEkQKCG1heFByaWNlGAUgASgBQiP6QgsSCSkAAAAAAAAAAPpCCxIJEQAAACBfoAJC+kIEEgJAAUgEUghtYXhQcmljZYgBARI4CgltaW5SYXRpbmcYBiABKAVCFfpCBBoCKAD6QgQaAhgK+kIEGgJAAUgFUgltaW5SYXRpbmeIAQESOAoJbWF4UmF0aW5nGAcgASgFQhX6QgQaAigA+kIEGgIYCvpCBBoCQAFIBlIJbWF4UmF0aW5niAEBQgkKB19wYWdlSURCCwoJX3BhZ2VTaXplQgcKBV9zb3J0QgsKCV9taW5QcmljZUILCglfbWF4UHJpY2VCDAoKX21pblJhdGluZ0IMCgpfbWF4UmF0aW5n');
@$core.Deprecated('Use deleteBookRequestDescriptor instead')
const DeleteBookRequest$json = const {
  '1': 'DeleteBookRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '8': const {}, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBookRequestDescriptor = $convert.base64Decode('ChFEZWxldGVCb29rUmVxdWVzdBImCgNpZHMYASADKANCFPpCCZIBBiIEIgIoAfpCBZIBAggBUgNpZHM=');

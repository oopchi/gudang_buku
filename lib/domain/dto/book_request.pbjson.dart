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
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.CreateBookContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreateBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBookRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVCb29rUmVxdWVzdBIxCgdjb250ZW50GAEgASgLMhUucGIuQ3JlYXRlQm9va0NvbnRlbnRIAFIHY29udGVudBItCglpbWFnZURhdGEYAiABKAsyDS5wYi5JbWFnZURhdGFIAFIJaW1hZ2VEYXRhOgOAQwFCBgoEZGF0YQ==');
@$core.Deprecated('Use createBookContentDescriptor instead')
const CreateBookContent$json = const {
  '1': 'CreateBookContent',
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

/// Descriptor for `CreateBookContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBookContentDescriptor = $convert.base64Decode('ChFDcmVhdGVCb29rQ29udGVudBIdCgV0aXRsZRgBIAEoCUIH+kIEcgIQA1IFdGl0bGUSJQoLZGVzY3JpcHRpb24YAiABKAlIAFILZGVzY3JpcHRpb26IAQESMgoFcHJpY2UYAyABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSBXByaWNlEiYKBXN0b2NrGAQgASgFQhD6QgQaAigA+kIGGgQQoI0GUgVzdG9jaxI0CgZ3ZWlnaHQYBSABKAFCHPpCCxIJKQAAAAAAAAAA+kILEgkRAAAAIF+gAkJSBndlaWdodBIgCgZnZW5yZXMYBiADKAlCCPpCBZIBAggBUgZnZW5yZXMSIgoHYXV0aG9ycxgHIAMoCUII+kIFkgECCAFSB2F1dGhvcnNCDgoMX2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use getBookRequestDescriptor instead')
const GetBookRequest$json = const {
  '1': 'GetBookRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '8': const {}, '10': 'id'},
  ],
};

/// Descriptor for `GetBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBookRequestDescriptor = $convert.base64Decode('Cg5HZXRCb29rUmVxdWVzdBIXCgJpZBgBIAEoA0IH+kIEIgIgAFICaWQ=');
@$core.Deprecated('Use addUserFavoriteBookRequestDescriptor instead')
const AddUserFavoriteBookRequest$json = const {
  '1': 'AddUserFavoriteBookRequest',
  '2': const [
    const {'1': 'bookID', '3': 1, '4': 1, '5': 3, '8': const {}, '10': 'bookID'},
  ],
};

/// Descriptor for `AddUserFavoriteBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserFavoriteBookRequestDescriptor = $convert.base64Decode('ChpBZGRVc2VyRmF2b3JpdGVCb29rUmVxdWVzdBIfCgZib29rSUQYASABKANCB/pCBCICIABSBmJvb2tJRA==');
@$core.Deprecated('Use deleteUserFavoriteBookRequestDescriptor instead')
const DeleteUserFavoriteBookRequest$json = const {
  '1': 'DeleteUserFavoriteBookRequest',
  '2': const [
    const {'1': 'bookID', '3': 1, '4': 1, '5': 3, '8': const {}, '10': 'bookID'},
  ],
};

/// Descriptor for `DeleteUserFavoriteBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserFavoriteBookRequestDescriptor = $convert.base64Decode('Ch1EZWxldGVVc2VyRmF2b3JpdGVCb29rUmVxdWVzdBIfCgZib29rSUQYASABKANCB/pCBCICIABSBmJvb2tJRA==');
@$core.Deprecated('Use listUserFavoriteBooksRequestDescriptor instead')
const ListUserFavoriteBooksRequest$json = const {
  '1': 'ListUserFavoriteBooksRequest',
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

/// Descriptor for `ListUserFavoriteBooksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUserFavoriteBooksRequestDescriptor = $convert.base64Decode('ChxMaXN0VXNlckZhdm9yaXRlQm9va3NSZXF1ZXN0EisKBnBhZ2VJRBgBIAEoBUIO+kIEGgIoAfpCBBoCQAFIAFIGcGFnZUlEiAEBEjYKCHBhZ2VTaXplGAIgASgFQhX6QgQaAigK+kIEGgIYKPpCBBoCQAFIAVIIcGFnZVNpemWIAQESbgoEc29ydBgDIAEoCUJV+kJSclBSBmxhdGVzdFIHcG9wdWxhclINaGlnaGVzdF9wcmljZVIMbG93ZXN0X3ByaWNlUg5oaWdoZXN0X3JhdGluZ1INbG93ZXN0X3JhdGluZ9ABAUgCUgRzb3J0iAEBEkQKCG1pblByaWNlGAQgASgBQiP6QgsSCSkAAAAAAAAAAPpCCxIJEQAAACBfoAJC+kIEEgJAAUgDUghtaW5QcmljZYgBARJECghtYXhQcmljZRgFIAEoAUIj+kILEgkpAAAAAAAAAAD6QgsSCREAAAAgX6ACQvpCBBICQAFIBFIIbWF4UHJpY2WIAQESOAoJbWluUmF0aW5nGAYgASgFQhX6QgQaAigA+kIEGgIYCvpCBBoCQAFIBVIJbWluUmF0aW5niAEBEjgKCW1heFJhdGluZxgHIAEoBUIV+kIEGgIoAPpCBBoCGAr6QgQaAkABSAZSCW1heFJhdGluZ4gBAUIJCgdfcGFnZUlEQgsKCV9wYWdlU2l6ZUIHCgVfc29ydEILCglfbWluUHJpY2VCCwoJX21heFByaWNlQgwKCl9taW5SYXRpbmdCDAoKX21heFJhdGluZw==');
@$core.Deprecated('Use listBooksRequestDescriptor instead')
const ListBooksRequest$json = const {
  '1': 'ListBooksRequest',
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

/// Descriptor for `ListBooksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBooksRequestDescriptor = $convert.base64Decode('ChBMaXN0Qm9va3NSZXF1ZXN0EisKBnBhZ2VJRBgBIAEoBUIO+kIEGgIoAfpCBBoCQAFIAFIGcGFnZUlEiAEBEjYKCHBhZ2VTaXplGAIgASgFQhX6QgQaAigK+kIEGgIYKPpCBBoCQAFIAVIIcGFnZVNpemWIAQESbgoEc29ydBgDIAEoCUJV+kJSclBSBmxhdGVzdFIHcG9wdWxhclINaGlnaGVzdF9wcmljZVIMbG93ZXN0X3ByaWNlUg5oaWdoZXN0X3JhdGluZ1INbG93ZXN0X3JhdGluZ9ABAUgCUgRzb3J0iAEBEkQKCG1pblByaWNlGAQgASgBQiP6QgsSCSkAAAAAAAAAAPpCCxIJEQAAACBfoAJC+kIEEgJAAUgDUghtaW5QcmljZYgBARJECghtYXhQcmljZRgFIAEoAUIj+kILEgkpAAAAAAAAAAD6QgsSCREAAAAgX6ACQvpCBBICQAFIBFIIbWF4UHJpY2WIAQESOAoJbWluUmF0aW5nGAYgASgFQhX6QgQaAigA+kIEGgIYCvpCBBoCQAFIBVIJbWluUmF0aW5niAEBEjgKCW1heFJhdGluZxgHIAEoBUIV+kIEGgIoAPpCBBoCGAr6QgQaAkABSAZSCW1heFJhdGluZ4gBAUIJCgdfcGFnZUlEQgsKCV9wYWdlU2l6ZUIHCgVfc29ydEILCglfbWluUHJpY2VCCwoJX21heFByaWNlQgwKCl9taW5SYXRpbmdCDAoKX21heFJhdGluZw==');
@$core.Deprecated('Use deleteBooksRequestDescriptor instead')
const DeleteBooksRequest$json = const {
  '1': 'DeleteBooksRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '8': const {}, '10': 'ids'},
  ],
};

/// Descriptor for `DeleteBooksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBooksRequestDescriptor = $convert.base64Decode('ChJEZWxldGVCb29rc1JlcXVlc3QSJgoDaWRzGAEgAygDQhT6QgmSAQYiBCICKAH6QgWSAQIIAVIDaWRz');

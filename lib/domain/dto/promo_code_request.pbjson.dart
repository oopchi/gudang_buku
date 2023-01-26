///
//  Generated code. Do not modify.
//  source: promo_code_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listOngoingPromoCodesRequestDescriptor instead')
const ListOngoingPromoCodesRequest$json = const {
  '1': 'ListOngoingPromoCodesRequest',
  '2': const [
    const {'1': 'pageID', '3': 1, '4': 1, '5': 5, '8': const {}, '9': 0, '10': 'pageID', '17': true},
    const {'1': 'pageSize', '3': 2, '4': 1, '5': 5, '8': const {}, '9': 1, '10': 'pageSize', '17': true},
  ],
  '8': const [
    const {'1': '_pageID'},
    const {'1': '_pageSize'},
  ],
};

/// Descriptor for `ListOngoingPromoCodesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOngoingPromoCodesRequestDescriptor = $convert.base64Decode('ChxMaXN0T25nb2luZ1Byb21vQ29kZXNSZXF1ZXN0EisKBnBhZ2VJRBgBIAEoBUIO+kIEGgIoAfpCBBoCQAFIAFIGcGFnZUlEiAEBEjYKCHBhZ2VTaXplGAIgASgFQhX6QgQaAigK+kIEGgIYKPpCBBoCQAFIAVIIcGFnZVNpemWIAQFCCQoHX3BhZ2VJREILCglfcGFnZVNpemU=');
@$core.Deprecated('Use deletePromoCodesRequestDescriptor instead')
const DeletePromoCodesRequest$json = const {
  '1': 'DeletePromoCodesRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '8': const {}, '10': 'ids'},
  ],
};

/// Descriptor for `DeletePromoCodesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromoCodesRequestDescriptor = $convert.base64Decode('ChdEZWxldGVQcm9tb0NvZGVzUmVxdWVzdBImCgNpZHMYASADKANCFPpCCZIBBiIEIgIoAfpCBZIBAggBUgNpZHM=');
@$core.Deprecated('Use createPromoCodeRequestDescriptor instead')
const CreatePromoCodeRequest$json = const {
  '1': 'CreatePromoCodeRequest',
  '2': const [
    const {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.CreatePromoCodeContent', '9': 0, '10': 'content'},
    const {'1': 'imageData', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageData', '9': 0, '10': 'imageData'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreatePromoCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromoCodeRequestDescriptor = $convert.base64Decode('ChZDcmVhdGVQcm9tb0NvZGVSZXF1ZXN0EhIKBGNvZGUYAyABKAlSBGNvZGUSNgoHY29udGVudBgBIAEoCzIaLnBiLkNyZWF0ZVByb21vQ29kZUNvbnRlbnRIAFIHY29udGVudBItCglpbWFnZURhdGEYAiABKAsyDS5wYi5JbWFnZURhdGFIAFIJaW1hZ2VEYXRhQgYKBGRhdGE=');
@$core.Deprecated('Use createPromoCodeContentDescriptor instead')
const CreatePromoCodeContent$json = const {
  '1': 'CreatePromoCodeContent',
  '2': const [
    const {'1': 'discountAmount', '3': 2, '4': 1, '5': 1, '8': const {}, '10': 'discountAmount'},
    const {'1': 'discountType', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'expirationDate', '17': true},
    const {'1': 'minimumPurchaseAmount', '3': 5, '4': 1, '5': 1, '8': const {}, '9': 1, '10': 'minimumPurchaseAmount', '17': true},
    const {'1': 'maximumDiscountAmount', '3': 6, '4': 1, '5': 1, '8': const {}, '9': 2, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'numOfUse', '3': 7, '4': 1, '5': 5, '8': const {}, '10': 'numOfUse'},
    const {'1': 'promoClassID', '3': 1, '4': 1, '5': 3, '8': const {}, '10': 'promoClassID'},
  ],
  '8': const [
    const {'1': '_expirationDate'},
    const {'1': '_minimumPurchaseAmount'},
    const {'1': '_maximumDiscountAmount'},
  ],
};

/// Descriptor for `CreatePromoCodeContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromoCodeContentDescriptor = $convert.base64Decode('ChZDcmVhdGVQcm9tb0NvZGVDb250ZW50Ej8KDmRpc2NvdW50QW1vdW50GAIgASgBQhf6QhQSEhEAAAAgX6ACQikAAAAAAAAAAFIOZGlzY291bnRBbW91bnQSPQoMZGlzY291bnRUeXBlGAMgASgJQhn6QhZyFFIGYW1vdW50UgpwZXJjZW50YWdlUgxkaXNjb3VudFR5cGUSRwoOZXhwaXJhdGlvbkRhdGUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSDmV4cGlyYXRpb25EYXRliAEBElQKFW1pbmltdW1QdXJjaGFzZUFtb3VudBgFIAEoAUIZ+kIWEhQRAAAAIF+gAkIpAAAAAAAAAABAAUgBUhVtaW5pbXVtUHVyY2hhc2VBbW91bnSIAQESVAoVbWF4aW11bURpc2NvdW50QW1vdW50GAYgASgBQhn6QhYSFBEAAAAgX6ACQikAAAAAAAAAAEABSAJSFW1heGltdW1EaXNjb3VudEFtb3VudIgBARIjCghudW1PZlVzZRgHIAEoBUIH+kIEGgIoAFIIbnVtT2ZVc2USKwoMcHJvbW9DbGFzc0lEGAEgASgDQgf6QgQiAiAAUgxwcm9tb0NsYXNzSURCEQoPX2V4cGlyYXRpb25EYXRlQhgKFl9taW5pbXVtUHVyY2hhc2VBbW91bnRCGAoWX21heGltdW1EaXNjb3VudEFtb3VudA==');

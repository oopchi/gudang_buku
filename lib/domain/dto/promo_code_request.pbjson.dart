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
@$core.Deprecated('Use deletePromoCodeRequestDescriptor instead')
const DeletePromoCodeRequest$json = const {
  '1': 'DeletePromoCodeRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '8': const {}, '10': 'ids'},
  ],
};

/// Descriptor for `DeletePromoCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromoCodeRequestDescriptor = $convert.base64Decode('ChZEZWxldGVQcm9tb0NvZGVSZXF1ZXN0EiYKA2lkcxgBIAMoA0IU+kIJkgEGIgQiAigB+kIFkgECCAFSA2lkcw==');
@$core.Deprecated('Use createPromoCodeRequestDescriptor instead')
const CreatePromoCodeRequest$json = const {
  '1': 'CreatePromoCodeRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 11, '6': '.pb.CreatePromoCodeContent', '9': 0, '10': 'content'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'chunk'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreatePromoCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromoCodeRequestDescriptor = $convert.base64Decode('ChZDcmVhdGVQcm9tb0NvZGVSZXF1ZXN0EjYKB2NvbnRlbnQYASABKAsyGi5wYi5DcmVhdGVQcm9tb0NvZGVDb250ZW50SABSB2NvbnRlbnQSFgoFY2h1bmsYAiABKAxIAFIFY2h1bmtCBgoEZGF0YQ==');
@$core.Deprecated('Use createPromoCodeContentDescriptor instead')
const CreatePromoCodeContent$json = const {
  '1': 'CreatePromoCodeContent',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'discountAmount', '3': 2, '4': 1, '5': 1, '8': const {}, '10': 'discountAmount'},
    const {'1': 'discountType', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'discountType'},
    const {'1': 'expirationDate', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'expirationDate', '17': true},
    const {'1': 'minimumPurchaseAmount', '3': 5, '4': 1, '5': 1, '8': const {}, '9': 1, '10': 'minimumPurchaseAmount', '17': true},
    const {'1': 'maximumDiscountAmount', '3': 6, '4': 1, '5': 1, '8': const {}, '9': 2, '10': 'maximumDiscountAmount', '17': true},
    const {'1': 'numOfUse', '3': 7, '4': 1, '5': 5, '8': const {}, '10': 'numOfUse'},
    const {'1': 'promoClassID', '3': 8, '4': 1, '5': 3, '8': const {}, '10': 'promoClassID'},
    const {'1': 'imageExtension', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'imageExtension', '17': true},
    const {'1': 'mimeType', '3': 10, '4': 1, '5': 9, '9': 4, '10': 'mimeType', '17': true},
  ],
  '8': const [
    const {'1': '_expirationDate'},
    const {'1': '_minimumPurchaseAmount'},
    const {'1': '_maximumDiscountAmount'},
    const {'1': '_imageExtension'},
    const {'1': '_mimeType'},
  ],
};

/// Descriptor for `CreatePromoCodeContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromoCodeContentDescriptor = $convert.base64Decode('ChZDcmVhdGVQcm9tb0NvZGVDb250ZW50EhIKBGNvZGUYASABKAlSBGNvZGUSPwoOZGlzY291bnRBbW91bnQYAiABKAFCF/pCFBISEQAAACBfoAJCKQAAAAAAAAAAUg5kaXNjb3VudEFtb3VudBI9CgxkaXNjb3VudFR5cGUYAyABKAlCGfpCFnIUUgZhbW91bnRSCnBlcmNlbnRhZ2VSDGRpc2NvdW50VHlwZRJHCg5leHBpcmF0aW9uRGF0ZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFIOZXhwaXJhdGlvbkRhdGWIAQESVAoVbWluaW11bVB1cmNoYXNlQW1vdW50GAUgASgBQhn6QhYSFBEAAAAgX6ACQikAAAAAAAAAAEABSAFSFW1pbmltdW1QdXJjaGFzZUFtb3VudIgBARJUChVtYXhpbXVtRGlzY291bnRBbW91bnQYBiABKAFCGfpCFhIUEQAAACBfoAJCKQAAAAAAAAAAQAFIAlIVbWF4aW11bURpc2NvdW50QW1vdW50iAEBEiMKCG51bU9mVXNlGAcgASgFQgf6QgQaAigAUghudW1PZlVzZRIrCgxwcm9tb0NsYXNzSUQYCCABKANCB/pCBCICIABSDHByb21vQ2xhc3NJRBIrCg5pbWFnZUV4dGVuc2lvbhgJIAEoCUgDUg5pbWFnZUV4dGVuc2lvbogBARIfCghtaW1lVHlwZRgKIAEoCUgEUghtaW1lVHlwZYgBAUIRCg9fZXhwaXJhdGlvbkRhdGVCGAoWX21pbmltdW1QdXJjaGFzZUFtb3VudEIYChZfbWF4aW11bURpc2NvdW50QW1vdW50QhEKD19pbWFnZUV4dGVuc2lvbkILCglfbWltZVR5cGU=');

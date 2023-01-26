///
//  Generated code. Do not modify.
//  source: image_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

enum ImageData_Data {
  metaData, 
  chunk, 
  notSet
}

class ImageData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ImageData_Data> _ImageData_DataByTag = {
    1 : ImageData_Data.metaData,
    2 : ImageData_Data.chunk,
    0 : ImageData_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ImageMetaData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metaData', protoName: 'metaData', subBuilder: ImageMetaData.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageID', protoName: 'imageID')
    ..hasRequiredFields = false
  ;

  ImageData._() : super();
  factory ImageData({
    ImageMetaData? metaData,
    $core.List<$core.int>? chunk,
    $fixnum.Int64? imageID,
  }) {
    final _result = create();
    if (metaData != null) {
      _result.metaData = metaData;
    }
    if (chunk != null) {
      _result.chunk = chunk;
    }
    if (imageID != null) {
      _result.imageID = imageID;
    }
    return _result;
  }
  factory ImageData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageData clone() => ImageData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageData copyWith(void Function(ImageData) updates) => super.copyWith((message) => updates(message as ImageData)) as ImageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageData create() => ImageData._();
  ImageData createEmptyInstance() => create();
  static $pb.PbList<ImageData> createRepeated() => $pb.PbList<ImageData>();
  @$core.pragma('dart2js:noInline')
  static ImageData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageData>(create);
  static ImageData? _defaultInstance;

  ImageData_Data whichData() => _ImageData_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ImageMetaData get metaData => $_getN(0);
  @$pb.TagNumber(1)
  set metaData(ImageMetaData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetaData() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetaData() => clearField(1);
  @$pb.TagNumber(1)
  ImageMetaData ensureMetaData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get imageID => $_getI64(2);
  @$pb.TagNumber(3)
  set imageID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageID() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageID() => clearField(3);
}

class ImageMetaData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageMetaData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageExtension', protoName: 'imageExtension')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mimeType', protoName: 'mimeType')
    ..hasRequiredFields = false
  ;

  ImageMetaData._() : super();
  factory ImageMetaData({
    $core.String? imageExtension,
    $core.String? mimeType,
  }) {
    final _result = create();
    if (imageExtension != null) {
      _result.imageExtension = imageExtension;
    }
    if (mimeType != null) {
      _result.mimeType = mimeType;
    }
    return _result;
  }
  factory ImageMetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageMetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageMetaData clone() => ImageMetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageMetaData copyWith(void Function(ImageMetaData) updates) => super.copyWith((message) => updates(message as ImageMetaData)) as ImageMetaData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageMetaData create() => ImageMetaData._();
  ImageMetaData createEmptyInstance() => create();
  static $pb.PbList<ImageMetaData> createRepeated() => $pb.PbList<ImageMetaData>();
  @$core.pragma('dart2js:noInline')
  static ImageMetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageMetaData>(create);
  static ImageMetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageExtension => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageExtension($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageExtension() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageExtension() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mimeType => $_getSZ(1);
  @$pb.TagNumber(2)
  set mimeType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMimeType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMimeType() => clearField(2);
}


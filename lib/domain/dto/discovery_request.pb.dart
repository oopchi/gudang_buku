///
//  Generated code. Do not modify.
//  source: discovery_request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'image_data.pb.dart' as $13;

enum CreateDiscoveryRequest_Data {
  content, 
  imageData, 
  notSet
}

class CreateDiscoveryRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateDiscoveryRequest_Data> _CreateDiscoveryRequest_DataByTag = {
    1 : CreateDiscoveryRequest_Data.content,
    2 : CreateDiscoveryRequest_Data.imageData,
    0 : CreateDiscoveryRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDiscoveryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<CreateDiscoveryContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: CreateDiscoveryContent.create)
    ..aOM<$13.ImageData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageData', protoName: 'imageData', subBuilder: $13.ImageData.create)
    ..hasRequiredFields = false
  ;

  CreateDiscoveryRequest._() : super();
  factory CreateDiscoveryRequest({
    CreateDiscoveryContent? content,
    $13.ImageData? imageData,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (imageData != null) {
      _result.imageData = imageData;
    }
    return _result;
  }
  factory CreateDiscoveryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDiscoveryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDiscoveryRequest clone() => CreateDiscoveryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDiscoveryRequest copyWith(void Function(CreateDiscoveryRequest) updates) => super.copyWith((message) => updates(message as CreateDiscoveryRequest)) as CreateDiscoveryRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDiscoveryRequest create() => CreateDiscoveryRequest._();
  CreateDiscoveryRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDiscoveryRequest> createRepeated() => $pb.PbList<CreateDiscoveryRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDiscoveryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDiscoveryRequest>(create);
  static CreateDiscoveryRequest? _defaultInstance;

  CreateDiscoveryRequest_Data whichData() => _CreateDiscoveryRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CreateDiscoveryContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(CreateDiscoveryContent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
  @$pb.TagNumber(1)
  CreateDiscoveryContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  $13.ImageData get imageData => $_getN(1);
  @$pb.TagNumber(2)
  set imageData($13.ImageData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageData() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageData() => clearField(2);
  @$pb.TagNumber(2)
  $13.ImageData ensureImageData() => $_ensure(1);
}

class CreateDiscoveryContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDiscoveryContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayOrder', $pb.PbFieldType.O3, protoName: 'displayOrder')
    ..p<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookIDs', $pb.PbFieldType.K6, protoName: 'bookIDs')
    ..hasRequiredFields = false
  ;

  CreateDiscoveryContent._() : super();
  factory CreateDiscoveryContent({
    $core.int? displayOrder,
    $core.Iterable<$fixnum.Int64>? bookIDs,
  }) {
    final _result = create();
    if (displayOrder != null) {
      _result.displayOrder = displayOrder;
    }
    if (bookIDs != null) {
      _result.bookIDs.addAll(bookIDs);
    }
    return _result;
  }
  factory CreateDiscoveryContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDiscoveryContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDiscoveryContent clone() => CreateDiscoveryContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDiscoveryContent copyWith(void Function(CreateDiscoveryContent) updates) => super.copyWith((message) => updates(message as CreateDiscoveryContent)) as CreateDiscoveryContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDiscoveryContent create() => CreateDiscoveryContent._();
  CreateDiscoveryContent createEmptyInstance() => create();
  static $pb.PbList<CreateDiscoveryContent> createRepeated() => $pb.PbList<CreateDiscoveryContent>();
  @$core.pragma('dart2js:noInline')
  static CreateDiscoveryContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDiscoveryContent>(create);
  static CreateDiscoveryContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get displayOrder => $_getIZ(0);
  @$pb.TagNumber(1)
  set displayOrder($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisplayOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplayOrder() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get bookIDs => $_getList(1);
}

class ListDiscoveryRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListDiscoveryRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListDiscoveryRequest._() : super();
  factory ListDiscoveryRequest() => create();
  factory ListDiscoveryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListDiscoveryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListDiscoveryRequest clone() => ListDiscoveryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListDiscoveryRequest copyWith(void Function(ListDiscoveryRequest) updates) => super.copyWith((message) => updates(message as ListDiscoveryRequest)) as ListDiscoveryRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListDiscoveryRequest create() => ListDiscoveryRequest._();
  ListDiscoveryRequest createEmptyInstance() => create();
  static $pb.PbList<ListDiscoveryRequest> createRepeated() => $pb.PbList<ListDiscoveryRequest>();
  @$core.pragma('dart2js:noInline')
  static ListDiscoveryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListDiscoveryRequest>(create);
  static ListDiscoveryRequest? _defaultInstance;
}


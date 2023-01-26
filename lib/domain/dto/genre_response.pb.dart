///
//  Generated code. Do not modify.
//  source: genre_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $12;

class GenreResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenreResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<$12.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $12.Timestamp.create)
    ..aOM<$12.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', protoName: 'updatedAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  GenreResponse._() : super();
  factory GenreResponse({
    $fixnum.Int64? id,
    $core.String? name,
    $12.Timestamp? createdAt,
    $12.Timestamp? updatedAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    return _result;
  }
  factory GenreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenreResponse clone() => GenreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenreResponse copyWith(void Function(GenreResponse) updates) => super.copyWith((message) => updates(message as GenreResponse)) as GenreResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenreResponse create() => GenreResponse._();
  GenreResponse createEmptyInstance() => create();
  static $pb.PbList<GenreResponse> createRepeated() => $pb.PbList<GenreResponse>();
  @$core.pragma('dart2js:noInline')
  static GenreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenreResponse>(create);
  static GenreResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $12.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($12.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $12.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $12.Timestamp get updatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set updatedAt($12.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $12.Timestamp ensureUpdatedAt() => $_ensure(3);
}

class ListGenreResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListGenreResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<GenreResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors', $pb.PbFieldType.PM, subBuilder: GenreResponse.create)
    ..hasRequiredFields = false
  ;

  ListGenreResponse._() : super();
  factory ListGenreResponse({
    $core.Iterable<GenreResponse>? authors,
  }) {
    final _result = create();
    if (authors != null) {
      _result.authors.addAll(authors);
    }
    return _result;
  }
  factory ListGenreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListGenreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListGenreResponse clone() => ListGenreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListGenreResponse copyWith(void Function(ListGenreResponse) updates) => super.copyWith((message) => updates(message as ListGenreResponse)) as ListGenreResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListGenreResponse create() => ListGenreResponse._();
  ListGenreResponse createEmptyInstance() => create();
  static $pb.PbList<ListGenreResponse> createRepeated() => $pb.PbList<ListGenreResponse>();
  @$core.pragma('dart2js:noInline')
  static ListGenreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListGenreResponse>(create);
  static ListGenreResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GenreResponse> get authors => $_getList(0);
}


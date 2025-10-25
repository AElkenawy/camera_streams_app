///
//  Generated code. Do not modify.
//  source: coordinator.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ModelListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModelListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..pc<Model>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'availableModels', $pb.PbFieldType.PM, subBuilder: Model.create)
    ..hasRequiredFields = false
  ;

  ModelListRequest._() : super();
  factory ModelListRequest({
    $core.Iterable<Model>? availableModels,
  }) {
    final _result = create();
    if (availableModels != null) {
      _result.availableModels.addAll(availableModels);
    }
    return _result;
  }
  factory ModelListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelListRequest clone() => ModelListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelListRequest copyWith(void Function(ModelListRequest) updates) => super.copyWith((message) => updates(message as ModelListRequest)) as ModelListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModelListRequest create() => ModelListRequest._();
  ModelListRequest createEmptyInstance() => create();
  static $pb.PbList<ModelListRequest> createRepeated() => $pb.PbList<ModelListRequest>();
  @$core.pragma('dart2js:noInline')
  static ModelListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelListRequest>(create);
  static ModelListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Model> get availableModels => $_getList(0);
}

class ModelListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModelListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlId', $pb.PbFieldType.OU3)
    ..aOM<Model>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedModel', subBuilder: Model.create)
    ..hasRequiredFields = false
  ;

  ModelListResponse._() : super();
  factory ModelListResponse({
    $core.bool? success,
    $core.int? controlId,
    Model? selectedModel,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (controlId != null) {
      _result.controlId = controlId;
    }
    if (selectedModel != null) {
      _result.selectedModel = selectedModel;
    }
    return _result;
  }
  factory ModelListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelListResponse clone() => ModelListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelListResponse copyWith(void Function(ModelListResponse) updates) => super.copyWith((message) => updates(message as ModelListResponse)) as ModelListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModelListResponse create() => ModelListResponse._();
  ModelListResponse createEmptyInstance() => create();
  static $pb.PbList<ModelListResponse> createRepeated() => $pb.PbList<ModelListResponse>();
  @$core.pragma('dart2js:noInline')
  static ModelListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelListResponse>(create);
  static ModelListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get controlId => $_getIZ(1);
  @$pb.TagNumber(2)
  set controlId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasControlId() => $_has(1);
  @$pb.TagNumber(2)
  void clearControlId() => clearField(2);

  @$pb.TagNumber(3)
  Model get selectedModel => $_getN(2);
  @$pb.TagNumber(3)
  set selectedModel(Model v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSelectedModel() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelectedModel() => clearField(3);
  @$pb.TagNumber(3)
  Model ensureSelectedModel() => $_ensure(2);
}

class Model extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Model', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modelName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modelVersion')
    ..hasRequiredFields = false
  ;

  Model._() : super();
  factory Model({
    $core.String? modelName,
    $core.String? modelVersion,
  }) {
    final _result = create();
    if (modelName != null) {
      _result.modelName = modelName;
    }
    if (modelVersion != null) {
      _result.modelVersion = modelVersion;
    }
    return _result;
  }
  factory Model.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Model.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Model clone() => Model()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Model copyWith(void Function(Model) updates) => super.copyWith((message) => updates(message as Model)) as Model; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Model create() => Model._();
  Model createEmptyInstance() => create();
  static $pb.PbList<Model> createRepeated() => $pb.PbList<Model>();
  @$core.pragma('dart2js:noInline')
  static Model getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Model>(create);
  static Model? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get modelName => $_getSZ(0);
  @$pb.TagNumber(1)
  set modelName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModelName() => $_has(0);
  @$pb.TagNumber(1)
  void clearModelName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get modelVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set modelVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasModelVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearModelVersion() => clearField(2);
}

class ConnectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOM<Model>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selectedModel', subBuilder: Model.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ConnectRequest._() : super();
  factory ConnectRequest({
    Model? selectedModel,
    $core.int? controlId,
  }) {
    final _result = create();
    if (selectedModel != null) {
      _result.selectedModel = selectedModel;
    }
    if (controlId != null) {
      _result.controlId = controlId;
    }
    return _result;
  }
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest)) as ConnectRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Model get selectedModel => $_getN(0);
  @$pb.TagNumber(1)
  set selectedModel(Model v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelectedModel() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelectedModel() => clearField(1);
  @$pb.TagNumber(1)
  Model ensureSelectedModel() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get controlId => $_getIZ(1);
  @$pb.TagNumber(2)
  set controlId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasControlId() => $_has(1);
  @$pb.TagNumber(2)
  void clearControlId() => clearField(2);
}

class ConnectResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accepted')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errorMsg')
    ..hasRequiredFields = false
  ;

  ConnectResponse._() : super();
  factory ConnectResponse({
    $core.bool? accepted,
    $core.String? errorMsg,
  }) {
    final _result = create();
    if (accepted != null) {
      _result.accepted = accepted;
    }
    if (errorMsg != null) {
      _result.errorMsg = errorMsg;
    }
    return _result;
  }
  factory ConnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectResponse clone() => ConnectResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectResponse copyWith(void Function(ConnectResponse) updates) => super.copyWith((message) => updates(message as ConnectResponse)) as ConnectResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectResponse create() => ConnectResponse._();
  ConnectResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectResponse> createRepeated() => $pb.PbList<ConnectResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectResponse>(create);
  static ConnectResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMsg() => clearField(2);
}

class Detection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Detection', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'class')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId', $pb.PbFieldType.O3)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confidence', $pb.PbFieldType.OF)
    ..aOM<BoundBox>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bbox', subBuilder: BoundBox.create)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tsMicros', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Detection._() : super();
  factory Detection({
    $core.String? class_1,
    $core.int? classId,
    $core.double? confidence,
    BoundBox? bbox,
    $fixnum.Int64? tsMicros,
  }) {
    final _result = create();
    if (class_1 != null) {
      _result.class_1 = class_1;
    }
    if (classId != null) {
      _result.classId = classId;
    }
    if (confidence != null) {
      _result.confidence = confidence;
    }
    if (bbox != null) {
      _result.bbox = bbox;
    }
    if (tsMicros != null) {
      _result.tsMicros = tsMicros;
    }
    return _result;
  }
  factory Detection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Detection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Detection clone() => Detection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Detection copyWith(void Function(Detection) updates) => super.copyWith((message) => updates(message as Detection)) as Detection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Detection create() => Detection._();
  Detection createEmptyInstance() => create();
  static $pb.PbList<Detection> createRepeated() => $pb.PbList<Detection>();
  @$core.pragma('dart2js:noInline')
  static Detection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Detection>(create);
  static Detection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get class_1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set class_1($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClass_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearClass_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get classId => $_getIZ(1);
  @$pb.TagNumber(2)
  set classId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get confidence => $_getN(2);
  @$pb.TagNumber(3)
  set confidence($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConfidence() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfidence() => clearField(3);

  @$pb.TagNumber(4)
  BoundBox get bbox => $_getN(3);
  @$pb.TagNumber(4)
  set bbox(BoundBox v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBbox() => $_has(3);
  @$pb.TagNumber(4)
  void clearBbox() => clearField(4);
  @$pb.TagNumber(4)
  BoundBox ensureBbox() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get tsMicros => $_getI64(4);
  @$pb.TagNumber(5)
  set tsMicros($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTsMicros() => $_has(4);
  @$pb.TagNumber(5)
  void clearTsMicros() => clearField(5);
}

class BoundBox extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BoundBox', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  BoundBox._() : super();
  factory BoundBox({
    $core.int? x,
    $core.int? y,
    $core.int? width,
    $core.int? height,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory BoundBox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoundBox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoundBox clone() => BoundBox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoundBox copyWith(void Function(BoundBox) updates) => super.copyWith((message) => updates(message as BoundBox)) as BoundBox; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BoundBox create() => BoundBox._();
  BoundBox createEmptyInstance() => create();
  static $pb.PbList<BoundBox> createRepeated() => $pb.PbList<BoundBox>();
  @$core.pragma('dart2js:noInline')
  static BoundBox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoundBox>(create);
  static BoundBox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);
}

class Ack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Ack', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  Ack._() : super();
  factory Ack({
    $core.bool? success,
    $core.String? message,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Ack.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ack.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ack clone() => Ack()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ack copyWith(void Function(Ack) updates) => super.copyWith((message) => updates(message as Ack)) as Ack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ack create() => Ack._();
  Ack createEmptyInstance() => create();
  static $pb.PbList<Ack> createRepeated() => $pb.PbList<Ack>();
  @$core.pragma('dart2js:noInline')
  static Ack getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ack>(create);
  static Ack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class HeartBeat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HeartBeat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'coordinator'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlId', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tsMicros', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  HeartBeat._() : super();
  factory HeartBeat({
    $core.int? controlId,
    $fixnum.Int64? tsMicros,
  }) {
    final _result = create();
    if (controlId != null) {
      _result.controlId = controlId;
    }
    if (tsMicros != null) {
      _result.tsMicros = tsMicros;
    }
    return _result;
  }
  factory HeartBeat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HeartBeat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HeartBeat clone() => HeartBeat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HeartBeat copyWith(void Function(HeartBeat) updates) => super.copyWith((message) => updates(message as HeartBeat)) as HeartBeat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HeartBeat create() => HeartBeat._();
  HeartBeat createEmptyInstance() => create();
  static $pb.PbList<HeartBeat> createRepeated() => $pb.PbList<HeartBeat>();
  @$core.pragma('dart2js:noInline')
  static HeartBeat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HeartBeat>(create);
  static HeartBeat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get controlId => $_getIZ(0);
  @$pb.TagNumber(1)
  set controlId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasControlId() => $_has(0);
  @$pb.TagNumber(1)
  void clearControlId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get tsMicros => $_getI64(1);
  @$pb.TagNumber(2)
  set tsMicros($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTsMicros() => $_has(1);
  @$pb.TagNumber(2)
  void clearTsMicros() => clearField(2);
}


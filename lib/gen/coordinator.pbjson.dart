///
//  Generated code. Do not modify.
//  source: coordinator.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use modelListRequestDescriptor instead')
const ModelListRequest$json = const {
  '1': 'ModelListRequest',
  '2': const [
    const {'1': 'available_models', '3': 1, '4': 3, '5': 11, '6': '.coordinator.Model', '10': 'availableModels'},
  ],
};

/// Descriptor for `ModelListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelListRequestDescriptor = $convert.base64Decode('ChBNb2RlbExpc3RSZXF1ZXN0Ej0KEGF2YWlsYWJsZV9tb2RlbHMYASADKAsyEi5jb29yZGluYXRvci5Nb2RlbFIPYXZhaWxhYmxlTW9kZWxz');
@$core.Deprecated('Use modelListResponseDescriptor instead')
const ModelListResponse$json = const {
  '1': 'ModelListResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'control_id', '3': 2, '4': 1, '5': 13, '10': 'controlId'},
    const {'1': 'selected_model', '3': 3, '4': 1, '5': 11, '6': '.coordinator.Model', '10': 'selectedModel'},
  ],
};

/// Descriptor for `ModelListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelListResponseDescriptor = $convert.base64Decode('ChFNb2RlbExpc3RSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh0KCmNvbnRyb2xfaWQYAiABKA1SCWNvbnRyb2xJZBI5Cg5zZWxlY3RlZF9tb2RlbBgDIAEoCzISLmNvb3JkaW5hdG9yLk1vZGVsUg1zZWxlY3RlZE1vZGVs');
@$core.Deprecated('Use modelDescriptor instead')
const Model$json = const {
  '1': 'Model',
  '2': const [
    const {'1': 'model_name', '3': 1, '4': 1, '5': 9, '10': 'modelName'},
    const {'1': 'model_version', '3': 2, '4': 1, '5': 9, '10': 'modelVersion'},
  ],
};

/// Descriptor for `Model`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelDescriptor = $convert.base64Decode('CgVNb2RlbBIdCgptb2RlbF9uYW1lGAEgASgJUgltb2RlbE5hbWUSIwoNbW9kZWxfdmVyc2lvbhgCIAEoCVIMbW9kZWxWZXJzaW9u');
@$core.Deprecated('Use connectRequestDescriptor instead')
const ConnectRequest$json = const {
  '1': 'ConnectRequest',
  '2': const [
    const {'1': 'selected_model', '3': 1, '4': 1, '5': 11, '6': '.coordinator.Model', '10': 'selectedModel'},
    const {'1': 'control_id', '3': 2, '4': 1, '5': 13, '10': 'controlId'},
  ],
};

/// Descriptor for `ConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectRequestDescriptor = $convert.base64Decode('Cg5Db25uZWN0UmVxdWVzdBI5Cg5zZWxlY3RlZF9tb2RlbBgBIAEoCzISLmNvb3JkaW5hdG9yLk1vZGVsUg1zZWxlY3RlZE1vZGVsEh0KCmNvbnRyb2xfaWQYAiABKA1SCWNvbnRyb2xJZA==');
@$core.Deprecated('Use connectResponseDescriptor instead')
const ConnectResponse$json = const {
  '1': 'ConnectResponse',
  '2': const [
    const {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
    const {'1': 'error_msg', '3': 2, '4': 1, '5': 9, '10': 'errorMsg'},
  ],
};

/// Descriptor for `ConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectResponseDescriptor = $convert.base64Decode('Cg9Db25uZWN0UmVzcG9uc2USGgoIYWNjZXB0ZWQYASABKAhSCGFjY2VwdGVkEhsKCWVycm9yX21zZxgCIAEoCVIIZXJyb3JNc2c=');
@$core.Deprecated('Use detectionDescriptor instead')
const Detection$json = const {
  '1': 'Detection',
  '2': const [
    const {'1': 'class', '3': 1, '4': 1, '5': 9, '10': 'class'},
    const {'1': 'class_id', '3': 2, '4': 1, '5': 5, '10': 'classId'},
    const {'1': 'confidence', '3': 3, '4': 1, '5': 2, '10': 'confidence'},
    const {'1': 'bbox', '3': 4, '4': 1, '5': 11, '6': '.coordinator.BoundBox', '10': 'bbox'},
    const {'1': 'ts_micros', '3': 5, '4': 1, '5': 4, '10': 'tsMicros'},
  ],
};

/// Descriptor for `Detection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detectionDescriptor = $convert.base64Decode('CglEZXRlY3Rpb24SFAoFY2xhc3MYASABKAlSBWNsYXNzEhkKCGNsYXNzX2lkGAIgASgFUgdjbGFzc0lkEh4KCmNvbmZpZGVuY2UYAyABKAJSCmNvbmZpZGVuY2USKQoEYmJveBgEIAEoCzIVLmNvb3JkaW5hdG9yLkJvdW5kQm94UgRiYm94EhsKCXRzX21pY3JvcxgFIAEoBFIIdHNNaWNyb3M=');
@$core.Deprecated('Use boundBoxDescriptor instead')
const BoundBox$json = const {
  '1': 'BoundBox',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    const {'1': 'width', '3': 3, '4': 1, '5': 5, '10': 'width'},
    const {'1': 'height', '3': 4, '4': 1, '5': 5, '10': 'height'},
  ],
};

/// Descriptor for `BoundBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boundBoxDescriptor = $convert.base64Decode('CghCb3VuZEJveBIMCgF4GAEgASgFUgF4EgwKAXkYAiABKAVSAXkSFAoFd2lkdGgYAyABKAVSBXdpZHRoEhYKBmhlaWdodBgEIAEoBVIGaGVpZ2h0');
@$core.Deprecated('Use ackDescriptor instead')
const Ack$json = const {
  '1': 'Ack',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Ack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ackDescriptor = $convert.base64Decode('CgNBY2sSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use heartBeatDescriptor instead')
const HeartBeat$json = const {
  '1': 'HeartBeat',
  '2': const [
    const {'1': 'control_id', '3': 1, '4': 1, '5': 13, '10': 'controlId'},
    const {'1': 'ts_micros', '3': 2, '4': 1, '5': 4, '10': 'tsMicros'},
  ],
};

/// Descriptor for `HeartBeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List heartBeatDescriptor = $convert.base64Decode('CglIZWFydEJlYXQSHQoKY29udHJvbF9pZBgBIAEoDVIJY29udHJvbElkEhsKCXRzX21pY3JvcxgCIAEoBFIIdHNNaWNyb3M=');

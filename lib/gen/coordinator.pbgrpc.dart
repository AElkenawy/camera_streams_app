///
//  Generated code. Do not modify.
//  source: coordinator.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'coordinator.pb.dart' as $0;
export 'coordinator.pb.dart';

class CoordinatorClient extends $grpc.Client {
  static final _$registerModels =
      $grpc.ClientMethod<$0.ModelListRequest, $0.ModelListResponse>(
          '/coordinator.Coordinator/registerModels',
          ($0.ModelListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ModelListResponse.fromBuffer(value));
  static final _$connect =
      $grpc.ClientMethod<$0.ConnectRequest, $0.ConnectResponse>(
          '/coordinator.Coordinator/connect',
          ($0.ConnectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ConnectResponse.fromBuffer(value));
  static final _$streamDetections = $grpc.ClientMethod<$0.Detection, $0.Ack>(
      '/coordinator.Coordinator/streamDetections',
      ($0.Detection value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Ack.fromBuffer(value));
  static final _$ping = $grpc.ClientMethod<$0.HeartBeat, $0.Ack>(
      '/coordinator.Coordinator/ping',
      ($0.HeartBeat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Ack.fromBuffer(value));

  CoordinatorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ModelListResponse> registerModels(
      $0.ModelListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerModels, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConnectResponse> connect($0.ConnectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connect, request, options: options);
  }

  $grpc.ResponseStream<$0.Ack> streamDetections(
      $async.Stream<$0.Detection> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamDetections, request, options: options);
  }

  $grpc.ResponseFuture<$0.Ack> ping($0.HeartBeat request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }
}

abstract class CoordinatorServiceBase extends $grpc.Service {
  $core.String get $name => 'coordinator.Coordinator';

  CoordinatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ModelListRequest, $0.ModelListResponse>(
        'registerModels',
        registerModels_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ModelListRequest.fromBuffer(value),
        ($0.ModelListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConnectRequest, $0.ConnectResponse>(
        'connect',
        connect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConnectRequest.fromBuffer(value),
        ($0.ConnectResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Detection, $0.Ack>(
        'streamDetections',
        streamDetections,
        true,
        true,
        ($core.List<$core.int> value) => $0.Detection.fromBuffer(value),
        ($0.Ack value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HeartBeat, $0.Ack>(
        'ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HeartBeat.fromBuffer(value),
        ($0.Ack value) => value.writeToBuffer()));
  }

  $async.Future<$0.ModelListResponse> registerModels_Pre($grpc.ServiceCall call,
      $async.Future<$0.ModelListRequest> request) async {
    return registerModels(call, await request);
  }

  $async.Future<$0.ConnectResponse> connect_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ConnectRequest> request) async {
    return connect(call, await request);
  }

  $async.Future<$0.Ack> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HeartBeat> request) async {
    return ping(call, await request);
  }

  $async.Future<$0.ModelListResponse> registerModels(
      $grpc.ServiceCall call, $0.ModelListRequest request);
  $async.Future<$0.ConnectResponse> connect(
      $grpc.ServiceCall call, $0.ConnectRequest request);
  $async.Stream<$0.Ack> streamDetections(
      $grpc.ServiceCall call, $async.Stream<$0.Detection> request);
  $async.Future<$0.Ack> ping($grpc.ServiceCall call, $0.HeartBeat request);
}

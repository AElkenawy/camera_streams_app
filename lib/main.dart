import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera_linux/camera_linux.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:grpc/grpc.dart';
import 'package:camera_streams_app/gen/coordinator.pbgrpc.dart';
import 'package:logging/logging.dart';

final _logger = Logger('Main');

// gRPC Coordinator Service Implementation
class FlutterCoordinatorService extends CoordinatorServiceBase {
  final Function(Detection) onDetectionReceived;

  FlutterCoordinatorService({required this.onDetectionReceived});

  @override
  Future<ModelListResponse> registerModels(ServiceCall call, ModelListRequest request) async {
    _logger.info('Received model registration from C++ client');

    // Auto-select first available model
    Model selectedModel = request.availableModels.isNotEmpty
        ? request.availableModels.first
        : Model(modelName: 'default', modelVersion: '1.0');

    _logger.info('Selected: ${selectedModel.modelName} v${selectedModel.modelVersion}');

    return ModelListResponse(
      success: true,
      controlId: 1,
      selectedModel: selectedModel,
    );
  }

  @override
  Future<ConnectResponse> connect(ServiceCall call, ConnectRequest request) async {
    _logger.info('C++ client connected: ${request.selectedModel.modelName}');
    return ConnectResponse(
      accepted: true,
      errorMsg: '',
    );
  }

  @override
  Stream<Ack> streamDetections(ServiceCall call, Stream<Detection> request) async* {
    _logger.info('Detection streaming started');

    await for (Detection detection in request) {
      // Forward detection to Flutter UI
      onDetectionReceived(detection);

      // Send acknowledgment back to C++ client
      yield Ack(
        success: true,
        message: 'continue',
      );
    }
  }

  @override
  Future<Ack> ping(ServiceCall call, HeartBeat request) async {
    return Ack(
      success: true,
      message: 'pong',
    );
  }
}

// Detection data class for UI state
class DetectionInfo {
  final String className;
  final int classId;
  final double confidence;
  final String iconPath;
  final DateTime timestamp;

  DetectionInfo({
    required this.className,
    required this.classId,
    required this.confidence,
    required this.iconPath,
    required this.timestamp,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register the Linux camera plugin
  CameraPlatform.instance = CameraLinux();

  runApp(const CameraLinuxApp());
}

// overall app container
class CameraLinuxApp extends StatelessWidget {
  const CameraLinuxApp({super.key});

  @override
  Widget build(BuildContext context) { // creates app structure
    return MaterialApp(
      title: 'Camera Streams App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  // createState() to connect the widget to its state manager _CameraScreenState
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> _cameras = [];
  CameraController? _controller;
  bool _isInitialized = false;
  String _errorMessage = '';

  // gRPC server variables
  Server? _grpcServer;
  bool _serverRunning = false;

  // Detection display variables
  DetectionInfo? _currentDetection;
  Timer? _detectionTimer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _startGrpcServer();
  }

  Future<void> _initializeCamera() async {
    try {
      // Get available cameras (Camera Discovery)
      _cameras = await CameraPlatform.instance.availableCameras();

      if (_cameras.isEmpty) {
        setState(() { // updates the screen when data changes
          _errorMessage = 'No cameras found';
        });
        return;
      }

      // Initialize the first camera
      await _initializeCameraController(_cameras[0]);
    } catch (e) {
      setState(() {
        _errorMessage = 'Error initializing camera: $e';
      });
    }
  }

  Future<void> _initializeCameraController(CameraDescription camera) async {
    // Cleans up an previous camera connection
    await _controller?.dispose();

    // Create new controller
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _controller!.initialize();

      if (mounted) { //mounted checks if the widget is still visible before updating
        setState(() {
          _isInitialized = true;
          _errorMessage = '';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Camera initialization failed: $e';
        _isInitialized = false;
      });
    }
  }

  Future<void> _startGrpcServer() async {
    try {
      _grpcServer = Server.create(
        services: [
          FlutterCoordinatorService(
            onDetectionReceived: _handleDetection,
          ),
        ],
        codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      );

      await _grpcServer!.serve(port: 50051);

      setState(() {
        _serverRunning = true;
      });

      _logger.info('Flutter gRPC Server started on port 50051');
      _logger.info('Waiting for C++ detection clients...');
    } catch (e) {
      _logger.info('Failed to start gRPC server: $e');
      setState(() {
        _errorMessage = 'gRPC server failed: $e';
      });
    }
  }

  void _handleDetection(Detection detection) {
    if (!mounted) return;

    // Convert detection to UI-friendly format
    DetectionInfo detectionInfo = DetectionInfo(
      className: detection.class_1,
      classId: detection.classId,
      confidence: detection.confidence,
      iconPath: _getIconPathForDetection(detection.classId, detection.class_1),
      timestamp: DateTime.now(),
    );

    setState(() {
      _currentDetection = detectionInfo;
    });

    // Clear detection after 3 seconds
    _detectionTimer?.cancel();
    _detectionTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentDetection = null;
        });
      }
    });

    _logger.info('Detection: ${detection.class_1} (${detection.confidence.toStringAsFixed(2)})');
  }

  String _getIconPathForDetection(int classId, String className) {
    // Map detection class IDs to traffic sign icons
    // This can be expanded based on your available assets
    switch (classId) {
      case 5:
        return 'assets/traffic_signs/5_speed-limit-80km.png';
      case 11:
        return 'assets/traffic_signs/11_right-way-next.png';
      case 13:
        return 'assets/traffic_signs/13_yield.png';
      case 14:
        return 'assets/traffic_signs/14_stop.png';
      case 17:
        return 'assets/traffic_signs/17_no-entry.png';
      case 21:
        return 'assets/traffic_signs/21_double-curve.png';
      case 23:
        return 'assets/traffic_signs/23_slippery-road.png';
      case 27:
        return 'assets/traffic_signs/27_pedestrians.png';
      case 29:
        return 'assets/traffic_signs/29_bicycles-crossing.png';
      case 31:
        return 'assets/traffic_signs/31_wild-animals.png';

      default:
        // Fallback to no-entry for unknown detections
        return 'assets/traffic_signs/_unknown.png';
    }
  }

  Future<void> _switchCamera(CameraDescription camera) async {
    setState(() {
      _isInitialized = false;
    });

    await _initializeCameraController(camera);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _detectionTimer?.cancel();
    _grpcServer?.shutdown();
    super.dispose();
  }

  Widget _buildCameraPreview() {
    if (!_isInitialized || _controller == null) { // if camera not ready
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      aspectRatio: _controller!.value.aspectRatio,
      child: CameraPreview(_controller!), // widget that displays camera's output
    );
  }

  Widget _buildDetectionOverlay() {
    if (_currentDetection == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 20,
      left: 20,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black..withValues(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              _currentDetection!.iconPath,
              width: 64,
              height: 64,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.warning,
                  size: 64,
                  color: Colors.orange,
                );
              },
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${_currentDetection!.className} Sign Detected!",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Confidence: ${(_currentDetection!.confidence * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraSelector() {
    if (_cameras.length <= 1) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: _cameras.map((camera) {
          final isSelected = _controller?.description.name == camera.name;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                onPressed: isSelected ? null : () => _switchCamera(camera),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                  foregroundColor: isSelected ? Colors.white : Colors.black,
                ),
                child: Text( // truncates long camera names
                  camera.name.length > 15
                      ? '${camera.name.substring(0, 15)}...'
                      : camera.name,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            _errorMessage,
            style: const TextStyle(fontSize: 16, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _initializeCamera,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cameras found: ${_cameras.length}',
                style: const TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Icon(
                    _serverRunning ? Icons.wifi : Icons.wifi_off,
                    color: _serverRunning ? Colors.green : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _serverRunning ? 'gRPC Ready' : 'gRPC Off',
                    style: TextStyle(
                      fontSize: 14,
                      color: _serverRunning ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (_controller != null && _isInitialized)
            Text(
              'Active: ${_controller!.description.name}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
    );
  }

  // Main screen layout
  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold provides the basic screen layout
      appBar: AppBar( // AppBar top bar with title
        title: const Text('Camera Streams App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // body either show error or main camera interface
      body: _errorMessage.isNotEmpty
          ? _buildErrorWidget()
          : Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  // Camera preview behind
                  Center(
                    child: _buildCameraPreview(),
                  ),
                  // Dynamic detection overlay
                  _buildDetectionOverlay(),
                ],
              ),
            ),
          ),
          _buildCameraSelector(),
          _buildStatusInfo(),
        ],
      ),
    );
  }
}
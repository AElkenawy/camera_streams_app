import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera_linux/camera_linux.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:path/path.dart' as path;
import 'package:grpc/grpc.dart';
import 'package:camera_streams_app/gen/coordinator.pbgrpc.dart';


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

  @override
  void initState() {
    super.initState();
    _initializeCamera();
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

  Future<void> _switchCamera(CameraDescription camera) async {
    setState(() {
      _isInitialized = false;
    });

    await _initializeCameraController(camera);
  }

  @override
  void dispose() {
    _controller?.dispose();
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
              child: Center(
                child: _buildCameraPreview(),
              ),
            ),
          ),
          _buildCameraSelector(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Cameras found: ${_cameras.length}',
                  style: const TextStyle(fontSize: 16),
                ),
                if (_controller != null && _isInitialized)
                  Text(
                    'Active: ${_controller!.description.name}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
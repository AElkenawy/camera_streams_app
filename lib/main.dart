import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'pipewire_bindings.dart';

// FFI signature for PipeWire functions
typedef PwInitFunc = ffi.Int32 Function(ffi.Pointer<ffi.Int32> argc, ffi.Pointer<ffi.Pointer<ffi.Char>> argv);
typedef PwInit = int Function(ffi.Pointer<ffi.Int32> argc, ffi.Pointer<ffi.Pointer<ffi.Char>> argv);

typedef PwDeinitFunc = ffi.Void Function();
typedef PwDeinit = void Function();

typedef PwMainLoopNewFunc = ffi.Pointer Function(ffi.Pointer<ffi.Void> properties);
typedef PwMainLoopNew = ffi.Pointer Function(ffi.Pointer<ffi.Void> properties);

typedef PwMainLoopGetLoopFunc = ffi.Pointer Function(ffi.Pointer<ffi.Void>);
typedef PwMainLoopGetLoop = ffi.Pointer Function(ffi.Pointer<ffi.Void>);

typedef PwMainLoopRunFunc = ffi.Int32 Function(ffi.Pointer mainLoop);
typedef PwMainLoopRun = int Function(ffi.Pointer mainLoop);

typedef PwMainLoopQuitFunc = ffi.Int32 Function(ffi.Pointer mainLoop, ffi.Int32 status);
typedef PwMainLoopQuit = int Function(ffi.Pointer mainLoop, int status);

typedef PwMainLoopDestroyFunc = ffi.Void Function(ffi.Pointer mainLoop);
typedef PwMainLoopDestroy = void Function(ffi.Pointer mainLoop);

typedef PwContextNewFunc = ffi.Pointer Function(ffi.Pointer mainLoop, ffi.Pointer<ffi.Void> properties, ffi.Size size);
typedef PwContextNew = ffi.Pointer Function(ffi.Pointer mainLoop, ffi.Pointer<ffi.Void> properties, int size);
typedef PwContextConnectFunc = ffi.Int32 Function(ffi.Pointer context, ffi.Pointer<ffi.Void> properties, ffi.Int32 size);
typedef PwContextConnect = int Function(ffi.Pointer context, ffi.Pointer<ffi.Void> properties, int size);

typedef PwContextDestroyFunc = ffi.Void Function(ffi.Pointer context);
typedef PwContextDestroy = void Function(ffi.Pointer context);

typedef PwGetRegistryFunc = ffi.Pointer Function(ffi.Pointer context, ffi.Pointer<ffi.Void> properties, ffi.Int32 size);
typedef PwGetRegistry = ffi.Pointer Function(ffi.Pointer context, ffi.Pointer<ffi.Void> properties, int size);

typedef PwRegistryGlobalCallbackNative = ffi.Void Function(
  ffi.Pointer<ffi.Void>, ffi.Uint32, ffi.Uint32, ffi.Pointer<ffi.Char>, ffi.Uint32, ffi.Pointer<ffi.Void>);
typedef PwRegistryGlobalCallback = void Function(
  ffi.Pointer<ffi.Void>, int, int, ffi.Pointer<ffi.Char>, int, ffi.Pointer<ffi.Void>);

typedef PwRegistryAddListenerFunc = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer registry,
  ffi.Pointer<ffi.NativeFunction<PwRegistryGlobalCallbackNative>> globalCallback,
  ffi.Pointer<ffi.Void> userData
);
typedef PwRegistryAddListener = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer registry,
  ffi.Pointer<ffi.NativeFunction<PwRegistryGlobalCallbackNative>> globalCallback,
  ffi.Pointer<ffi.Void> userData
);

typedef PwCoreProxyGetRegistryNative = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> core,
  ffi.Uint32 version,
  ffi.Size userDataSize,
);
typedef PwCoreProxyGetRegistry = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> core,
  int version,
  int userDataSize,
);

// Device class to store information about PipeWire devices
class PipeWireDevice {
  final int id;
  final String name;
  final String type;

  PipeWireDevice({required this.id, required this.name, required this.type});
}

List<PipeWireDevice> _discoveredDevices = [];
void globalCallback(
  ffi.Pointer<ffi.Void> userData,
  int id,
  int permissions,
  ffi.Pointer<ffi.Char> type,
  int version,
  ffi.Pointer<ffi.Void> properties,
) {
  // Convert the type string
  final typeStr = type.cast<Utf8>().toDartString();
  print('globalCallback called: id=$id, type=$typeStr');
  // Only interested in Node types (for simplicity)
  if (typeStr.contains('Node')) {
    // For a real implementation, parse properties for name/type
    // Here, just add a dummy device for demonstration
    _discoveredDevices.add(PipeWireDevice(id: id, name: 'Device $id', type: 'unknown'));
  }
}

void main() {
  runApp(const PipeWireApp());
}

class PipeWireApp extends StatelessWidget {
  const PipeWireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PipeWire Device Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DeviceListScreen(),
    );
  }
}

class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({super.key});

  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  final List<PipeWireDevice> _devices = [];
  bool _isLoading = false;
  String _error = '';
  late final PipeWireManager _pwManager;

  @override
  void initState() {
    super.initState();
    _pwManager = PipeWireManager();
    _initPipeWire();
  }

  @override
  void dispose() {
    _pwManager.dispose();
    super.dispose();
  }

  Future<void> _initPipeWire() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final success = await _pwManager.initialize();
      if (!success) {
        setState(() {
          _error = 'Failed to initialize PipeWire';
          _isLoading = false;
        });
        return;
      }

      // Load devices
      await _loadDevices();
    } catch (e) {
      setState(() {
        _error = 'Error initializing PipeWire: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadDevices() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final devices = await _pwManager.listDevices();
      print('Loaded devices are:');
    for (final device in devices) {
      print('  ID: ${device.id}, Name: ${device.name}, Type: ${device.type}');
    }
      setState(() {
        _devices.clear();
        _devices.addAll(devices);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error loading devices: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PipeWire Devices'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _loadDevices,
        tooltip: 'Refresh Devices',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              _error,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _initPipeWire,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_devices.isEmpty) {
      return const Center(
        child: Text(
          'No PipeWire devices found',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        final device = _devices[index];
        return ListTile(
          leading: Icon(
            device.type == 'audio' ? Icons.audiotrack : Icons.videocam,
            color: device.type == 'audio' ? Colors.blue : Colors.red,
          ),
          title: Text(device.name),
          subtitle: Text('ID: ${device.id}, Type: ${device.type}'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected device: ${device.name}'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}

class PipeWireManager {
  late final ffi.DynamicLibrary _dylib;

  // PipeWire function references
  late final PwInit pwInit;
  late final PwDeinit pwDeinit;
  late final PwMainLoopNew pwMainLoopNew;
  late final PwMainLoopGetLoop pwMainLoopGetLoop;
  late final PwMainLoopRun pwMainLoopRun;
  late final PwMainLoopQuit pwMainLoopQuit;
  late final PwMainLoopDestroy pwMainLoopDestroy;
  late final PwContextNew pwContextNew;
  late final PwContextConnect pwContextConnect;
  late final PwContextDestroy pwContextDestroy;
  late final PwGetRegistry pwGetRegistry;
  late final PwRegistryAddListener pwRegistryAddListener;
  late final PwCoreProxyGetRegistry pwCoreProxyGetRegistry;


  // PipeWire resources
  ffi.Pointer? _mainLoop;
  ffi.Pointer? _spaLoop;
  ffi.Pointer? _context;
  ffi.Pointer? _registry;

  bool _initialized = false;

  Future<bool> initialize() async {
    print('Starting PipeWire initialization...');
    if (_initialized) return true;

    try {
      _dylib = _openLibrary();
      print('Dynamic library loaded.');
      _loadFunctions();
      print('PipeWire functions loaded.');

      // Initialize PipeWire
      final argc = calloc<ffi.Int32>()..value = 0;
      final argv = calloc<ffi.Pointer<ffi.Char>>();

      final result = pwInit(argc, argv);
      print('PipeWire initialized, result: $result');

      calloc.free(argc);
      calloc.free(argv);

      if (result < 0) {
        print('Failed to initialize PipeWire: $result');
        return false;
      }

      // Create main loop
      _mainLoop = pwMainLoopNew(ffi.nullptr);
      if (_mainLoop == null || _mainLoop == ffi.nullptr) {
        print('Failed to create main loop');
        pwDeinit();
        return false;
      }

      // Create context
      print('Main loop created: $_mainLoop');
      print('About to create context...');
      _spaLoop = pwMainLoopGetLoop(_mainLoop!.cast<ffi.Void>());
      _context = pwContextNew(_spaLoop!, ffi.nullptr, 0);
      print('Context pointer: $_context');
      if (_context == null || _context == ffi.nullptr) {
        print('Failed to create context');
        pwMainLoopDestroy(_mainLoop!);
        pwDeinit();
        return false;
      }

      // Connect to PipeWire
      final connectResult = pwContextConnect(_context!, ffi.nullptr, 0);
      print('Connected to PipeWire, result: $connectResult');
      if (connectResult < 0) {
        print('Failed to connect to PipeWire: $connectResult');
        pwContextDestroy(_context!);
        pwMainLoopDestroy(_mainLoop!);
        pwDeinit();
        return false;
      }

      // Get registry
     _registry = pwGetRegistry(_context!, ffi.nullptr, 0);
    //  _registry = pwCoreProxyGetRegistry(_context!.cast<ffi.Void>(), 0, 0);
      print('Registry obtained: $_registry');
      if (_registry == null || _registry == ffi.nullptr) {
        print('Failed to get registry');
        pwContextDestroy(_context!);
        pwMainLoopDestroy(_mainLoop!);
        pwDeinit();
        return false;
      }

      _initialized = true;
      print('PipeWire initialization complete.');
      return true;
    } catch (e) {
      print('Error initializing PipeWire: $e');
      dispose();
      return false;
    }
  }

Future<List<PipeWireDevice>> listDevices() async {
  print('Starting device enumeration...');
  if (!_initialized) {
    throw Exception('PipeWire not initialized');
  }

  _discoveredDevices.clear();
  final nativeCallback = ffi.Pointer.fromFunction<PwRegistryGlobalCallbackNative>(globalCallback);
  pwRegistryAddListener(_registry!, nativeCallback, ffi.nullptr);
  print('Listener added, waiting for callbacks...');

  // Run the main loop for a short time to collect devices
  await Future.delayed(const Duration(seconds: 1));

  print('Device enumeration complete, found: ${_discoveredDevices.length}');
  // Return the discovered devices
  return List<PipeWireDevice>.from(_discoveredDevices);
}

  void dispose() {
    if (_registry != null && _registry != ffi.nullptr) {
      // Clean up registry if needed
      _registry = null;
    }

    if (_context != null && _context != ffi.nullptr) {
      pwContextDestroy(_context!);
      _context = null;
    }

    if (_mainLoop != null && _mainLoop != ffi.nullptr) {
      pwMainLoopDestroy(_mainLoop!);
      _mainLoop = null;
    }

    if (_initialized) {
      pwDeinit();
      _initialized = false;
    }

    print('PipeWire resources cleaned up');
  }

ffi.DynamicLibrary _openLibrary() {
  if (Platform.isLinux) {
    // Try to load from system path
    try {
      return ffi.DynamicLibrary.open('libpipewire-0.3.so');
    } catch (e) {
      print('Could not load PipeWire from system path: $e');
      rethrow; // or throw a custom error if you prefer
    }
  } else {
    throw UnsupportedError('PipeWire is only supported on Linux');
  }
}


  void _loadFunctions() {
    // Load PipeWire functions
    pwInit = _dylib
        .lookup<ffi.NativeFunction<PwInitFunc>>('pw_init')
        .asFunction();

    pwDeinit = _dylib
        .lookup<ffi.NativeFunction<PwDeinitFunc>>('pw_deinit')
        .asFunction();

    pwMainLoopNew = _dylib
        .lookup<ffi.NativeFunction<PwMainLoopNewFunc>>('pw_main_loop_new')
        .asFunction();

    pwMainLoopGetLoop = _dylib
        .lookup<ffi.NativeFunction<PwMainLoopGetLoopFunc>>('pw_main_loop_get_loop')
        .asFunction();

    pwMainLoopRun = _dylib
        .lookup<ffi.NativeFunction<PwMainLoopRunFunc>>('pw_main_loop_run')
        .asFunction();

    pwMainLoopQuit = _dylib
        .lookup<ffi.NativeFunction<PwMainLoopQuitFunc>>('pw_main_loop_quit')
        .asFunction();


    pwMainLoopDestroy = _dylib
        .lookup<ffi.NativeFunction<PwMainLoopDestroyFunc>>('pw_main_loop_destroy')
        .asFunction();

    pwContextNew = _dylib
        .lookup<ffi.NativeFunction<PwContextNewFunc>>('pw_context_new')
        .asFunction();

    pwContextConnect = _dylib
        .lookup<ffi.NativeFunction<PwContextConnectFunc>>('pw_context_connect')
        .asFunction();

    pwContextDestroy = _dylib
        .lookup<ffi.NativeFunction<PwContextDestroyFunc>>('pw_context_destroy')
        .asFunction();

    pwGetRegistry = _dylib
        .lookup<ffi.NativeFunction<PwGetRegistryFunc>>('pw_core_get_registry')
        .asFunction();

    pwRegistryAddListener = _dylib
        .lookup<ffi.NativeFunction<PwRegistryAddListenerFunc>>('pw_registry_add_listener')
        .asFunction();
    
    // pwCoreProxyGetRegistry = _dylib
    // .lookup<ffi.NativeFunction<PwCoreProxyGetRegistryNative>>('pw_core_proxy_get_registry')
    // .asFunction();
  }
}
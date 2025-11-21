import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ambil daftar kamera yang tersedia sebelum runApp
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Preview Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: CameraHome(cameras: cameras),
    );
  }
}

class CameraHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraHome({super.key, required this.cameras});

  @override
  State<CameraHome> createState() => _CameraHomeState();
}

class _CameraHomeState extends State<CameraHome> with WidgetsBindingObserver {
  CameraController? controller;
  int selectedCameraIdx = 0;
  String? lastImagePath;
  bool isInitializing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.cameras.isNotEmpty) {
      _initCamera(widget.cameras[selectedCameraIdx]);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller?.dispose();
    super.dispose();
  }

  // handle app lifecycle to pause/resume camera
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? camController = controller;
    if (camController == null || !camController.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      camController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera(widget.cameras[selectedCameraIdx]);
    }
  }

  Future<void> _initCamera(CameraDescription cameraDescription) async {
    setState(() => isInitializing = true);
    try {
      final camController = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await camController.initialize();
      // if mounted and OK, set controller
      if (!mounted) return;
      setState(() {
        controller = camController;
      });
    } catch (e) {
      // jika error, show snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menginisialisasi kamera: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => isInitializing = false);
    }
  }

  void _switchCamera() {
    if (widget.cameras.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada kamera lain untuk switch')),
      );
      return;
    }
    selectedCameraIdx = (selectedCameraIdx + 1) % widget.cameras.length;
    _initCamera(widget.cameras[selectedCameraIdx]);
  }

  Future<void> _takePicture() async {
    final cam = controller;
    if (cam == null || !cam.value.isInitialized) return;

    try {
      final XFile raw = await cam.takePicture();

      // dapatkan direktori penyimpanan lokal
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String imagesDirPath = p.join(appDir.path, 'Pictures');
      final Directory imagesDir = Directory(imagesDirPath);
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final String timestamp = DateTime.now().toIso8601String().replaceAll(
        ':',
        '-',
      );
      final String fileName = 'photo_$timestamp.jpg';
      final String savedPath = p.join(imagesDir.path, fileName);

      // pindahkan/ copy file hasil XFile ke lokasi yang diinginkan
      final File savedFile = await File(raw.path).copy(savedPath);

      setState(() {
        lastImagePath = savedFile.path;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Foto disimpan di: ${savedFile.path}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal mengambil foto: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final camCtrl = controller;
    final preview = camCtrl != null && camCtrl.value.isInitialized
        ? AspectRatio(
            aspectRatio: camCtrl.value.aspectRatio,
            child: CameraPreview(camCtrl),
          )
        : const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Preview (Material)'),
        actions: [
          IconButton(
            onPressed: _switchCamera,
            icon: const Icon(Icons.cameraswitch),
            tooltip: 'Switch Camera',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.black,
              child: Center(child: preview),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kontrol:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed:
                              camCtrl != null &&
                                  camCtrl.value.isInitialized &&
                                  !isInitializing
                              ? _takePicture
                              : null,
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Ambil Foto'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: widget.cameras.length > 1
                              ? _switchCamera
                              : null,
                          icon: const Icon(Icons.switch_camera),
                          label: const Text('Ganti Kamera'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Path foto terakhir:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        lastImagePath ?? 'Belum ada foto diambil',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Catatan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '- Foto disimpan di folder aplikasi (getApplicationDocumentsDirectory()/Pictures).\n- Untuk melihat file di perangkat, gunakan File Manager atau share dari app.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: camCtrl != null && camCtrl.value.isInitialized
            ? _takePicture
            : null,
        tooltip: 'Ambil Foto',
        child: const Icon(Icons.camera),
      ),
    );
  }
}

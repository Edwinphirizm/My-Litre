import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:plastic_recycling_app/services/firestore_service.dart';
import 'package:plastic_recycling_app/utils/tflite_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  String? result;
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    TFLiteHelper.loadModel();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    camera = cameras!.first;
    _controller = CameraController(camera!, ResolutionPreset.high);
    await _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    TFLiteHelper.disposeModel();
    super.dispose();
  }

  Future<void> _captureAndRecognize() async {
    try {
      final image = await _controller!.takePicture();
      final recognitions = await TFLiteHelper.runModelOnImage(image.path);
      setState(() {
        result = recognitions?.isNotEmpty == true
            ? recognitions!.first['label']
            : 'No bottle recognized';
      });
      if (recognitions?.isNotEmpty == true &&
          recognitions!.first['label'] == 'plastic_bottle') {
        await _firestoreService.updateRewardPoints(_auth.currentUser!.uid,
            50); // Assuming 50 points for plastic bottle
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Capture Bottle')),
      body: Column(
        children: [
          Expanded(child: CameraPreview(_controller!)),
          if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Result: $result', style: TextStyle(fontSize: 18)),
            ),
          FloatingActionButton(
            onPressed: _captureAndRecognize,
            child: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

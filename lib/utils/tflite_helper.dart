import 'package:tflite/tflite.dart';

class TFLiteHelper {
  static Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/bottle_model.tflite",
      labels: "assets/labels.txt",
    );
  }

  static Future<List?> runModelOnImage(String path) async {
    return await Tflite.runModelOnImage(
      path: path,
      numResults: 2,
      threshold: 0.5,
    );
  }

  static void disposeModel() {
    Tflite.close();
  }
}

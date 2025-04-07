// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// Future<String> extractTextFromImage(String imageUrl) async {
//   // Download the image from the URL
//   final response = await http.get(Uri.parse(imageUrl));
//   final bytes = response.bodyBytes;

//   // Save the image to a temporary file
//   final tempDir = await getTemporaryDirectory();
//   final file = File('${tempDir.path}/verse_image.jpg');
//   await file.writeAsBytes(bytes);

//   // Initialize the text recognizer
//   final textRecognizer = GoogleMlKit.vision.textRecognizer();

//   // Process the image
//   final inputImage = InputImage.fromFilePath(file.path);
//   final RecognizedText recognizedText =
//       await textRecognizer.processImage(inputImage);

//   // Extract the text
//   String extractedText = recognizedText.text;

//   // Dispose the recognizer
//   textRecognizer.close();

//   return extractedText;
// }

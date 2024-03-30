import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CropDiseaseDetectionAPI{
  static Future<Map<String, dynamic>> predictImage(XFile? imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('https://mehakpreetkaur.us-east-1.modelbit.com/v1/recommendation/latest'));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return jsonDecode(responseData);
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';

// class ModelIntegrationPage extends StatefulWidget {
//   @override
//   _ModelIntegrationPageState createState() => _ModelIntegrationPageState();
// }

// class _ModelIntegrationPageState extends State<ModelIntegrationPage> {
//   final picker = ImagePicker();

//   Future<Map<String, dynamic>> predictImage(XFile? imageFile) async {
//     var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8001/predict'));
//     request.files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

//     var response = await request.send();
//     var responseData = await response.stream.bytesToString();
//     return jsonDecode(responseData);
//   }

//   Future<void> getImageFromCamera() async {
//     final XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
//     if (imageFile != null) {
//       // Call the function to predict the image
//       var prediction = await predictImage(imageFile);
//       // Handle the prediction response here
//       print(prediction);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Model Integration'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: getImageFromCamera,
//           child: Text('Take Picture and Predict'),
//         ),
//       ),
//     );
//   }
// }
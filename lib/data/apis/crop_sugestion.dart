import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> recommendAction(
  double nitrogen,
  double phosphorus,
  double potassium,
  double temperature,
  double humidity,
  double ph,
  double rainfall,
) async {
  final url = Uri.parse('https://mehakpreetkaur.us-east-1.modelbit.com/v1/recommendation/latest');
  final data = {
    'data': [nitrogen, phosphorus, potassium, temperature, humidity, ph, rainfall],
  };
  final body = jsonEncode(data);
  print('sending request');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  return response;
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class CropDiseaseDetectionAPI{
//   static Future<Map<String, dynamic>> predictImage(XFile? imageFile) async {
//     var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8001/predict'));
//     request.files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

//     var response = await request.send();
//     var responseData = await response.stream.bytesToString();
//     return jsonDecode(responseData);
//   }
// }
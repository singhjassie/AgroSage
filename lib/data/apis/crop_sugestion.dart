import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CropDiseaseDetectionAPI{
  static Future<Map<String, dynamic>> predictImage(XFile? imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8001/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return jsonDecode(responseData);
  }
}
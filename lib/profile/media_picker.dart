import 'dart:io';
import 'package:image_picker/image_picker.dart';


class MediaPicker {
  final ImagePicker picker = ImagePicker();

  Future<List<Map<String, dynamic>>> pickImage() async {
    final pickedFiles = await picker.pickMultiImage();
    // ignore: unnecessary_null_comparison
    if (pickedFiles != null) {
      final mediaJsonList = <Map<String, dynamic>>[];
      for (var pickedFile in pickedFiles) {
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        final mediaJson = {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'thumbnailFile': File(pickedFile.path).path,
          'mediaType': "image"
        };

        mediaJsonList.add(mediaJson);
      }
      return mediaJsonList;
    } else {
      return [];
    }
  }

  imgPicker() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile!.path;
  }

}

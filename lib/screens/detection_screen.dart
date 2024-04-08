import 'dart:io';

import 'package:agrosage/data/apis/crop_disease_detection.dart';
import 'package:agrosage/screens/detection_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agrosage/widgets/label_divider.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _selectedImage;
  Map<String, dynamic>? disease;
  String diseasePrecautions = '';
  bool detecting = false;
  bool precautionLoading = false;

  Future<void> _onPick(BuildContext context, ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      disease = await predictImage(_selectedImage);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetectionResult(
                  image: _selectedImage!,
                  diseaseName: disease!['disease'],
                  diseaseConfidence: disease!['confidence'].toString(),
                  diseaseDesc:
                      "jfiewheifowhehrfheoifhogewofgourebwfhboseuhfoiuhseoiuhfousehohfdboseuhbfouhbseoufgousebofjhge8shfkjsehfo8geljfbpei",
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Icon(
            Icons.add_a_photo,
            size: 225,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _onPick(context, ImageSource.camera);
                    },
                    child: const Text('Take Picture'),
                  ),
                ),
                const LabelDivider(label: 'or'),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _onPick(context, ImageSource.gallery);
                    },
                    child: const Text('Choose From Gallery'),
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}





// Scaffold(
//       body: Column(
//         children: <Widget>[
//           const SizedBox(height: 20),
//           Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: colorScheme.primary,
//                   borderRadius: const BorderRadius.only(
//                     // Top right corner
//                     bottomLeft: Radius.circular(50.0), // Bottom right corner
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       // Shadow color with some transparency
//                       spreadRadius: 1,
//                       // Extend the shadow to all sides equally
//                       blurRadius: 5,
//                       // Soften the shadow
//                       offset: const Offset(2, 2), // Position of the shadow
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.gallery);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: colorScheme.primary,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'OPEN GALLERY',
//                             style: TextStyle(color: colorScheme.primary),
//                           ),
//                           SizedBox(width: 10),
//                           Icon(
//                             Icons.image,
//                             color: colorScheme.primary,
//                           )
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         _pickImage(ImageSource.camera);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: colorScheme.primary,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text('START CAMERA',
//                               style: TextStyle(color: colorScheme.primary)),
//                           SizedBox(width: 10),
//                           Icon(Icons.camera_alt, color: colorScheme.primary)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           _selectedImage == null
//               ? Container(
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   child: Image.asset('assets/images/pick1.png'),
//                 )
//               : Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                     padding: const EdgeInsets.all(20),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.file(
//                         _selectedImage!,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//           if (_selectedImage != null)
//             detecting
//                 ? const CircularProgressIndicator()
//                 : Container(
//                     width: double.infinity,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: colorScheme.primary,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 15),
//                         // Set some horizontal and vertical padding
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(15), // Rounded corners
//                         ),
//                       ),
//                       onPressed: () {
//                         detectDisease();
//                       },
//                       child: Text(
//                         'DETECT',
//                         style: TextStyle(
//                           color: colorScheme.primary, // Set the text color to white
//                           fontSize: 16, // Set the font size
//                           fontWeight:
//                               FontWeight.bold, // Set the font weight to bold
//                         ),
//                       ),
//                     ),
//                   ),
//           if (diseaseName != '')
//             Column(
//               children: [
//                 // Container(
//                 //   height: MediaQuery.of(context).size.height * 0.2,
//                 //   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//                 //   child: Column(
//                 //     mainAxisAlignment: MainAxisAlignment.center,
//                 //     children: [
//                 //       DefaultTextStyle(
//                 //         style: const TextStyle(
//                 //             color: Colors.black,
//                 //             fontWeight: FontWeight.w700,
//                 //             fontSize: 16),
//                 //         child: AnimatedTextKit(
//                 //             isRepeatingAnimation: false,
//                 //             repeatForever: false,
//                 //             displayFullTextOnTap: true,
//                 //             totalRepeatCount: 1,
//                 //             animatedTexts: [
//                 //               TyperAnimatedText(
//                 //                 diseaseName.trim(),
//                 //               ),
//                 //             ]),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 precautionLoading
//                     ? const CircularProgressIndicator()
//                     : ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 15),
//                         ),
//                         onPressed: () {
//                           getDiseasePrecautions();
//                         },
//                         child: Text(
//                           'PRECAUTION',
//                           style: TextStyle(
//                             color: colorScheme.primary,
//                           ),
//                         ),
//                       ),
//               ],
//             ),
//           const SizedBox(height: 30),
//         ],
//       ),





// // import 'dart:io';

// import 'package:agrosage/widgets/label_divider.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:path_provider/path_provider.dart';

// class DetectionScreen extends StatefulWidget {
//   const DetectionScreen({super.key});

//   @override
//   State<DetectionScreen> createState() => _DetectionScreenState();
// }

// class _DetectionScreenState extends State<DetectionScreen> {
//   CameraController? _controller;
//   Future<void>? _initializeControllerFutureResult;

//   Future<List<CameraDescription>> _getCameras() async {
//     final cameras = await availableCameras();
//     return cameras;
//   }

//   Future<void> _initializeControllerFuture() async {
//     final cameras = await _getCameras();
//     final camera = cameras.first;
//     _controller = CameraController(
//       camera,
//       ResolutionPreset.medium,
//     );

//   Future<void> _detectDisease(XFile image) async {}

//   void _takePicture() async {
//     if (!_controller!.value.isRecordingVideo) {
//       await _controller!.takePicture().then((image) {
//         detectDisease(image);
//       });
//     }
//   }
//     await _controller!.initialize();
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initializeControllerFutureResult = _initializeControllerFuture();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 75,
//           ),
//           FutureBuilder<void>(
//             future: _initializeControllerFutureResult,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return CameraPreview(_controller!);
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 35),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 55,
//                 ),
//                 SizedBox(
//                   height: 48,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _takePicture();
//                     },
//                     child: const Text('Take Picture'),
//                   ),
//                 ),
//                 const LabelDivider(label: 'or'),
//                 SizedBox(
//                   height: 48,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Choose From Gallery'),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }















      // print(e);
      // floatingActionButton: FloatingActionButton(
      //   // Provide an onPressed callback.
      //   onPressed: () async {
      //     // Take the Picture in a try / catch block. If anything goes wrong,
      //     // catch the error.
      //     try {
      //       // Ensure that the camera is initialized.
      //       await _initializeControllerFuture;

      //       // Attempt to take a picture and get the file `image`
      //       // where it was saved.
      //       final image = await _controller.takePicture();

      //       if (!context.mounted) return;

      //       // If the picture was taken, display it on a new screen.
      //       await Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => DisplayPictureScreen(
      //             // Pass the automatically generated path to
      //             // the DisplayPictureScreen widget.
      //             imagePath: image.path,
      //           ),
      //         ),
      //       );
      //     } catch (e) {
      //       // If an error occurs, log the error to the console.
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),




// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//     super.key,
//     required this.camera,
//   });

//   final CameraDescription camera;

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }


//   }
// }

// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }








// import 'package:camerawesome/camerawesome_plugin.dart';
// import 'package:flutter/material.dart';

// class DetectionScreen extends StatefulWidget {
//   const DetectionScreen({super.key});

//   @override
//   State<DetectionScreen> createState() => _DetectionScreenState();
// }

// class _DetectionScreenState extends State<DetectionScreen> {
//   @override
//   Widget build(BuildContext context) {

//     return CameraAwesomeBuilder.awesome(
//       saveConfig: SaveConfig.photo(),
//       availableFilters: const [],
//       topActionsBuilder: (state) => (Container()),
//       // bottomActionsBuilder: (state) => ,
//       onMediaTap: (mediaCapture) => {
//         print(mediaCapture)
//       },
//       // theme: AwesomeTheme().copyWith(bottomActionsBackgroundColor: colorScheme.primary.withOpacity(.5)),
//       sensorConfig: SensorConfig.single(
//           aspectRatio: CameraAspectRatios.ratio_16_9,
//           zoom: 0.0,
//           sensor: Sensor.position(SensorPosition.back)),
//     );
//   }
// }
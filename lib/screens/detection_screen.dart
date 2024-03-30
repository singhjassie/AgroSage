import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  @override
  Widget build(BuildContext context) {

    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(),
      availableFilters: const [],
      topActionsBuilder: (state) => (Container()),
      // bottomActionsBuilder: (state) => ,
      onMediaTap: (mediaCapture) => {
        print(mediaCapture)
      },
      // theme: AwesomeTheme().copyWith(bottomActionsBackgroundColor: colorScheme.primary.withOpacity(.5)),
      sensorConfig: SensorConfig.single(
          aspectRatio: CameraAspectRatios.ratio_16_9,
          zoom: 0.0,
          sensor: Sensor.position(SensorPosition.back)),
    );
  }
}
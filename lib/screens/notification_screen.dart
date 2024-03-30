import 'package:agrosage/widgets/notification_widget.dart';

import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          NotificationWidget(
              heading: "Heading 1",
              description: "description 1",
              image: AssetImage("assets/images/leaf_image.png")),
          NotificationWidget(
              heading: "Heading 2",
              description: "description 2",
              image: AssetImage("assets/images/leaf_image.png")),
          NotificationWidget(
              heading: "Heading 3",
              description: "description 3",
              image: AssetImage("assets/images/leaf_image.png")),
        ],
      ),
    );
  }
}

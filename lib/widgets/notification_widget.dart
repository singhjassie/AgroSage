import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key,
    required this.heading,
    required this.description,
    required this.image,
  });

  final String heading;
  final ImageProvider<Object> image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: image, // Set the image as backgroundImage
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Colors.grey.shade400), // Divider between first and second rows
            // Divider between second and third rows
          ],
        ),
      );
  }
}

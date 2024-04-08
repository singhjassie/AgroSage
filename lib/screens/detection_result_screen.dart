import 'dart:io';

import 'package:flutter/material.dart';

class DetectionResult extends StatefulWidget {
  const DetectionResult(
      {super.key,
      required this.image,
      required this.diseaseName,
      required this.diseaseConfidence,
      required this.diseaseDesc});
  final File image;
  final String diseaseName;
  final String diseaseConfidence;
  final String diseaseDesc;

  @override
  State<DetectionResult> createState() => _DetectionResultState();
}

class _DetectionResultState extends State<DetectionResult> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Adjust the value as needed
                    child: Image.file(widget.image),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(
                  child: Text(
                    "${widget.diseaseName}(${widget.diseaseConfidence})",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    widget.diseaseDesc,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    
                  },
                  child: Text(
                    "Get AI Based Solution",
                    style:
                        TextStyle(color: colorScheme.onPrimary, fontSize: 16),
                  )),
            ],
          )),
    );
  }
}

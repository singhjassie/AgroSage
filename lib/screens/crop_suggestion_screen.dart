import 'package:agrosage/data/apis/crop_sugestion.dart';
import 'package:agrosage/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CropSuggestionScreen extends StatelessWidget {
  const CropSuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Center(
                  child: Text(
                "Crop  Suggestions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 50,
              ),
              const SuggestionInput(
                hintText: 'Nitrogen',
              ),
              const SizedBox(
                height: 25,
              ),
              const SuggestionInput(
                hintText: 'Potassium',
              ),
              const SizedBox(
                height: 25,
              ),
              const SuggestionInput(hintText: 'Phosphorus'),
              const SizedBox(
                height: 25,
              ),
              const SuggestionInput(hintText: 'ph'),
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        recommendAction(20, 30, 40, 40, 20, 30, 50).then((value) => print(value));
                      },
                      child: Text(
                        "Get Crop Suggestion",
                        style: TextStyle(
                            color: colorScheme.onPrimary, fontSize: 16),
                      )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:agrosage/input.dart';
import 'package:flutter/material.dart';

class CropSuggestion extends StatelessWidget {
  const CropSuggestion({super.key});

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
              const SizedBox(height: 45,),
              const Center(child: Text("Crop  Suggestions",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              const SizedBox(height: 50,),
              const SuggestionInput(hintText: 'Nitrogen',),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: 'Potassium',),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: 'Phosphorus'),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: 'Temperature'),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: "Humidity"),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: 'ph'),
              const SizedBox(height: 25,),
              const SuggestionInput(hintText: 'Rainfall'),
              const SizedBox(height: 45,),
            SizedBox(
                            width: 300,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.primary,
                                    
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: (){},
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
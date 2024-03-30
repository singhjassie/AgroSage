import 'package:agrosage/screens/chatbot_screen.dart';
import 'package:agrosage/screens/crop_suggestion_screen.dart';
import 'package:agrosage/screens/detection_screen.dart';
import 'package:agrosage/widgets/label_divider.dart';
import 'package:agrosage/widgets/product_cat_card.dart';
import 'package:agrosage/widgets/text_tile.dart';
import 'package:agrosage/widgets/vertical_card.dart';
import 'package:agrosage/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        color: colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "${AppLocalizations.of(context)?.app_name}",
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    hintText: 'Search Products',
                  ),
                ),
              ),
              CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const ProductCategoryCard(
                          categoryName: 'Seeds',
                          imageUrl:
                              'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGxhbnR8ZW58MHx8MHx8fDA%3D',
                        );
                      },
                      childCount: 6,
                    ),
                  ),
                ],
              ),
              const LabelDivider(label: 'Farm with AI'),
              const TextTile(
                title: 'Get Crop Suggestion',
                description: 'Get crop suggestion based on your location',
                image_path: 'assets/images/leaf_image.png',
                destination: CropSuggestionScreen(),
              ),
              const TextTile(
                title: 'Chat with AI Chatbot',
                description:
                    'Get solution of farming problems by chatting with AI Chatbot',
                image_path: 'assets/images/leaf_image.png',
                destination: ChatbotScreen(),
              ),
              const TextTile(
                title: 'Detect crop Disieses',
                description: 'Detect crop Disieses and Get AI Based Solution',
                image_path: 'assets/images/leaf_image.png',
                destination: DetectionScreen(),
              ),
              const LabelDivider(label: 'Current Crop Price'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    VerticalCardWithImage(),
                    VerticalCardWithImage(),
                    VerticalCardWithImage(),
                    VerticalCardWithImage(),
                    VerticalCardWithImage(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const LabelDivider(label: 'Weather'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 3 / 2,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const WeatherCard(
                              title: 'Temperature',
                              icon: Icons.thermostat,
                              value: '30',
                              unit: '°C');
                        },
                        childCount: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

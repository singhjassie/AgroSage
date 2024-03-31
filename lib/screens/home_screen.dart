import 'package:agrosage/data/apis/weather.dart';
import 'package:agrosage/data/product_list.dart';
import 'package:agrosage/screens/chatbot_screen.dart';
import 'package:agrosage/screens/crop_suggestion_screen.dart';
import 'package:agrosage/screens/detection_screen.dart';
import 'package:agrosage/widgets/label_divider.dart';
import 'package:agrosage/widgets/product_cat_card.dart';
import 'package:agrosage/widgets/text_tile.dart';
import 'package:agrosage/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.changeScreen});
  final void Function(int) changeScreen;

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
                    hintText: "${AppLocalizations.of(context)?.search_products}",
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
                        return ProductCategoryCard(
                          categoryName: productList[index].name,
                          imageUrl:
                              'assets/images/wheat-green.jpg',
                          changeScreen: changeScreen,
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                ],
              ),
              LabelDivider(label: "${AppLocalizations.of(context)?.farm_with_ai}"),
              TextTile(
                title: "${AppLocalizations.of(context)?.chat_ai_label}",
                description:
                    "${AppLocalizations.of(context)?.chat_ai_description}",
                imagePath: 'assets/images/chat-with-ai.webp',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatbotScreen()));
                },
              ),
              TextTile(
                title: "${AppLocalizations.of(context)?.detection_label}",
                description: "${AppLocalizations.of(context)?.detection_description}",
                imagePath: 'assets/images/detection.jpg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetectionScreen()));
                },
              ),
              TextTile(
                title: "${AppLocalizations.of(context)?.suggestion_label}",
                description: "${AppLocalizations.of(context)?.suggestion_description}",
                imagePath: 'assets/images/crop-suggestion.jpg',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CropSuggestionScreen(),));
                },
              ),
              // const LabelDivider(label: 'Current Crop Price'),
              // const SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       VerticalCardWithImage(),
              //       VerticalCardWithImage(),
              //       VerticalCardWithImage(),
              //       VerticalCardWithImage(),
              //       VerticalCardWithImage(),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              LabelDivider(label: "${AppLocalizations.of(context)?.weather}"),
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
                          return WeatherCard(
                              title: weatherData[index].label,
                              icon: weatherData[index].icon,
                              value: weatherData[index].value,
                              unit: weatherData[index].units);
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

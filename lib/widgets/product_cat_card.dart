import 'package:agrosage/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryCard extends StatelessWidget {
  const ProductCategoryCard({super.key, required this.categoryName, required this.imageUrl});
  final String categoryName;
  final String imageUrl; // Add imageUrl parameter

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopScreen()),
        );
      },
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.onSurface.withOpacity(.5)),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0), // Adjust as needed
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/wheat.jpg', // Placeholder image
                image: imageUrl, // Use provided imageUrl
                fit: BoxFit.cover, // Adjust image fit within the circle
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(categoryName),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class VerticalCardWithImage extends StatelessWidget {
  const VerticalCardWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Container(
        width: 125,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.onSurface.withOpacity(.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/wheat-green.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                'Crop Name',
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                'Price',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

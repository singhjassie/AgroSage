import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.unit,
  });
  final String title;
  final IconData icon;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.onSurface.withOpacity(.5))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, 
              color: colorScheme.onBackground,),
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(value,
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  const Spacer(),
                  Text(unit,
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

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
          color: colorScheme.primary.withOpacity(.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.onSurface.withOpacity(.5))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, 
              color: colorScheme.onPrimary,),
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(value,
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  const Spacer(),
                  Text(unit,
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.action = 'View More',
  });

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
        ),
        Text(
          action,
          style:  TextStyle(
              color:Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.normal,
          )
        ),
      ],
    );
  }
}
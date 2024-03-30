import 'package:flutter/material.dart';

class LabelDivider extends StatelessWidget {
  const LabelDivider({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: colorScheme.onSurface.withOpacity(.5),
          )),
          const SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold, color: colorScheme.primary),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Divider(
            color: colorScheme.onSurface.withOpacity(.5),
          )),
        ],
      ),
    );
  }
}

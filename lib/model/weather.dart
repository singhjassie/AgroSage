import 'package:flutter/material.dart';

class Weather {
  const Weather({
    required this.icon,
    required this.label,
    required this.value,
    required this.units,
  });
  final IconData icon;
  final String label;
  final String value;
  final String units;
}

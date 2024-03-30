import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Category {
  seeds,
  herbicides,
  fungicides,
  viricides,
  growthPromoter,
  farmMachinery
}

class Product {
  Product({
    required this.name,
    required this.discountedPrice,
    required this.actualPrice,
    required this.brand,
    required this.category,
  }): id = uuid.v4();

  final String name;
  final String brand;
  final double discountedPrice;
  final double actualPrice;
  final Category category;
  final String id;
}

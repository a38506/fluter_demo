import 'package:flutter/material.dart';

class CustomThemeData {
  final Color colorSaleHot;
  final Color onColorSaleHot;

  const CustomThemeData({
    required this.colorSaleHot,
    required this.onColorSaleHot,
  });

  factory CustomThemeData.light() {
    return const CustomThemeData(
      colorSaleHot: Color(0xFFDB3022),
      onColorSaleHot: Colors.white,
    );
  }
}

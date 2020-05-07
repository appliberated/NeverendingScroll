import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorX on Color {
  static Color random(Random random) => Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);

  static Color randomPrimary(Random random) =>
      Colors.primaries[random.nextInt(Colors.primaries.length)];

  Color contrastOf() =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light ? Colors.black : Colors.white;

  MaterialColor createMaterialColor() {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(value, swatch);
  }
}

import 'package:flutter/material.dart';

class ThemeColor {

  static final accentThemes = {
    'pink': Colors.pink,
    'red': Colors.red,
    'green': Colors.green,
    'cyan': Colors.cyan
  };

  static MaterialColor getColor(String ?colorName) {
    if (colorName == null){
      return accentThemes.values.first;
    }
    return accentThemes.entries.firstWhere((element) => element.key == colorName).value;
  }
}
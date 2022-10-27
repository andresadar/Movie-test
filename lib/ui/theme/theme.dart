import 'package:flutter/material.dart';
import 'package:leal_flutter/ui/theme/colors.dart';

///The theme of the application.
abstract class UITheme {
  static final themeDark = ThemeData.dark().copyWith(
    primaryColor: UIColors.primaryColor,
    backgroundColor: UIColors.backgroundColor,
    scaffoldBackgroundColor: UIColors.backgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.yellow,
      backgroundColor: UIColors.backgroundColor,
      accentColor: UIColors.accentColor,
    ).copyWith(
      secondary: UIColors.white,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:leal_flutter/ui/theme/colors.dart';

///The theme of the application.
abstract class UITheme {
  static final themeDark = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: const ColorScheme.dark(primary: UIColors.primaryColor),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextTheme texTheme(
    TextTheme textTheme,
    ColorScheme colors,
  ) {
    final baseTheme = GoogleFonts.robotoTextTheme(textTheme);

    return baseTheme.apply(
      displayColor: colors.primary,
      bodyColor: colors.onSurface,
    );
  }
}

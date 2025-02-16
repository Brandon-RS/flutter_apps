import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppDialogStyles {
  static DialogTheme dialogTheme(
    TextTheme textTheme,
    ColorScheme colors,
  ) {
    return DialogTheme(
      backgroundColor: colors.surface,
      elevation: kElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusLarge),
      ),
      titleTextStyle: textTheme.headlineSmall,
      contentTextStyle: textTheme.bodyMedium,
      surfaceTintColor: colors.surface,
    );
  }

  static DatePickerThemeData datePickerThemeData(
    TextTheme textTheme,
    ColorScheme colors,
  ) {
    return DatePickerThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surface,
      dividerColor: colors.outline,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusLarge),
      ),
    );
  }
}

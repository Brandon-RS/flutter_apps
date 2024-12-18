import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppInputStyles {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius)),
        borderSide: BorderSide(color: color, width: kBorderWidth),
      );

  static InputDecorationTheme inputDecorationTheme(
    TextTheme textTheme,
    ColorScheme colors,
  ) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(kPadding),
      isDense: true,
      hintStyle: textTheme.bodyMedium?.copyWith(color: colors.outline),
      labelStyle: textTheme.bodyMedium,
      helperStyle: textTheme.bodySmall,
      errorStyle: textTheme.bodySmall?.copyWith(color: colors.error),
      errorMaxLines: 2,
      border: _border(colors.primary),
      enabledBorder: _border(colors.outline),
      focusedBorder: _border(colors.primary),
      disabledBorder: _border(colors.surfaceContainerLow),
      errorBorder: _border(colors.error),
      focusedErrorBorder: _border(colors.error),
    );
  }

  static DropdownMenuThemeData dropdownMenuTheme(
    TextTheme textTheme,
    ColorScheme colors,
  ) {
    return DropdownMenuThemeData(
      textStyle: textTheme.bodyMedium?.copyWith(color: colors.primary),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _border(colors.outline),
      ),
    );
  }

  static CheckboxThemeData checkboxTheme(
    ColorScheme colors,
  ) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => states.isEmpty ? colors.onSurface.withValues(alpha: 0.4) : null,
      ),
    );
  }

  static RadioThemeData radioTheme(
    ColorScheme colors,
  ) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => states.isEmpty ? colors.onSurface.withValues(alpha: 0.4) : null,
      ),
    );
  }

  static SwitchThemeData switchTheme(
    ColorScheme colors,
  ) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => states.isEmpty ? colors.onSurface.withValues(alpha: 0.4) : null,
      ),
    );
  }
}

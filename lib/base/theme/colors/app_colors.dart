import 'package:flit_notes/base/theme/colors/app_color_extension.dart';
import 'package:flutter/material.dart';

class AppColors {
  static ColorScheme get light => const ColorScheme.light(
    primary: Color(0xFF1A1B27),
    onPrimary: Color(0xFFF4F4F4),
    primaryContainer: Color(0xFFDFE0FF),
    onPrimaryContainer: Color(0xFF000A63),
    primaryFixed: Color(0xFFD9D9D9),
    primaryFixedDim: Color(0xFFBEBEBE),
    onPrimaryFixed: Color(0xFF3A2F69),
    onPrimaryFixedVariant: Color(0xFF3B335E),
    secondary: Color(0xFF5C5D72),
    onSecondary: Color(0xFFF4F4F4),
    secondaryContainer: Color(0xFFE0E0FF),
    onSecondaryContainer: Color(0xFF030865),
    secondaryFixed: Color(0xFFD5D5F9),
    secondaryFixedDim: Color(0xFFC6C6F4),
    onSecondaryFixed: Color(0xFF1A1B27),
    tertiary: Color(0xFF4E4F6B),
    onTertiary: Color(0xFF1A1B27),
    tertiaryContainer: Color(0xFFE3D3F8),
    onTertiaryContainer: Color(0xFF1F202E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFF4F4F4),
    errorContainer: Color(0xFFFFDAD5),
    onErrorContainer: Color(0xFF410001),
    surface: Color(0xFFFBF8FF),
    surfaceContainer: Color(0xFFF5EFEF),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F0F4),
    surfaceContainerHigh: Color(0xFFE4E1E9),
    surfaceContainerHighest: Color(0xFFD8D4DF),
    onSurface: Color(0xFF151622),
    onSurfaceVariant: Color(0xFF43398F),
    outline: Color(0xFFD0D0D0),
    outlineVariant: Color(0xFFE2E8F0),
    inversePrimary: Color(0xFFBDC2FF),
    inverseSurface: Color(0xFF303036),
    onInverseSurface: Color(0xFFF2EFF7),
    scrim: Color(0xFF151515),
    shadow: Color(0xFF0B0A0A),
  );

  // TODO(BRANDOM): Add dark color scheme
  static ColorScheme get dark => const ColorScheme.dark(
    primary: Color(0xFFC3C3C3),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFFDFE0FF),
    onPrimaryContainer: Color(0xFF000A63),
    primaryFixed: Color(0xFFD9D9D9),
    primaryFixedDim: Color(0xFFBEBEBE),
    onPrimaryFixed: Color(0xFF3A2F69),
    onPrimaryFixedVariant: Color(0xFF3B335E),
    secondary: Color(0xFF5C5D72),
    onSecondary: Color(0xFFF4F4F4),
    secondaryContainer: Color(0xFFE0E0FF),
    onSecondaryContainer: Color(0xFF030865),
    secondaryFixed: Color(0xFFD5D5F9),
    secondaryFixedDim: Color(0xFFC6C6F4),
    onSecondaryFixed: Color(0xFF1A1B27),
    tertiary: Color(0xFF4E4F6B),
    onTertiary: Color(0xFF1A1B27),
    tertiaryContainer: Color(0xFFE3D3F8),
    onTertiaryContainer: Color(0xFF1F202E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFF4F4F4),
    errorContainer: Color(0xFFFFDAD5),
    onErrorContainer: Color(0xFF410001),
    surface: Color(0xFF343334),
    surfaceContainer: Color(0xFFF5EFEF),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F0F4),
    surfaceContainerHigh: Color(0xFFE4E1E9),
    surfaceContainerHighest: Color(0xFFD8D4DF),
    onSurface: Color(0xFFFEFEFE),
    onSurfaceVariant: Color(0xFF43398F),
    outline: Color(0xFFD0D0D0),
    outlineVariant: Color(0xFFE2E8F0),
    inversePrimary: Color(0xFFBDC2FF),
    inverseSurface: Color(0xFF303036),
    onInverseSurface: Color(0xFFF2EFF7),
    scrim: Color(0xFF151515),
    shadow: Color(0xFF0B0A0A),
  );

  static AppColorExtension get lightColorExt => const AppColorExtension(
    success: Color(0XFF6CC071),
    onSuccess: Color(0xFFF4F4F4),
    successContainer: Color(0xFFE8F5E9),
    onSuccessContainer: Color(0xFF1A1B27),
  );

  static AppColorExtension get darkColorExt => const AppColorExtension(
    success: Color(0XFF6CC071),
    onSuccess: Color(0xFFF4F4F4),
    successContainer: Color(0xFFE8F5E9),
    onSuccessContainer: Color(0xFF1A1B27),
  );

  static ColorScheme colorScheme(Brightness brightness) => switch (brightness) {
    Brightness.light => light,
    Brightness.dark => dark,
  };

  static AppColorExtension colorExt(Brightness brightness) =>
      switch (brightness) {
        Brightness.light => lightColorExt,
        Brightness.dark => darkColorExt,
      };
}

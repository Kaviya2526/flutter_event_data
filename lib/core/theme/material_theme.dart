import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8e4d2f),
      surfaceTint: Color(0xff8e4d2f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbcd),
      onPrimaryContainer: Color(0xff71361a),
      secondary: Color(0xff8d4d2d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbcc),
      onSecondaryContainer: Color(0xff703718),
      tertiary: Color(0xff675f30),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffefe3a9),
      onTertiaryContainer: Color(0xff4e471b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff231a16),
      onSurfaceVariant: Color(0xff53443e),
      outline: Color(0xff85736c),
      outlineVariant: Color(0xffd8c2ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb596),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff71361a),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff703718),
      tertiaryFixed: Color(0xffefe3a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd2c78f),
      onTertiaryFixedVariant: Color(0xff4e471b),
      surfaceDim: Color(0xffe8d6d0),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffceae4),
      surfaceContainerHigh: Color(0xfff6e4de),
      surfaceContainerHighest: Color(0xfff1dfd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5c260b),
      surfaceTint: Color(0xff8e4d2f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa05b3c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5c2709),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9f5c3a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d360c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff766e3d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff170f0c),
      onSurfaceVariant: Color(0xff41332e),
      outline: Color(0xff5f4f49),
      outlineVariant: Color(0xff7b6963),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb596),
      primaryFixed: Color(0xffa05b3c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff824426),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9f5c3a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff824425),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff766e3d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5d5528),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3bd),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfff6e4de),
      surfaceContainerHigh: Color(0xffebd9d3),
      surfaceContainerHighest: Color(0xffdfcec8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f1d03),
      surfaceTint: Color(0xff8e4d2f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff74391c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f1d02),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff73391a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff322c03),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff514a1d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362924),
      outlineVariant: Color(0xff554640),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb596),
      primaryFixed: Color(0xff74391c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff572308),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff73391a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff572306),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff514a1d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff393308),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5af),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede7),
      surfaceContainer: Color(0xfff1dfd8),
      surfaceContainerHigh: Color(0xffe2d1cb),
      surfaceContainerHighest: Color(0xffd4c3bd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb596),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff542106),
      primaryContainer: Color(0xff71361a),
      onPrimaryContainer: Color(0xffffdbcd),
      secondary: Color(0xffffb694),
      onSecondary: Color(0xff542104),
      secondaryContainer: Color(0xff703718),
      onSecondaryContainer: Color(0xffffdbcc),
      tertiary: Color(0xffd2c78f),
      onTertiary: Color(0xff373106),
      tertiaryContainer: Color(0xff4e471b),
      onTertiaryContainer: Color(0xffefe3a9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a110e),
      onSurface: Color(0xfff1dfd8),
      onSurfaceVariant: Color(0xffd8c2ba),
      outline: Color(0xffa08d85),
      outlineVariant: Color(0xff53443e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff8e4d2f),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff71361a),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff703718),
      tertiaryFixed: Color(0xffefe3a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd2c78f),
      onTertiaryFixedVariant: Color(0xff4e471b),
      surfaceDim: Color(0xff1a110e),
      surfaceBright: Color(0xff423733),
      surfaceContainerLowest: Color(0xff140c09),
      surfaceContainerLow: Color(0xff231a16),
      surfaceContainer: Color(0xff271e1a),
      surfaceContainerHigh: Color(0xff322824),
      surfaceContainerHighest: Color(0xff3d322e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c1),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff461600),
      primaryContainer: Color(0xffca7e5c),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd3c0),
      onSecondary: Color(0xff451700),
      secondaryContainer: Color(0xffc97e5a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe9dda3),
      onTertiary: Color(0xff2b2600),
      tertiaryContainer: Color(0xff9b915e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a110e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8cf),
      outline: Color(0xffc2aea6),
      outlineVariant: Color(0xff9f8c85),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff72371b),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff250800),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff5c260b),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff240900),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff5c2709),
      tertiaryFixed: Color(0xffefe3a9),
      onTertiaryFixed: Color(0xff151100),
      tertiaryFixedDim: Color(0xffd2c78f),
      onTertiaryFixedVariant: Color(0xff3d360c),
      surfaceDim: Color(0xff1a110e),
      surfaceBright: Color(0xff4d423e),
      surfaceContainerLowest: Color(0xff0d0604),
      surfaceContainerLow: Color(0xff251c18),
      surfaceContainer: Color(0xff302622),
      surfaceContainerHigh: Color(0xff3b302c),
      surfaceContainerHighest: Color(0xff463b37),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece5),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb08e),
      onPrimaryContainer: Color(0xff1b0500),
      secondary: Color(0xffffece5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb08b),
      onSecondaryContainer: Color(0xff1b0500),
      tertiary: Color(0xfffdf1b5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcec38b),
      onTertiaryContainer: Color(0xff0e0b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a110e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece5),
      outlineVariant: Color(0xffd4beb6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd8),
      inversePrimary: Color(0xff72371b),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff250800),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff240900),
      tertiaryFixed: Color(0xffefe3a9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd2c78f),
      onTertiaryFixedVariant: Color(0xff151100),
      surfaceDim: Color(0xff1a110e),
      surfaceBright: Color(0xff594e49),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271e1a),
      surfaceContainer: Color(0xff382e2a),
      surfaceContainerHigh: Color(0xff443935),
      surfaceContainerHighest: Color(0xff504440),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

import 'package:event_data/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


TextTheme createTextTheme(BuildContext context, String fontFamily) {
  final textTheme = Theme.of(context).textTheme;
  final textStyle = TextStyle(fontFamily: fontFamily);

  return textTheme.copyWith(
    displayLarge: textStyle.copyWith(
      fontSize: 20,
      fontFamily: '${fontFamily}_SemiBold',
    ),
    displayMedium: textStyle.copyWith(
      fontSize: 20,
      fontFamily: '${fontFamily}_Medium',
    ),
    displaySmall: textStyle.copyWith(
      fontSize: 20,
      fontFamily: '${fontFamily}_Regular',
    ),
    headlineLarge: textStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: textStyle.copyWith(
      fontSize: 18,
      fontFamily: '${fontFamily}_Medium',
    ),
    headlineSmall: textStyle.copyWith(
      fontSize: 18,
      fontFamily: '${fontFamily}_Regular',
    ),
    titleLarge: textStyle.copyWith(
      fontSize: 19,
      fontFamily: '${fontFamily}_SemiBold',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: textStyle.copyWith(
      fontSize: 16,
      fontFamily: '${fontFamily}_Medium',
    ),
    titleSmall: textStyle.copyWith(
      fontSize: 16,
      fontFamily: '${fontFamily}_Regular',
    ),
    labelLarge: textStyle.copyWith(
      fontSize: 12,
      fontFamily: '${fontFamily}_SemiBold',
    ),
    labelMedium: textStyle.copyWith(
      fontSize: 12,
      fontFamily: '${fontFamily}_Medium',
    ),
    labelSmall: textStyle.copyWith(
      fontSize: 12,
      fontFamily: '${fontFamily}_Regular',
    ),
    bodyLarge: textStyle.copyWith(
      fontSize: 14,
      fontFamily: '${fontFamily}_SemiBold',
    ),
    bodyMedium: textStyle.copyWith(
      fontSize: 14,
      fontFamily: '${fontFamily}_Medium',
    ),
    bodySmall: textStyle.copyWith(
      fontSize: 14,
      fontFamily: '${fontFamily}_Regular',
      fontWeight: FontWeight.w400,
    ),
  );
}

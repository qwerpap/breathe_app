import 'package:flutter/material.dart';
import 'app_colors.dart';

final primaryColor = AppColors.primaryColor;

final lightTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBgLightTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.scaffoldBgLightTheme,
    surfaceTintColor: AppColors.scaffoldBgLightTheme,
  ),
  textTheme: textTheme,
);

final darktTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBgDarkTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.scaffoldBgDarkTheme,
    surfaceTintColor: AppColors.scaffoldBgDarkTheme,
  ),
  textTheme: textTheme,
);

final textTheme = TextTheme(
  headlineMedium: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 36,
    fontWeight: FontWeight.w600,
  ),
  titleLarge: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 28,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  titleSmall: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),

  labelLarge: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    fontFamily: 'SfPro',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
);

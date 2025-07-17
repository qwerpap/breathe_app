import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;

  static const primaryColor = Color.fromRGBO(47, 144, 174, 1);
  static const secondaryColor = Color.fromRGBO(155, 202, 217, 1);

  static const greyColor = Colors.grey;

  static const scaffoldBgLightTheme = Colors.white;
  static const scaffoldBgDarkTheme = Colors.black;

  static const blueWhiteGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [primaryColor, whiteColor],
  );

  static const primaryGradiend = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [primaryColor, primaryColor, secondaryColor],
    stops: [0.0, 0.99, 1.0], 
  );
}

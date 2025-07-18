import 'dart:async';
import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/menu_screen/view/menu_screen.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _navigated = false;

  @override
  Widget build(BuildContext context) {
    // Навигация только один раз
    if (!_navigated) {
      _navigated = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MenuScreen()),
        );
      });
    }

    final textStyle = TextStyle(
      fontFamily: 'SfPro',
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.blueWhiteGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageSource.logo,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 16),
                Text(AppConstants.nameApp, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: 'SfPro',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.blueGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageSource.logo,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(height: 16),
                Text(AppConstants.nameApp, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

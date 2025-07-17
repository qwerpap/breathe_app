import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: AppColors.blackColor),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Text(
          AppConstants.nameApp,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

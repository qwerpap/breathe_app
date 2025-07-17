import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'History',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            DefaultAppAnimation(
              onTap: () => Navigator.pop(context),
              builder:
                  (isPressed) => SvgPicture.asset(
                    ImageSource.arrowBack,
                    height: 25,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

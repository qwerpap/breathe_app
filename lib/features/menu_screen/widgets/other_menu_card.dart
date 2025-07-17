import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OtherMenuCard extends StatelessWidget {
  const OtherMenuCard({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultAppAnimation(
      onTap: onPressed,
      builder: (bool isPressed) {
        return Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color:
                isPressed
                    ? AppColors.greyColor
                    : Theme.of(context).textTheme.labelMedium?.color,
          ),
        );
      },
    );
  }
}

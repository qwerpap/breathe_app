import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/app_colors.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({
    super.key,
    required this.title,
    required this.svg,
    required this.onPressed,
    this.iconHeight = 18, // default 18
  });

  final String title;
  final String svg;
  final VoidCallback onPressed;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;

    return SizedBox(
      height: 45,
      child: Row(
        children: [
          SvgPicture.asset(svg, height: iconHeight, color: AppColors.primaryColor),
          SizedBox(width: 8),
          DefaultAppAnimation(
            onTap: onPressed,
            builder:
                (isPressed) => Text(
                  title,
                  style: textStyle?.copyWith(
                    color:
                        isPressed
                            ? AppColors.primaryColor
                            : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

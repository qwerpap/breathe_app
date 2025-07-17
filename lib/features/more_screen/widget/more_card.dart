import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/app_colors.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;

    return SizedBox(
      height: 45,
      child: Row(
        children: [
          SvgPicture.asset(
            ImageSource.logoSvg,
            height: 18,
            color: AppColors.primaryColor,
          ),
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

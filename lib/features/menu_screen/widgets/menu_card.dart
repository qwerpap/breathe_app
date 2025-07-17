import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.title,
    required this.onPressed,
    this.svg,
    this.textStyle,
  });

  final String title;
  final String? svg;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultAppAnimation(
      onTap: onPressed,
      builder:
          (isPressed) => Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.14),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (svg != null) ...[
                      SvgPicture.asset(
                        svg!,
                        height: 20,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(title, style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
                const Icon(
                  Icons.arrow_right_alt,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
    );
  }
}

import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LangCard extends StatelessWidget {
  const LangCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultAppAnimation(
      onTap: onPressed,
      builder: (bool isPressed) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          decoration: BoxDecoration(
            color:
                isPressed
                    ? AppColors.secondaryColor.withOpacity(
                      0.2,
                    ) // цвет при нажатии
                    : AppColors.whiteColor, // обычный цвет
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text('ENG', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: 6),
              const Text('F'),
            ],
          ),
        );
      },
    );
  }
}

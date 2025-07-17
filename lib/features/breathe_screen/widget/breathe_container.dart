import 'package:breathe_app/features/global/widgets/default_app_animation.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class BreatheContainer extends StatelessWidget {
  const BreatheContainer({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DefaultAppAnimation(
        onTap: onPressed,
        builder:
            (isPressed) => Container(
              height: MediaQuery.of(context).size.height * 0.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // gradient: AppColors.blueGradient,
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).breathe,
                    style: theme.headlineMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tap to start',
                    style: theme.labelSmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

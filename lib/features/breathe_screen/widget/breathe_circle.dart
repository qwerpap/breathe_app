import 'package:flutter/material.dart';
import 'package:breathe_app/generated/l10n.dart';
import '../../../theme/app_colors.dart';

class BreatheCircle extends StatelessWidget {
  final double circleSize;
  final String currentPhase;
  final int countdown;
  final int phaseDuration;
  final TextTheme theme;
  final VoidCallback onTap;

  const BreatheCircle({
    super.key,
    required this.circleSize,
    required this.currentPhase,
    required this.countdown,
    required this.phaseDuration,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRunning =
        currentPhase != S.of(context).completed && phaseDuration > 0;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: circleSize + 24,
        width: circleSize + 24,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isRunning)
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: phaseDuration),
                key: ValueKey(currentPhase),
                builder: (context, value, child) {
                  return SizedBox(
                    height: circleSize + 24,
                    width: circleSize + 24,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 12,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.secondaryColor,
                      ),
                    ),
                  );
                },
              ),
            Container(
              height: circleSize,
              width: circleSize,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentPhase.isEmpty ? S.of(context).breathe : currentPhase,
                    style: theme.headlineMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    countdown > 0
                        ? S.of(context).countdown(countdown)
                        : S.of(context).tapToStart,
                    style: theme.labelSmall?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

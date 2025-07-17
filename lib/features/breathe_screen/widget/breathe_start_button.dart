import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class BreatheStartButton extends StatelessWidget {
  const BreatheStartButton({super.key, required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          S.of(context).startBreathe,
          style: theme.labelMedium?.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}

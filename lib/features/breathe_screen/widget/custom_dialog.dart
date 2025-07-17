import 'package:breathe_app/features/breathe_screen/widget/custom_alert_button.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).wellDone,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomAlertButton(
                    title: S.of(context).share,
                    onPressed: () => Navigator.pop(context),
                    buttonStyle: AppStyles.alertButtonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomAlertButton(
                    title: S.of(context).again,
                    textColor: AppColors.whiteColor,
                    onPressed: () => Navigator.pop(context),
                    buttonStyle: AppStyles.alertButtonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

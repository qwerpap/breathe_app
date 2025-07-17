import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class CustomAlertButton extends StatelessWidget {
  const CustomAlertButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.buttonStyle,
    this.textColor,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? textColor;
  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: AutoSizeText(
          title,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: textColor ?? AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

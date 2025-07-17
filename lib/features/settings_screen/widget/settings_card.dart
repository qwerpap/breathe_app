import 'package:breathe_app/theme/theme.dart' as AppColors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.isDarkTheme,
    required this.onChanged,
    required this.value, // <-- сохраняем value
  });

  final String title;
  final bool isDarkTheme; // только для стилей
  final bool value; // <-- управляет переключателем
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textStyle),
          CupertinoSwitch(
            activeColor: AppColors.primaryColor,
            value: value, // <-- используем правильный value
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

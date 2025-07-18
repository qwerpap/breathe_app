import 'package:auto_size_text/auto_size_text.dart';
import 'package:breathe_app/features/breathe_screen/data/models/breathe_model.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectedExercises extends StatelessWidget {
  const SelectedExercises({
    super.key,
    required this.techniques,
    required this.selectedTechniqueIndex,
    required this.onPressed,
  });

  final List<BreatheModel> techniques;
  final int selectedTechniqueIndex;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected exercises',
            style: theme.titleSmall?.copyWith(color: AppColors.whiteColor),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                Icon(
                  size: 22,
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                ),
                const SizedBox(
                  width: 8,
                ), // чтобы был отступ между иконкой и текстом
                Expanded(
                  child: AutoSizeText(
                    techniques[selectedTechniqueIndex].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleMedium?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/exercises_screen/widget/breathe_details_card.dart';
import 'package:breathe_app/features/exercises_screen/widget/selected_exercises.dart';
import 'package:breathe_app/features/global/widgets/show_technique_picker.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  int selectedTechniqueIndex = 0;

  void _showTechniquePicker() {
    final techniques = AppConstants.getTechniques(context);
    showTechniquePicker(
      context: context,
      techniques: techniques,
      selectedIndex: selectedTechniqueIndex,
      onSelected: (index) {
        setState(() => selectedTechniqueIndex = index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final surfaceColor = theme.colorScheme.surface;
    final techniques = AppConstants.getTechniques(context);
    final step = techniques[selectedTechniqueIndex].steps.first;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).exercises),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SelectedExercises(
            techniques: techniques,
            selectedTechniqueIndex: selectedTechniqueIndex,
            onPressed: _showTechniquePicker,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              techniques[selectedTechniqueIndex].description,
              style: textTheme.labelMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: surfaceColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.14),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                BreatheDetailsCard(
                  title: S.of(context).inhale,
                  svg: ImageSource.arrowUp,
                  duration: step.inhale,
                ),
                const Divider(),
                BreatheDetailsCard(
                  title: S.of(context).hold,
                  svg: ImageSource.arrowUp,
                  duration: step.hold,
                ),
                const Divider(),
                BreatheDetailsCard(
                  title: S.of(context).exhale,
                  svg: ImageSource.arrowUp,
                  duration: step.exhale,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

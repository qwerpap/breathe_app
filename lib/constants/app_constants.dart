import 'package:breathe_app/features/breathe_screen/data/models/breathe_model.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const nameApp = 'FlowPause';
  static const versionApp = '1.0.0';

  static List<BreatheModel> getTechniques(BuildContext context) {
    final s = S.of(context);

    return [
      BreatheModel(
        name: s.technique_478_name,
        steps: [BreathStep(inhale: 4, hold: 7, exhale: 8)],
        description: s.technique_478_description,
      ),
      BreatheModel(
        name: s.technique_12_name,
        steps: [
          BreathStep(inhale: 8, hold: 0, exhale: 16),
          BreathStep(inhale: 7, hold: 0, exhale: 14),
          BreathStep(inhale: 6, hold: 0, exhale: 12),
          BreathStep(inhale: 5, hold: 0, exhale: 10),
          BreathStep(inhale: 4, hold: 0, exhale: 8),
          BreathStep(inhale: 3, hold: 0, exhale: 6),
          BreathStep(inhale: 2, hold: 0, exhale: 4),
          BreathStep(inhale: 1, hold: 0, exhale: 2),
        ],
        description: s.technique_12_description,
      ),
      BreatheModel(
        name: s.technique_rectangle_name,
        steps: [
          BreathStep(inhale: 6, hold: 3, exhale: 6),
          BreathStep(inhale: 0, hold: 3, exhale: 0), // задержка после выдоха
        ],
        description: s.technique_rectangle_description,
      ),
      BreatheModel(
        name: s.technique_ujjayi_name,
        steps: [BreathStep(inhale: 5, hold: 0, exhale: 5)],
        description: s.technique_ujjayi_description,
      ),
      BreatheModel(
        name: s.technique_box_name,
        steps: [
          BreathStep(inhale: 4, hold: 4, exhale: 4),
          BreathStep(inhale: 0, hold: 4, exhale: 0), // задержка после выдоха
        ],
        description: s.technique_box_description,
      ),
    ];
  }
}

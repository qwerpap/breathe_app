import 'package:breathe_app/features/breathe_screen/data/models/breathe_model.dart';

class AppConstants {
  static const nameApp = 'FlowPause';
  static const versionApp = '1.0.0';

  static const List<BreatheModel> techniques = [
    BreatheModel(
      name: '4‑7‑8 (Relaxing Breath)',
      steps: [BreathStep(inhale: 4, hold: 7, exhale: 8)],
      description:
          'Simple yet powerful for unwinding, lowering stress, and supporting sleep. Balances your breathing pattern and activates the parasympathetic response to counter stress.\n'
          'Pattern: Inhale 4s → Hold 7s → Exhale 8s.\n'
          'Repeat: 5 cycles.\n'
          'Total time: ~1m 35s.',
    ),
    BreatheModel(
      name: '1:2 (Long Exhale)',
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
      description:
          'A short inhale followed by an exhale twice as long gently engages the parasympathetic system and encourages relaxation. Useful under stress and before sleep.\n'
          'Pattern: Inhale 4s → Exhale 8s.\n'
          'Repeat: 8 cycles.\n'
          'Total time: ~1m 36s.',
    ),
    BreatheModel(
      name: 'Rectangle Breathing',
      steps: [
        BreathStep(inhale: 6, hold: 3, exhale: 6),
        BreathStep(inhale: 0, hold: 3, exhale: 0), // задержка после выдоха
      ],
      description:
          'Longer inhales/exhales paired with brief breath‑holds help even out your breathing, ease tension, and support steady focus. A good steadying rhythm in challenging moments.\n'
          'Pattern: Inhale 6s → Hold 3s → Exhale 6s → Hold 3s.\n'
          'Repeat: 5 cycles.\n'
          'Total time: ~1m 30s.',
    ),
    BreatheModel(
      name: 'Ujjayi',
      steps: [BreathStep(inhale: 5, hold: 0, exhale: 5)],
      description:
          'A traditional yogic method: slow nasal breathing with a light throat constriction that creates a soothing “ocean” sound. Deepens relaxation, sharpens concentration, and syncs breath with movement in yoga—great when you need to ground yourself.\n'
          'Pattern: Inhale 5s → Exhale 5s.\n'
          'Repeat: 10 cycles.\n'
          'Total time: ~1m 40s.',
    ),
    BreatheModel(
      name: 'Box (Square) Breathing',
      steps: [
        BreathStep(inhale: 4, hold: 4, exhale: 4),
        BreathStep(inhale: 0, hold: 4, exhale: 0), // задержка после выдоха
      ],
      description:
          'Equal lengths for inhale, hold, exhale, hold. Stabilizes rhythm, calms the nervous system, and helps you regain control and concentration in stressful situations. The steady tempo feels meditative.\n'
          'Pattern: Inhale 4s → Hold 4s → Exhale 4s → Hold 4s.\n'
          'Repeat: 5 cycles.\n'
          'Total time: ~1m 20s.',
    ),
  ];
}

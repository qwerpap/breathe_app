class BreatheModel {
  final String name;
  final List<BreathStep> steps;
  final String description; // 🆕

  const BreatheModel({
    required this.name,
    required this.steps,
    required this.description,
  });
}

class BreathStep {
  final int inhale;
  final int hold;
  final int exhale;

  const BreathStep({
    required this.inhale,
    required this.hold,
    required this.exhale,
  });
}

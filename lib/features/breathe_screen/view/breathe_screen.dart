import 'dart:async';
import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/features/breathe_screen/data/models/breathe_model.dart';
import 'package:breathe_app/features/breathe_screen/widget/breathe_circle.dart';
import 'package:breathe_app/features/breathe_screen/widget/breathe_start_button.dart';
import 'package:breathe_app/features/breathe_screen/widget/custom_dialog.dart';
import 'package:breathe_app/features/global/history_storage.dart';
import 'package:breathe_app/features/global/utils/fortam_duration.dart';
import 'package:breathe_app/features/global/widgets/show_technique_picker.dart';
import 'package:breathe_app/features/history_screen/data/breathing_history.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BreatheScreen extends StatefulWidget {
  const BreatheScreen({super.key});

  @override
  State<BreatheScreen> createState() => _BreatheScreenState();
}

class _BreatheScreenState extends State<BreatheScreen> {
  int selectedTechniqueIndex = 0;
  final List<BreatheModel> techniques = AppConstants.techniques;
  String _currentPhase = '';
  int _countdown = 0;
  Duration _totalDuration = Duration.zero;
  Timer? _uiTimer;
  Duration _sessionDuration = Duration.zero;
  Timer? _sessionTimer;
  int _phaseDuration = 0;
  DateTime? _sessionStart;
  bool _isBreathing = false;
  bool _shouldStop = false;

  void _startSessionTimer() {
    _sessionTimer?.cancel();
    _sessionStart = DateTime.now();
    _sessionTimer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (!mounted) return;
      setState(() {
        _sessionDuration = DateTime.now().difference(_sessionStart!);
      });
    });
  }

  void _showTechniquePicker() {
    showTechniquePicker(
      context: context,
      techniques: techniques,
      selectedIndex: selectedTechniqueIndex,
      onSelected: (index) {
        setState(() => selectedTechniqueIndex = index);
      },
    );
  }

  void _startBreathing() async {
    if (_isBreathing) return;

    _isBreathing = true;
    _shouldStop = false;

    final tech = techniques[selectedTechniqueIndex];
    _startSessionTimer();
    final startTime = DateTime.now();

    for (final step in tech.steps) {
      if (_shouldStop) break;

      await _runPhase(S.of(context).inhale, step.inhale);
      if (_shouldStop) break;

      if (step.hold > 0) await _runPhase(S.of(context).hold, step.hold);
      if (_shouldStop) break;

      await _runPhase(S.of(context).exhale, step.exhale);
      if (_shouldStop) break;
    }

    final endTime = DateTime.now();
    _stopSessionTimer();

    if (!mounted || _shouldStop) return;

    setState(() {
      _currentPhase = S.of(context).completed;
      _totalDuration = endTime.difference(startTime);
    });

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted || _shouldStop) return;

    HistoryStorage().add(
      BreathingHistory(
        techniqueName: techniques[selectedTechniqueIndex].name,
        dateTime: DateTime.now(),
        duration: _totalDuration,
      ),
    );

    if (!mounted || _shouldStop) return;

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.7),
      builder: (context) => CustomDialog(),
    );

    _isBreathing = false;
  }

  Future<void> _runPhase(String phase, int seconds) async {
    if (!mounted || _shouldStop) return;

    setState(() {
      _currentPhase = phase;
      _countdown = seconds;
      _phaseDuration = seconds;
    });

    for (int i = seconds; i > 0; i--) {
      if (_shouldStop) return;
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted || _shouldStop) return;

      setState(() {
        _countdown = i - 1;
      });
    }
  }

  void _stopUITimer() {
    _uiTimer?.cancel();
  }

  @override
  void dispose() {
    _shouldStop = true; // Останавливаем дыхание
    _stopUITimer();
    _stopSessionTimer();
    super.dispose();
  }

  void _stopSessionTimer() {
    _sessionTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final double circleSize = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).breathe),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              S.of(context).duration,
              style: theme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              _currentPhase == S.of(context).completed
                  ? formatDuration(_totalDuration)
                  : formatDuration(_sessionDuration),
              textAlign: TextAlign.center,
              style: theme.headlineMedium?.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'monospace',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BreatheCircle(
                circleSize: circleSize,
                currentPhase: _currentPhase,
                countdown: _countdown,
                phaseDuration: _phaseDuration,
                theme: theme,
                onTap: _startBreathing,
              ),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).selectBreathingTechnique,
              style: theme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _showTechniquePicker,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    techniques[selectedTechniqueIndex].name,
                    style: theme.labelMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            BreatheStartButton(onPressed: _startBreathing),
          ],
        ),
      ),
    );
  }
}

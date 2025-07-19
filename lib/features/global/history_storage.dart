import 'package:breathe_app/features/history_screen/models/breathing_history.dart';

class HistoryStorage {
  static final HistoryStorage _instance = HistoryStorage._internal();
  factory HistoryStorage() => _instance;
  HistoryStorage._internal();

  final List<BreathingHistory> _history = [];

  List<BreathingHistory> get history => List.unmodifiable(_history);

  void add(BreathingHistory entry) {
    _history.add(entry);
  }

  void clear() {
    _history.clear();
  }
}

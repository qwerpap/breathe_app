import 'package:breathe_app/features/history_screen/database/breathe_items_database.dart';
import 'package:breathe_app/features/history_screen/models/breathing_history.dart';

class BreathingDatabaseHelper {
  final AppDatabase _db;

  BreathingDatabaseHelper(this._db);

  // Добавить новую практику
  Future<void> insertBreathingHistory(BreathingHistory history) async {
    await _db.into(_db.breatheItems).insert(
      BreatheItemsCompanion.insert(
        techniqueName: history.techniqueName,
        duration: history.duration.inSeconds,
        loggedAt: history.dateTime,
      ),
    );
  }

  // Получить все практики
  Future<List<BreathingHistory>> getAllBreathingHistory() async {
    final items = await _db.select(_db.breatheItems).get();

    return items
        .map((item) => BreathingHistory(
              techniqueName: item.techniqueName,
              duration: Duration(seconds: item.duration),
              dateTime: item.loggedAt,
            ))
        .toList();
  }

  // Очистить всю историю
  Future<void> clearHistory() async {
    await _db.delete(_db.breatheItems).go();
  }
}

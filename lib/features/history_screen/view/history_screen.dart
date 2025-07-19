import 'package:breathe_app/features/history_screen/breathe_database_helper.dart';
import 'package:breathe_app/features/history_screen/database/breathe_items_database.dart';
import 'package:flutter/material.dart';
import 'package:breathe_app/features/history_screen/models/breathing_history.dart';
import 'package:breathe_app/features/global/widgets/custom_elevated_button.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/features/history_screen/widget/history_card.dart';
import 'package:breathe_app/generated/l10n.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _dbHelper = BreathingDatabaseHelper(AppDatabase());
  List<BreathingHistory> _localHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistoryFromDB();
  }

  Future<void> _loadHistoryFromDB() async {
    final history = await _dbHelper.getAllBreathingHistory();
    setState(() {
      _localHistory = history;
    });
  }

  Future<void> _clearHistory() async {
    await _dbHelper.clearHistory();
    setState(() {
      _localHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).history),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: CustomElevatedButton(
              title: S.of(context).clearHistory,
              onPressed: _clearHistory,
            ),
          ),
          Expanded(
            child:
                _localHistory.isEmpty
                    ? Center(
                      child: Text(
                        S.of(context).noHistoryYet,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    )
                    : ListView.separated(
                      itemCount: _localHistory.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = _localHistory[index];
                        return HistoryCard(
                          title: item.techniqueName,
                          duration: item.duration,
                          dateTime: item.dateTime,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/auth/services/google_auth.dart';
import 'package:breathe_app/features/history_screen/database/breathe_database_helper.dart';
import 'package:breathe_app/features/history_screen/database/breathe_items_database.dart';
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
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadHistoryIfAuthorized();
  }

  Future<void> _loadHistoryIfAuthorized() async {
    if (auth.currentUser != null) {
      final history = await _dbHelper.getAllBreathingHistory();
      setState(() {
        _localHistory = history;
      });
    }
  }

  Future<void> _clearHistory() async {
    await _dbHelper.clearHistory();
    setState(() {
      _localHistory.clear();
    });
  }

  Future<void> _signInWithGoogle() async {
    final success = await FirebaseServices().signInWithGoogle();
    if (success) {
      await _loadHistoryIfAuthorized();
      setState(() {});
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google Sign-In failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: S.of(context).history),
      ),
      body:
          user == null
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).theHistoryIsAvailablenonlyToAuthorizedUsers,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _signInWithGoogle,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImageSource.googleIcon,
                              height: 20,
                              colorFilter:
                                  isDark
                                      ? const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      )
                                      : null,
                            ),
                            const SizedBox(width: 12),
                            const Text('Continue with Google'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              separatorBuilder:
                                  (_, __) => const SizedBox(height: 16),
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

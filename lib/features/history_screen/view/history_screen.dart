import 'package:breathe_app/features/global/history_storage.dart';
import 'package:breathe_app/features/history_screen/data/breathing_history.dart';
import 'package:breathe_app/features/history_screen/widget/custom_app_bar.dart';
import 'package:breathe_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.history});

  final List<BreathingHistory> history;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<BreathingHistory> _localHistory;

  @override
  void initState() {
    super.initState();
    _localHistory = List.from(widget.history);
  }

  void _clearHistory() {
    setState(() {
      HistoryStorage().clear();
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
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          S.of(context).theHistoryIsAvailablenonlyToAuthorizedUsers,
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


//  Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             child: CustomElevatedButton(
//               title: S.of(context).clearHistory,
//               onPressed: _clearHistory,
//             ),
//           ),
//           Expanded(
//             child:
//                 _localHistory.isEmpty
//                     ? Center(
//                       child: Text(
//                         S.of(context).noHistoryYet,
//                         style: Theme.of(context).textTheme.labelMedium,
//                       ),
//                     )
//                     : ListView.separated(
//                       itemCount: _localHistory.length,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       separatorBuilder: (_, __) => const SizedBox(height: 16),
//                       itemBuilder: (context, index) {
//                         final item = _localHistory[index];
//                         return HistoryCard(
//                           title: item.techniqueName,
//                           duration: item.duration,
//                           dateTime: item.dateTime,
//                         );
//                       },
//                     ),
//           ),
//         ],
//       ),
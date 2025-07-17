import 'package:breathe_app/features/global/utils/fortam_duration.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final Duration duration;
  final DateTime dateTime;

  const HistoryCard({
    super.key,
    required this.title,
    required this.duration,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.textTheme.titleMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text('Duration:'), Text(formatDuration(duration))],
          ),
        ],
      ),
    );
  }
}

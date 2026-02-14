import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/format_date.dart';
import 'package:flutter/material.dart';

class DateWatchedSection extends StatelessWidget {
  const DateWatchedSection({
    super.key,
    required this.watchedDate,
    required this.onTap,
  });

  final DateTime? watchedDate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date Watched', style: AppTextStyle.largeWhite),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0x50364153),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  watchedDate == null
                      ? 'Select date'
                      : formatDateToReadable(watchedDate!.toIso8601String()),
                  style: AppTextStyle.largeWhite.copyWith(
                    color: watchedDate == null ? Colors.grey : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

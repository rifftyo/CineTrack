import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/format_date.dart';
import 'package:flutter/material.dart';

class DateWatchedSection extends StatelessWidget {
  const DateWatchedSection({
    super.key,
    required this.watchedDate,
    required this.onTap,
    this.isEnabled = true,
  });

  final DateTime? watchedDate;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0x50364153),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                watchedDate != null
                    ? formatDateToReadable(
                        watchedDate!.toIso8601String(),
                      )
                    : 'Select watched date',
                style: AppTextStyle.mediumWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

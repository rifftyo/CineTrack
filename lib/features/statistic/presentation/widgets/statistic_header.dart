import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class StatisticHeader extends StatelessWidget {
  const StatisticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Text('Statistics', style: AppTextStyle.xLargeWhite),
      ],
    );
  }
}

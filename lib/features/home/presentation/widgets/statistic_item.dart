import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.value,
    required this.asset,
    required this.desc,
  });

  final String value;
  final String asset;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0X801E2939),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(asset),
            const SizedBox(height: 10),
            Text(
              value,
              style: AppTextStyle.xxxLargeWhite.copyWith(fontSize: 35),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: AppTextStyle.largeWhite.copyWith(color: Color(0xFF99A1AF)),
            ),
          ],
        ),
      ),
    );
  }
}

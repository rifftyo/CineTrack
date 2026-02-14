import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFFAF99A0)),
        color: Color(0X30AD46FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.purple, size: 30),
          const SizedBox(height: 10),
          Text(value, style: AppTextStyle.xxxLargeWhite.copyWith(fontSize: 36)),
          const SizedBox(height: 10),
          Text(
            label,
            style: AppTextStyle.mediumWhite.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/statistic/domain/entities/rating_distribution.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RatingDistributionChart extends StatelessWidget {
  final List<RatingDistribution> data;

  const RatingDistributionChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BarChart(
        BarChartData(
          maxY: _getMaxY(),
          barGroups: _barGroups(),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: _titlesData(),
          barTouchData: BarTouchData(enabled: false),
          alignment: BarChartAlignment.spaceAround,
        ),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  double _getMaxY() {
    final max = data.map((e) => e.count).reduce((a, b) => a > b ? a : b);
    return max.toDouble() + 1;
  }

  List<BarChartGroupData> _barGroups() {
    return data.map((e) {
      return BarChartGroupData(
        x: e.rating.toInt(),
        barRods: [
          BarChartRodData(
            toY: e.count.toDouble(),
            width: 16,
            borderRadius: BorderRadius.circular(6),
            color: AppColors.softPurple,
          ),
        ],
      );
    }).toList();
  }

  FlTitlesData _titlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toInt().toString(),
              style: AppTextStyle.smallWhite,
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text('${value.toInt()}★', style: AppTextStyle.smallWhite);
          },
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}

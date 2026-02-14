import 'package:cinetrack/core/utils/short_month.dart';
import 'package:cinetrack/features/statistic/domain/entities/monthly.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyBarChart extends StatelessWidget {
  final List<Monthly> data;

  const MonthlyBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _getMaxY(),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: _titlesData(),
          barGroups: _barGroups(),
        ),
      ),
    );
  }

  double _getMaxY() {
    final max = data.map((e) => e.count).reduce((a, b) => a > b ? a : b);
    return max.toDouble() + 5;
  }

  List<BarChartGroupData> _barGroups() {
    return List.generate(data.length, (index) {
      final value = data[index].count.toDouble();

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            width: 14,
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
              colors: [Color(0xFFB388FF), Color(0xFF7C4DFF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      );
    });
  }

  FlTitlesData _titlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 30),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final index = value.toInt();

            if (index < 0 || index >= data.length) {
              return const SizedBox();
            }

            return Text(
              shortMonth(data[index].month),
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            );
          },
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}

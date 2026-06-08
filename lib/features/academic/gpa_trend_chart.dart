import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tlu_students/shared/extensions/build_context_extension.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class GpaTrendChart extends StatelessWidget {
  final List<double> history;
  final List<String> semesterNames;

  const GpaTrendChart({
    super.key,
    required this.history,
    required this.semesterNames,
  });

  String _formatSemesterName(String name) {
    final regExp = RegExp(r'[Hh]ọc\s+kỳ\s+(\d+)');
    final match = regExp.firstMatch(name);
    if (match != null) {
      return 'HK ${match.group(1)}';
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final bool isSinglePoint = history.length == 1;

    // Calculate trend dynamically
    double trend = 0.0;
    if (history.length >= 2) {
      trend = history.last - history[history.length - 2];
    }

    // Determine subtitle and trend colors/icons
    final String subtitleText;
    final Color trendColor;
    final IconData headerIcon;

    if (isSinglePoint) {
      subtitleText = 'academic.gpa_single_semester'.tr();
      trendColor = context.colors.tluBlueColor;
      headerIcon = Icons.analytics_outlined;
    } else {
      if (trend > 0) {
        subtitleText = 'academic.gpa_increase'.tr(args: [trend.toStringAsFixed(2)]);
        trendColor = context.colors.tluBlueColor;
        headerIcon = Icons.trending_up_rounded;
      } else if (trend < 0) {
        subtitleText = 'academic.gpa_decrease'.tr(args: [trend.abs().toStringAsFixed(2)]);
        trendColor = context.colors.tluRedColor;
        headerIcon = Icons.trending_down_rounded;
      } else {
        subtitleText = 'academic.gpa_no_change'.tr();
        trendColor = Colors.grey.shade600;
        headerIcon = Icons.trending_flat_rounded;
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, subtitleText, trendColor, headerIcon),
          const SizedBox(height: 24),
          _buildChartArea(context, isSinglePoint),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    String subtitleText,
    Color trendColor,
    IconData headerIcon,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: trendColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(headerIcon, color: trendColor, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'academic.gpa_trend'.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitleText,
                style: TextStyle(
                  color: trendColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChartArea(BuildContext context, bool isSinglePoint) {
    // If single point, center it at X=1 on a range of 0 to 2
    const double minX = 0;
    final double maxX = isSinglePoint ? 2 : (history.length - 1).toDouble();

    return SizedBox(
      height: 120, // Increased slightly for better label padding
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 10,
          minX: minX,
          maxX: maxX,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 2.0,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.06),
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: 2.0,
                getTitlesWidget: (value, meta) {
                  if (value == 0 || value > 10) return const SizedBox.shrink();
                  return Text(
                    value.toStringAsFixed(0),
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: 1.0,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (isSinglePoint) {
                    if (index == 1 && semesterNames.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          _formatSemesterName(semesterNames[0]),
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }

                  if (index >= 0 && index < semesterNames.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        _formatSemesterName(semesterNames[index]),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: context.colors.tluBlueColor,
              tooltipRoundedRadius: 8,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    touchedSpot.y.toStringAsFixed(2),
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: isSinglePoint
                  ? [
                      FlSpot(0.0, history[0]),
                      FlSpot(1.0, history[0]),
                      FlSpot(2.0, history[0]),
                    ]
                  : history
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value))
                      .toList(),
              isCurved: !isSinglePoint,
              color: context.colors.tluBlueColor,
              barWidth: 3.5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                checkToShowDot: (spot, barData) {
                  if (isSinglePoint) {
                    return spot.x == 1.0;
                  }
                  return true;
                },
                getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                  radius: 6,
                  color: Colors.white,
                  strokeWidth: 3,
                  strokeColor: context.colors.tluRedColor,
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    context.colors.tluBlueColor.withOpacity(0.15),
                    context.colors.tluBlueColor.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

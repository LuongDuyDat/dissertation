import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../domain/entities/chart_statistic.dart';
import '../util/global.dart';
import '../util/theme.dart';
import 'indicator.dart';

class PieChartCreditStatistic extends StatelessWidget {
  const PieChartCreditStatistic({super.key, required this.chartStatistic, this.radius, this.chartName,});

  final List<ChartStatistic> chartStatistic;
  final double? radius;
  final String? chartName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.65 * screenWidth,
      height: chartName != null ? 0.22 * screenHeight : 0.28 * screenHeight,
      child: Column(
        children: [
          chartName != null
              ? Text(chartName!, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700, color: const Color(0xFF651e3e)),)
              : const SizedBox(),
          SizedBox(height: chartName != null ? 0.01 * screenHeight : 0,),
          SizedBox(
            width: 0.6 * screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                chartStatistic.length,
                    (index) {
                  return Indicator(
                    color: chartLightColor.elementAt(index),
                    text: chartStatistic.elementAt(index).label,
                    isSquare: false,
                    size: 0.0172 * screenHeight,
                    textColor: textLightColor,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 0.01 * screenHeight,),
          SizedBox(
            height: chartName != null ? 0.2 * screenHeight : 0.25 * screenHeight,
            child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: radius ?? 0,
                  sections: showingSections(chartStatistic, context),
                )
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(List<ChartStatistic> chartStatistic, BuildContext context) {
    double total = 0;
    for (var item in chartStatistic) {
      total = total + item.creditNumber;
    }

    return List.generate(
      chartStatistic.length,
          (index) {
        return PieChartSectionData(
          color: chartLightColor.elementAt(index),
          value: chartStatistic.elementAt(index).creditNumber.toDouble(),
          title: '${(chartStatistic.elementAt(index).creditNumber / total * 100).round().toString()}%',
          titlePositionPercentageOffset: 0.55,
          titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, color: backgroundLightColor2),
          radius: 0.08 * screenHeight,
        );
      },
    );
  }

}
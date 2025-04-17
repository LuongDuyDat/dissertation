import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/domain/entities/chart_statistic.dart';
import 'package:learning_intern_support_system/screen/learning_process/detail_learning_process.dart';
import 'package:learning_intern_support_system/screen/learning_process/on_plan.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../component/pie_chart.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

int totalCredit = 156;
int finishedCredit = 100;
int retakeCredit = 6;
int improvableCredit = 20;
int onPlanCredit = 21;

List<ChartStatistic> figureOfCreditByProgress = [
  ChartStatistic(label: finishedCreditShortString, creditNumber: finishedCredit),
  ChartStatistic(label: unlearnedCreditShortString, creditNumber: totalCredit - finishedCredit - retakeCredit),
  ChartStatistic(label: retakeCreditShortString, creditNumber: retakeCredit),
];

List<ChartStatistic> figureOfImprovableCreditByProgress = [
  ChartStatistic(label: improvableCreditShortString, creditNumber: improvableCredit),
  ChartStatistic(label: unimprovableCreditShortString, creditNumber: finishedCredit - improvableCredit),
];

List<ChartStatistic> detailLearningProcess = [
  ChartStatistic(label: mandatoryString, creditNumber: 20),
  ChartStatistic(label: optionalString, creditNumber: 25),
  ChartStatistic(label: supplementaryString, creditNumber: 15),
];

class LearningProcessStatisticalPage extends StatelessWidget {
  const LearningProcessStatisticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.01 * screenHeight,),
            Text(statisticalString, style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 0.004 * screenHeight,),
            Text(studyProcessString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText, fontWeight: FontWeight.w500),),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.04 * screenHeight,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: double.infinity,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                child: Text(statisticalChartString, style: Theme.of(context).textTheme.headlineMedium,),
              ),
              SizedBox(height: 0.04 * screenHeight,),
              CarouselSlider(
                items: [
                  PieChartCreditStatistic(chartStatistic: figureOfCreditByProgress,chartName: figureForCreditByProgressString,),
                  PieChartCreditStatistic(chartStatistic: figureOfImprovableCreditByProgress, chartName: figureForImprovableCreditString,),
                ],
                options: CarouselOptions(
                  height: 0.32 * screenHeight,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                  child: Wrap(
                    runSpacing: 0.032 * screenHeight,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      StatisticBox(
                        label: totalCreditString,
                        creditNumber: totalCredit,
                        color: const Color(0xFF2196F3),
                        onTap: () {
                          Navigate.pushNewScreen(
                            context,
                            DetailLearningProcess(title: totalCreditString, chartStatistic: detailLearningProcess),
                            true,
                          );
                        },
                      ),
                      StatisticBox(
                        label: finishedCreditShortString,
                        creditNumber: finishedCredit,
                        color: const Color(0xFF00DFA2),
                        onTap: () {
                          Navigate.pushNewScreen(
                            context,
                            DetailLearningProcess(title: finishedCreditString, chartStatistic: detailLearningProcess),
                            true,
                          );
                        },
                      ),
                      StatisticBox(
                        label: unFinishedCreditShortString,
                        creditNumber: totalCredit - finishedCredit,
                        color: const Color(0xFFFF683B),
                        onTap: () {
                          Navigate.pushNewScreen(
                            context,
                            DetailLearningProcess(title: unFinishedCreditString, chartStatistic: detailLearningProcess),
                            true,
                          );
                        },
                      ),
                      StatisticBox(
                        label: retakeCreditShortString,
                        creditNumber: retakeCredit,
                        color: const Color(0xFFFF0060),
                        onTap: () {
                          Navigate.pushNewScreen(
                            context,
                            DetailLearningProcess(title: retakeCreditString, chartStatistic: detailLearningProcess),
                            true,
                          );
                        },
                      ),
                      StatisticBox(
                        label: improvableCreditShortString,
                        creditNumber: improvableCredit,
                        color: const Color(0xFF6E1BFF),
                        onTap: () {
                          Navigate.pushNewScreen(
                            context,
                            DetailLearningProcess(title: finishedCreditString, chartStatistic: detailLearningProcess),
                            true,
                          );
                        },
                      ),
                      StatisticBox(
                        label: onPlanCreditShortString,
                        creditNumber: 0,
                        color: const Color(0xFFFFC300),
                        onTap: () {
                          Navigate.pushNewScreen(context, const OnPlanLearningProcessPage(), true);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.1 * screenHeight,),
            ],
          ),
        )
      ),
    );
  }

}

class StatisticBox extends StatelessWidget {
  final String label;
  final int creditNumber;
  final Color color;
  final Function()? onTap;

  const StatisticBox({super.key, required this.label, required this.creditNumber, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 0.4 * screenWidth,
        height: 0.4 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.012 * screenHeight),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundLightColor2, fontWeight: FontWeight.w500),),
            Text(
              creditNumber.toString(),
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: backgroundLightColor2, fontWeight: FontWeight.w700,),
            ),
          ],
        ),
      ),
    );
  }
}
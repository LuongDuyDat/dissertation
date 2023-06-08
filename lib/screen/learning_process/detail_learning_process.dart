import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';

import '../../component/module_tile.dart';
import '../../component/pie_chart.dart';
import '../../model/chart_statistic.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/strings.dart';
import '../../util/theme.dart';
import '../training_program/modules.dart';

class DetailLearningProcess extends StatelessWidget {
  const DetailLearningProcess({super.key, required this.title, required this.chartStatistic});

  final String title;
  final List<ChartStatistic> chartStatistic;

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
        title: Text(title, style: Theme.of(context).textTheme.headlineMedium,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(statisticalChartString, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: 0.04 * screenHeight,),
              Align(
                alignment: Alignment.center,
                child: PieChartCreditStatistic(chartStatistic: chartStatistic, radius: 0.04 * screenHeight,),
              ),
              SizedBox(height: 0.03 * screenHeight,),
              ViewModuleListTile(
                label: mandatoryModuleString,
                creditNumber: 25,
                suffixIcon: Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,),
              ),
              SizedBox(height: 0.0194 * screenHeight,),
              SizedBox(
                height: 0.36 * screenHeight,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: ModuleTile(
                        moduleId: moduleList.elementAt(index).moduleId,
                        moduleName: moduleList.elementAt(index).moduleName,
                        numberOfCredit: moduleList.elementAt(index).creditNumber,
                      ),
                    );
                  },
                  itemCount: moduleList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 0.0194 * screenHeight,);
                  },
                ),
              ),
              SizedBox(height: 0.032 * screenHeight,),
              ViewModuleListTile(
                label: optionalModuleString,
                creditNumber: 25,
                suffixIcon: Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
              ),
              SizedBox(height: 0.032 * screenHeight,),
              ViewModuleListTile(
                label: supplementaryModuleString,
                creditNumber: 15,
                suffixIcon: Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
              ),
              SizedBox(height: 0.05 * screenHeight,),
            ],
          ),
        ),
      ),
    );
  }

}
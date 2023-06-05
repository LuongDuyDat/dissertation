import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/training_program/expected_learning_outcome.dart';
import 'package:learning_intern_support_system/screen/training_program/general_information.dart';
import 'package:learning_intern_support_system/screen/training_program/goal.dart';
import 'package:learning_intern_support_system/screen/training_program/learning_process.dart';
import 'package:learning_intern_support_system/screen/training_program/modules.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

class TrainingProgramPage extends StatelessWidget {
  const TrainingProgramPage({super.key, required this.programName});

  final String programName;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundLightColor2,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigate.popPage(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.download_rounded),
            ),
            SizedBox(width: 0.04 * screenWidth,),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.01 * screenHeight,),
              Text(programName, style: Theme.of(context).textTheme.displaySmall,),
              SizedBox(height: 0.004 * screenHeight,),
              Text(trainingProgramString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText, fontWeight: FontWeight.w500),),
            ],
          ),
          bottom: const BottomTabBar(),
          elevation: 0,
        ),
        body: const TabBarView(
          children: [
            GeneralInformationPage(),
            GoalPage(),
            ModulesPage(),
            ExpectedLearningOutcomePage(),
            LearningProcessPage(),
          ],
        ),
      ),
    );
  }

}

class BottomTabBar extends StatelessWidget with PreferredSizeWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 0.024 * screenWidth,),
      tabs: [
        Tab(
          text: generalInformationString,
        ),
        Tab(
          text: goalString,
        ),
        Tab(
          text: moduleString,
        ),
        Tab(
          text: expectedLearningOutcomeString,
        ),
        Tab(
          text: learningProcessString,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight / 15);

}
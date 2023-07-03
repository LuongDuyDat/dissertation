import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/global.dart';
import '../../util/theme.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundLightColor2,
        appBar: AppBar(
          leading: SizedBox(width: 0.056 * screenWidth,),
          leadingWidth: 0.056 * screenWidth,
          titleSpacing: 0,
          title: Text(scheduleString),
          bottom: const BottomTabBar(),
        ),
        body: const TabBarView(
          children: [
            ScheduleTimetablePage(),
            ScheduleTermPage(),
          ],
        ),
      ),
    );
  }

}

class BottomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: timetableString,
        ),
        Tab(
          text: termString,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight / 15);

}
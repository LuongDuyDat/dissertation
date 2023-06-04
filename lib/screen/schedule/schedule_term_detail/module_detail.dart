import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/add_class.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../util/global.dart';
import '../../../util/navigate.dart';
import '../../../util/theme.dart';

class ModuleDetailPage extends StatelessWidget {
  const ModuleDetailPage({super.key, required this.name});

  final String name;

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
        actions: [
          IconButton(
            onPressed: () {
              Navigate.pushNewScreen(context, const AddClassPage(), true);
            },
            icon: const Icon(Icons.add),
          ),
          SizedBox(width: 0.04 * screenWidth,),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.01 * screenHeight,),
            Text(name, style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 0.004 * screenHeight,),
            Text(moduleString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText, fontWeight: FontWeight.w500),),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, bottom: 0.0216 * screenHeight),
              child: Text(classesString, style: Theme.of(context).textTheme.headlineMedium,),
            ),
            classTile(
              context,
              lectureString,
              DateTime.now().subtract(const Duration(hours: 2)),
              DateTime.now(),
              3,
              'PM313 G2',
            ),
            classTile(
              context,
              practicalString,
              DateTime.now().subtract(const Duration(hours: 2)),
              DateTime.now(),
              1,
              '307 GD2',
            ),
          ],
        ),
      ),
    );
  }

  Widget classTile(BuildContext context, String type, DateTime start, DateTime end, int dayOfWeek, String location) {
    return Container(
      width: double.infinity,
      height: 0.108 * screenHeight,
      decoration: BoxDecoration(
        color: secondaryLightColor.withOpacity(0.1),
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.horizontal(),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth, vertical: 0.008 * screenHeight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  color: hintLightText2,
                  width: 0.054 * screenHeight,
                  height: 0.054 * screenHeight,
                  child: Icon(
                    type == lectureString ? Icons.book : Icons.desktop_windows,
                    size: 0.03 * screenHeight,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 0.0374 * screenWidth,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(type, style: Theme.of(context).textTheme.bodyMedium,),
                    Text(
                      '${start.toString().substring(11, 16)} - ${end.toString().substring(11, 16)}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(daysOfWeek.elementAt(dayOfWeek), style: Theme.of(context).textTheme.bodyMedium,),
                    Text(location, style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 0.03 * screenHeight,),
          ],
        ),
      ),
    );
  }
}
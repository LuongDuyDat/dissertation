import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/add_class/add_class.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_state.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../../util/global.dart';
import '../../../../util/navigate.dart';
import '../../../../util/theme.dart';

class ModuleDetailPage extends StatelessWidget {
  const ModuleDetailPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModuleDetailBloc(),
      child: ModuleDetailView(name: name,),
    );
  }
}

class ModuleDetailView extends StatelessWidget {
  const ModuleDetailView({super.key, required this.name,});
  
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
              Navigate.pushNewScreen(context, AddClassPage(type: 0, previousContext: context,), true);
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
      body: BlocBuilder<ModuleDetailBloc, ModuleDetailState>(
        builder: (context, state) {
          if (state.loadStatus == ModuleDetailStatus.initial) {
            context.read<ModuleDetailBloc>().add(const ModuleDetailInit());
            return const Center();
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, bottom: 0.0216 * screenHeight),
                  child: Text(classesString, style: Theme.of(context).textTheme.headlineMedium,),
                ),
                state.loadStatus == ModuleDetailStatus.loading ?
                    const Center(child: CircularProgressIndicator(),) :
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return classTile(
                          context,
                          index,
                          state.classScheduleList.elementAt(index).category,
                          state.classScheduleList.elementAt(index).startTime,
                          state.classScheduleList.elementAt(index).endTime,
                          state.classScheduleList.elementAt(index).numberRepeat,
                          state.classScheduleList.elementAt(index).unitRepeat,
                          state.classScheduleList.elementAt(index).dayOfWeek,
                          state.classScheduleList.elementAt(index).lecturer,
                          state.classScheduleList.elementAt(index).location,
                        );
                      },
                      itemCount: state.classScheduleList.length,
                    ),
                //failure processing
                state.loadStatus == ModuleDetailStatus.failure ?
                    const SizedBox() : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget classTile(BuildContext context, int index, String type, TimeOfDay start, TimeOfDay end, int numberRepeat, String unitRepeat, int? dayOfWeek, String lecturer, String location) {
    return InkWell(
      onTap: () {
        Navigate.pushNewScreen(context, AddClassPage(
          type: 1,
          category: type,
          from: start,
          to: end,
          numberRepeat: numberRepeat,
          unitRepeat: unitRepeat,
          dayOfWeek: dayOfWeek,
          lecturer: lecturer,
          location: location,
          previousContext: context,
          index: index,
        ), true);
      },
      child: Container(
        width: double.infinity,
        height: 0.115 * screenHeight,
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
                        '${start.toString().substring(10, 15)} - ${end.toString().substring(10, 15)}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                      ),
                      dayOfWeek != null ? Text(daysOfWeek.elementAt(dayOfWeek), style: Theme.of(context).textTheme.bodyMedium,)
                          : Text('$everyString $numberRepeat $unitRepeat'),
                      Text(lecturer, style: Theme.of(context).textTheme.bodyMedium,),
                      Text(location, style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 0.03 * screenHeight,),
            ],
          ),
        ),
      ),
    );
  }
}
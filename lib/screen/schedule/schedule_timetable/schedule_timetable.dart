import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable/bloc/schedule_timetable_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable/bloc/schedule_timetable_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable/bloc/schedule_timetable_state.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleTimetablePage extends StatelessWidget {
  const ScheduleTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleTimetableBloc(),
      child: const ScheduleTimetableView(),
    );
  }
}

class ScheduleTimetableView extends StatelessWidget {
  const ScheduleTimetableView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleTimetableBloc, ScheduleTimetableState>(
      buildWhen: (previous, current) {
        return previous.focusDay != current.focusDay;
      },
      builder: (context, state) {
        if (state.focusDay == null) {
          context.read<ScheduleTimetableBloc>().add(const ScheduleTimetableInit());
          return const Center();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 0.056 * screenWidth, right: 0.056 * screenWidth, top: 0.037 * screenHeight,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // co the them event
                  child: TableCalendar(
                    focusedDay: state.focusDay!,
                    currentDay: state.focusDay!,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    calendarFormat: CalendarFormat.month,
                    onDaySelected: ((selectedDay, focusedDay) {
                      context.read<ScheduleTimetableBloc>().add(ScheduleTimetableChangeFocusDay(dateTime: selectedDay));
                      focusedDay = selectedDay;
                    }),
                    calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          shape: BoxShape.circle,
                        ),
                        weekendTextStyle: TextStyle(color: Theme.of(context).highlightColor,)
                    ),
                  ),
                ),
                SizedBox(height: 0.027 * screenHeight,),
                InkWell(
                  onTap: () {
                    Navigate.pushNewScreen(context, const TimetableAddPage(), true);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        radius: 0.0216 * screenHeight,
                        child: Icon(Icons.add, color: backgroundLightColor2, size: screenHeight * 0.03,),
                      ),
                      SizedBox(width: 0.0234 * screenWidth,),
                      Text(addTimetableString, style: Theme.of(context).textTheme.titleLarge,)
                    ],
                  ),
                ),
                SizedBox(height: 0.0237 * screenHeight,),
                BlocBuilder<ScheduleTimetableBloc, ScheduleTimetableState>(
                  buildWhen: (previous, current) {
                    return previous.eventStatus != current.eventStatus;
                  },
                  builder: (context, state) {
                    switch(state.eventStatus) {
                      case ScheduleTimeTableStatus.initial:
                        context.read<ScheduleTimetableBloc>().add(const ScheduleTimetableGetEvent());
                        return const Center();
                      case ScheduleTimeTableStatus.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ScheduleTimeTableStatus.success:
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return timetableTile(
                              context,
                              state.eventList.elementAt(index).startTime,
                              state.eventList.elementAt(index).endTIme,
                              state.eventList.elementAt(index).type,
                              state.eventList.elementAt(index).title,
                              state.eventList.elementAt(index).description,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 0.026 * screenHeight,);
                          },
                          itemCount: state.eventList.length,
                        );
                      default:
                        //todo: failure processing
                        return const Center();
                    }
                  },
                ),
                SizedBox(height: 0.03 * screenHeight,),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget timetableTile(BuildContext context, String? start, String end, int type, String title, String? description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(start ?? shortDeadlineString, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),),
            SizedBox(height: 0.0075 * screenHeight,),
            Text(end, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),),
          ],
        ),
        SizedBox(width: 0.0257 * screenWidth,),
        SizedBox(
          height: 0.0734 * screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: type == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 0.0216 * screenHeight,
                    child: Icon(
                      type == 0 ? Icons.school : Icons.assignment,
                      color: backgroundLightColor2,
                      size: screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(width: 0.03 * screenWidth,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        type == 0 ? classString2 : assignmentString,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: type == 0 ? 0.0112 * screenHeight : 0.00364 * screenHeight,),
                      Text(title, style: Theme.of(context).textTheme.bodyLarge,),
                      SizedBox(height: type == 0 ?  0.003 * screenHeight : 0.005 * screenHeight),
                      type == 0 ? const SizedBox() : SizedBox(
                        width: 0.6238 * screenWidth,
                        child: Text(
                          description!,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 0.778 * screenWidth,
                height: 1,
                color: Theme.of(context).scaffoldBackgroundColor,
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../util/global.dart';
import '../util/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: SizedBox(width: 0.056 * screenWidth,),
        leadingWidth: 0.056 * screenWidth,
        titleSpacing: 0,
        title: Text(notificationString),
        actions: [
          Column(
            children: [
              SizedBox(height: 0.022 * screenHeight),
              Text(
                markAllString,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal,),
              ),
            ],
          ),
          SizedBox(width: 0.05 * screenWidth,),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.03 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newString,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 0.01 * screenHeight, width: double.infinity,),
                ],
              ),
            ),
            NotificationWidget(
              type: 1,
              isRead: false,
              title: 'đã chấp nhận yêu cầu thực tập của bạn',
              dateTime: DateTime.now(),
              company: 'Viettel',
            ),
            NotificationWidget(
              type: 2,
              isRead: true,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            NotificationWidget(
              type: 3,
              isRead: false,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.03 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    earlierString,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 0.01 * screenHeight, width: double.infinity,),
                ],
              ),
            ),
            NotificationWidget(
              type: 1,
              isRead: true,
              title: 'đã chấp nhận yêu cầu thực tập của bạn',
              dateTime: DateTime.now(),
              company: 'Viettel',
            ),
            NotificationWidget(
              type: 2,
              isRead: false,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            NotificationWidget(
              type: 3,
              isRead: false,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            NotificationWidget(
              type: 1,
              isRead: true,
              title: 'đã chấp nhận yêu cầu thực tập của bạn',
              dateTime: DateTime.now(),
              company: 'Viettel',
            ),
            NotificationWidget(
              type: 2,
              isRead: true,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            NotificationWidget(
              type: 3,
              isRead: true,
              title: 'Công nghệ phầm mềm - 102 G3',
              dateTime: DateTime.now(),
            ),
            SizedBox(height: 0.01 * screenHeight),
          ],
        ),
      )
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.type,
    required this.isRead,
    required this.title,
    this.company,
    required this.dateTime,
  });

  //type = 1: intern, type = 2: schedule, type = 3: notification
  final int type;
  final bool isRead;
  final String title;
  final String? company;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth,),
      height: 0.108 * screenHeight,
      color: isRead ? backgroundLightColor2 : Theme.of(context).primaryColor.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 0.0432 * screenHeight,
              ),
              Positioned(
                top: 0.056 * screenHeight,
                left: 0.056 * screenHeight,
                child: CircleAvatar(
                  backgroundColor: type == 3
                      ? Theme.of(context).primaryColor
                      : (type == 2 ? const Color(0xFFDC143C) : const Color(0xFF3DED97)),
                  radius: 0.0162 * screenHeight,
                  child: type == 3
                      ? Icon(Icons.notifications, color: backgroundLightColor2, size: 0.02 * screenHeight,)
                      : (type == 2
                      ? Icon(Icons.calendar_month, color: backgroundLightColor2, size: 0.02 * screenHeight,)
                      : Icon(Icons.work, color: backgroundLightColor2, size: 0.02 * screenHeight,)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 0.023 * screenWidth,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 0.613 * screenWidth,
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: company ?? (type == 2 ? '$scheduleString:' : '$notificationString:'),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: ' $title',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal,),
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.0162 * screenHeight,),
              Row(
                children: [
                  Text(
                    type == 3 ? notificationString : (type == 2 ? scheduleString : internString),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: hintLightText2),),
                  SizedBox(width: 0.02 * screenWidth,),
                  Container(
                    width: 0.005 * screenHeight,
                    height: 0.005 * screenHeight,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 0.02 * screenWidth,),
                  Text(
                    dateTime.toString().substring(0, 10),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: hintLightText2),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.more_horiz, size: 0.03 * screenHeight,),
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../util/theme.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({super.key, required this.title, this.onChange, this.time,});

  final String title;
  final Function(TimeOfDay?)? onChange;
  final TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        final TimeOfDay? result = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          cancelText: cancelString,
        );
        if (onChange != null) {
          onChange!(result);
        }
      },
      child: SizedBox(
        height: 0.06 * screenHeight,
        width: 0.418 * screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(thickness: 1, color: backgroundLightColor2, height: 1,),
            Padding(
              padding: EdgeInsets.only(left: 0.023 * screenWidth, right: 0.01 * screenWidth,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.timer, size: 0.03 * screenHeight, color: hintLightText2,),
                      SizedBox(width: 0.019 * screenWidth,),
                      time != null ?
                          Text('${time!.hour}:${time!.minute}', style: Theme.of(context).textTheme.bodyLarge) :
                          Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),),
                    ],
                  ),
                  Icon(Icons.arrow_drop_down, size: 0.05 * screenHeight, color: hintLightText2,),
                ],
              ),
            ),
            Divider(thickness: 1, color: hintLightText2, height: 1,),
          ],
        ),
      ),
    );
  }

}
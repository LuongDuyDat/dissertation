import 'package:flutter/material.dart';

import '../util/global.dart';
import '../util/strings.dart';
import '../util/theme.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final Function(DateTime?)? onChange;
  final DateTime? date;

  const DatePicker({super.key, required this.title, this.onChange, this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        final DateTime? result = await showDatePicker(
          context: context,
          cancelText: cancelString,
          initialDate: DateTime.now(),
          firstDate: DateTime.utc(2010, 10, 16),
          lastDate: DateTime.utc(2030, 3, 14),
        );
        if (onChange != null) {
          onChange!(result);
        }
      },
      child: SizedBox(
        height: 0.06 * screenHeight,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(thickness: 1, color: backgroundLightColor2, height: 1,),
            Padding(
              padding: EdgeInsets.only(left: 0.026 * screenWidth, right: 0.01 * screenWidth,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month, size: 0.03 * screenHeight, color: hintLightText2,),
                  SizedBox(width: 0.023 * screenWidth,),
                  date != null ?
                  Text('${date!.day}/${date!.month}/${date!.year}', style: Theme.of(context).textTheme.bodyLarge) :
                  Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),),
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
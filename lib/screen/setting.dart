import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../util/global.dart';
import '../util/navigate.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
        title: Text(settingString),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.language, size: 0.04 * screenHeight,),
                SizedBox(width: 0.04 * screenWidth,),
                Text(languageString, style: Theme.of(context).textTheme.displaySmall,),
              ],
            ),
            Divider(thickness: 1, color: textLightColor, height: 0.03 * screenHeight,),
            Padding(
              padding: EdgeInsets.only(left: 0.04 * screenWidth, right: 0.056 * screenWidth,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.33 * screenWidth,
                    ),
                    child: RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      value: vietnameseString,
                      groupValue: vietnameseString,
                      activeColor: Theme.of(context).primaryColor,
                      title: Transform.translate(
                        offset: Offset(-0.035 * screenWidth, 0),
                        child: Text(vietnameseString, style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.33 * screenWidth,
                    ),
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: englishString,
                      groupValue: vietnameseString,
                      activeColor: Theme.of(context).primaryColor,
                      title: Transform.translate(
                        offset: Offset(-0.035 * screenWidth, 0),
                        child: Text(englishString, style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Row(
              children: [
                Icon(Icons.dark_mode, size: 0.04 * screenHeight,),
                SizedBox(width: 0.04 * screenWidth,),
                Text(darkModeString, style: Theme.of(context).textTheme.displaySmall,),
              ],
            ),
            Divider(thickness: 1, color: textLightColor, height: 0.03 * screenHeight,),
            Padding(
              padding: EdgeInsets.only(left: 0.04 * screenWidth, right: 0.056 * screenWidth,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.33 * screenWidth,
                    ),
                    child: RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      value: onString,
                      groupValue: offString,
                      activeColor: Theme.of(context).primaryColor,
                      title: Transform.translate(
                        offset: Offset(-0.035 * screenWidth, 0),
                        child: Text(vietnameseString, style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.33 * screenWidth,
                    ),
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: offString,
                      groupValue: offString,
                      activeColor: Theme.of(context).primaryColor,
                      title: Transform.translate(
                        offset: Offset(-0.035 * screenWidth, 0),
                        child: Text(englishString, style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Row(
              children: [
                Icon(Icons.notifications, size: 0.04 * screenHeight,),
                SizedBox(width: 0.04 * screenWidth,),
                Text(notificationString, style: Theme.of(context).textTheme.displaySmall,),
              ],
            ),
            Divider(thickness: 1, color: textLightColor, height: 0.03 * screenHeight,),
            switchTile(context, doNotDisturbString, false),
            switchTile(context, soundString, true),
            switchTile(context, internString, true),
            switchTile(context, scheduleString, false),
          ],
        ),
      ),
    );
  }

  Widget switchTile(BuildContext context, String title, bool on) {
    return Padding(
      padding: EdgeInsets.only(left: 0.056 * screenWidth, right: 0.045 * screenWidth,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          Switch(
            value: on,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
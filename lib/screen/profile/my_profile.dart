import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/login.dart';
import 'package:learning_intern_support_system/screen/profile/change_password.dart';
import 'package:learning_intern_support_system/screen/profile/edit_profile.dart';
import 'package:learning_intern_support_system/screen/profile/my_cv.dart';
import 'package:learning_intern_support_system/screen/setting.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: SizedBox(width: 0.056 * screenWidth,),
        leadingWidth: 0.056 * screenWidth,
        titleSpacing: 0,
        title: Text(myProfileString),
        actions: [
          IconButton(
            onPressed: () {
              Navigate.pushNewScreen(context, const EditProfilePage(), true);
            },
            icon: const Icon(Icons.edit),
          ),
          SizedBox(width: 0.03 * screenWidth,),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.055 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 0.0648 * screenHeight,
                  ),
                  Positioned(
                    top: 0.081 * screenHeight,
                    left: 0.081 * screenHeight,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      radius: 0.027 * screenHeight,
                      child: Icon(Icons.camera_alt, color: backgroundLightColor2, size: 0.03 * screenHeight,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.01 * screenHeight,),
            Text('Luong Duy Dat', style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 0.025 * screenHeight,),
            const Divider(thickness: 1.5,),
            SizedBox(height: 0.025 * screenHeight,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 0.2733 * screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '19020039',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 0.004 * screenHeight,),
                      Text(shortStudentIdString, style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.2733 * screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'K64C-CLC',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 0.004 * screenHeight,),
                      Text(classString, style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.2733 * screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CN1',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 0.004 * screenHeight,),
                      Text(facultyString, style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.037 * screenHeight,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 0.022 * screenHeight,
                bottom: 0.03 * screenHeight,
                left: 0.056 * screenWidth,
                right: 0.056 * screenWidth,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.032 * screenHeight),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  myProfileTile(
                    context,
                    Icons.settings,
                    settingString,
                    Icons.arrow_forward_ios,
                    () {
                      Navigate.pushNewScreen(context, const SettingPage(), true);
                    },
                  ),
                  Divider(thickness: 1.5, color: backgroundLightColor2, height: 3,),
                  SizedBox(height: 0.01 * screenHeight,),
                  myProfileTile(
                    context,
                    Icons.description,
                    myCVString,
                    Icons.arrow_forward_ios,
                    () {
                      Navigate.pushNewScreen(context, const MyCVPage(), true);
                    },
                  ),
                  Divider(thickness: 1.5, color: backgroundLightColor2, height: 3,),
                ],
              ),
            ),
            SizedBox(height: 0.037 * screenHeight,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 0.022 * screenHeight,
                bottom: 0.03 * screenHeight,
                left: 0.056 * screenWidth,
                right: 0.056 * screenWidth,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.032 * screenHeight),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  myProfileTile(
                    context,
                    Icons.key,
                    changePasswordString,
                    Icons.arrow_forward_ios,
                    () {
                      Navigate.pushNewScreen(context, const ChangePasswordPage(), true,);
                    },
                  ),
                  Divider(thickness: 1.5, color: backgroundLightColor2, height: 3,),
                  SizedBox(height: 0.01 * screenHeight,),
                  myProfileTile(
                    context,
                    Icons.logout,
                    logOutString,
                    null,
                    () {
                      Navigate.pushPage(context, const LoginPage(),);
                    }
                  ),
                  Divider(thickness: 1.5, color: backgroundLightColor2, height: 3,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myProfileTile(BuildContext context, IconData icon, String title, IconData? action, Function()? onTap) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: textLightColor, size: 0.03 * screenHeight,),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),),
      trailing: action != null ? Icon(action, color: textLightColor, size: 0.03 * screenHeight,) : const SizedBox(),
      onTap: onTap,
    );
  }

}
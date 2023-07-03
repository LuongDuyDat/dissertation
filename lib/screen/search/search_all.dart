import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';
import 'package:learning_intern_support_system/component/logo_with_image.dart';
import 'package:learning_intern_support_system/component/logo_with_name.dart';
import 'package:learning_intern_support_system/screen/profile/company_profile.dart';
import 'package:learning_intern_support_system/screen/profile/teacher_profile.dart';
import 'package:learning_intern_support_system/screen/training_program/training_program.dart';

import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/strings.dart';
import '../../util/theme.dart';

class SearchAllPage extends StatelessWidget {
  const SearchAllPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundLightColor2,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leadingWidth: 0.056 * screenWidth,
          titleSpacing: 0,
          leading: SizedBox(width: 0.056 * screenWidth,),
          title: Container(
            width: 0.733 * screenWidth,
            height: screenHeight * 0.054,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Center(
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                child: TextField(
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: backgroundLightColor2,),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.015 * screenHeight),
                    prefixIcon: const Icon(Icons.search, color: Colors.white, size: 22,),
                    hintText: searchString,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: backgroundLightColor2),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel_outlined, size: 18, color: backgroundLightColor2),
                      onPressed: () {  },
                    ),
                  ),
                  autofocus: false,
                  cursorColor: Theme.of(context).primaryColor,
                  onChanged: (text) {},
                ),
              ),
            ),
          ),
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.056,),
                child: InkWell(
                  child: Text(
                    cancelString,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  onTap: () {
                    Navigate.popPage(context);
                  },
                ),
              ),
            ),
          ],
          bottom: const BottomTabBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.04 * screenHeight,),
                Text(trainingProgramString, style: Theme.of(context).textTheme.headlineMedium,),
                Divider(thickness: 1, color: textLightColor,),
                SizedBox(height: 0.01 * screenHeight,),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    RectListItemTile(
                      leadingAsset: const TopicWithImage(logo: 'assets/images/fit-logo.png',),
                      title: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      subtitle: 'Cong nghe thong tin',
                      onTap: () {
                        Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Cong nghe thong tin'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithImage(logo: 'assets/images/aerospace.png',),
                      title: 'Công nghệ hàng không vũ trụ',
                      subtitle: 'Vien hang khong vu tru',
                      large: 0.054 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Công nghệ hàng không vũ trụ'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithImage(logo: 'assets/images/logo_fet.png',),
                      title: 'Vat ly ky thuat',
                      subtitle: 'Khoa Vat ly va Nano',
                      large: 0.054 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Vat ly ky thuat'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithImage(logo: 'assets/images/nong_nghiep.jpg',),
                      title: 'Cong nghe nong nghiep',
                      subtitle: 'Khoa cong nghiep ky thuat',
                      large: 0.054 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Cong nghe nong nghiep'), true);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 0.04 * screenHeight,),
                Text(moduleString, style: Theme.of(context).textTheme.headlineMedium,),
                Divider(thickness: 1, color: textLightColor,),
                SizedBox(height: 0.01 * screenHeight,),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    RectListItemTile(
                      leadingAsset: const TopicWithName(id: 'INT 2212',),
                      title: 'Cong nghe phan mem',
                      subtitle: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithName(id: 'INT 3005',),
                      title: 'Thuong mai dien tu',
                      subtitle: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithName(id: 'MAT 1001',),
                      title: 'Giai tich 1',
                      subtitle: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    RectListItemTile(
                      leadingAsset: const TopicWithName(id: 'MAT 1002',),
                      title: 'Giai tich 2',
                      subtitle: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      onTap: () {},
                    ),
                    RectListItemTile(
                      leadingAsset: const TopicWithName(id: 'MAT 2002',),
                      title: 'Tin hieu he thong',
                      subtitle: 'Cong nghe thong tin',
                      large: 0.054 * screenHeight,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 0.04 * screenHeight,),
                Text(lecturerString, style: Theme.of(context).textTheme.headlineMedium,),
                Divider(thickness: 1, color: textLightColor,),
                SizedBox(height: 0.01 * screenHeight,),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CirListItemTile(
                      leadingAsset: Icon(Icons.person, color: backgroundLightColor2, size: 0.04 * screenHeight,),
                      title: 'Ts.Duong Le Minh',
                      subtitle: 'Khoa Cong nghe thong tin',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TeacherProfile(name: 'Duong Le Minh'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    CirListItemTile(
                      leadingAsset: Icon(Icons.person_2, color: backgroundLightColor2, size: 0.04 * screenHeight,),
                      title: 'Ths.Doan Thi Hoai Thu',
                      subtitle: 'Khoa Cong nghe thong tin',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TeacherProfile(name: 'Doan Thi Hoai Thu'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    CirListItemTile(
                      leadingAsset: Icon(Icons.person, color: backgroundLightColor2, size: 0.04 * screenHeight,),
                      title: 'PGS TS.Ha Quang Thuy',
                      subtitle: 'Khoa Cong nghe thong tin',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const TeacherProfile(name: 'Ha Quang Thuy'), true);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 0.04 * screenHeight,),
                Text(lecturerString, style: Theme.of(context).textTheme.headlineMedium,),
                Divider(thickness: 1, color: textLightColor,),
                SizedBox(height: 0.01 * screenHeight,),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CirListItemTile(
                      leadingAsset: Image.asset('assets/images/fpt-logo.jpg', fit: BoxFit.cover,),
                      backgroundColor: backgroundLightColor2,
                      title: 'Cong ty FPT',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyProfile(name: 'Cong ty FPT'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    CirListItemTile(
                      leadingAsset: Image.asset('assets/images/fpt-logo.jpg', fit: BoxFit.cover,),
                      backgroundColor: backgroundLightColor2,
                      title: 'Cong ty FPT',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyProfile(name: 'Cong ty FPT'), true);
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight,),
                    CirListItemTile(
                      leadingAsset: Image.asset('assets/images/fpt-logo.jpg', fit: BoxFit.cover,),
                      backgroundColor: backgroundLightColor2,
                      title: 'Cong ty FPT',
                      large: 0.027 * screenHeight,
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyProfile(name: 'Cong ty FPT'), true);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 0.015 * screenHeight,),
              ],
            ),
          ),
        )
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
          text: allString,
        ),
        Tab(
          text: shortTrainingProgramString,
        ),
        Tab(
          text: moduleString,
        ),
        Tab(
          text: lecturerString,
        ),
        Tab(
          text: partnerString,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight / 15);

}
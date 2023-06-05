import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/component/circle_functionality.dart';
import 'package:learning_intern_support_system/component/logo_with_image.dart';
import 'package:learning_intern_support_system/component/logo_with_name.dart';
import 'package:learning_intern_support_system/component/post.dart';
import 'package:learning_intern_support_system/screen/search/search.dart';
import 'package:learning_intern_support_system/screen/training_program/training_program.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 0.325 * screenHeight,
                  child: Image.asset('assets/images/home.jpg', fit: BoxFit.fitWidth,),
                ),
                Positioned(
                  top: 0.055 * screenHeight,
                  left: 0.87 * screenWidth,
                  child: IconButton(
                    onPressed: () {
                      Navigate.pushNewScreen(context, const SearchPage(), true);
                    },
                    icon: Icon(Icons.search, color: backgroundLightColor2, size: 35,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.056 * screenWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.04 * screenHeight,),
                  Text(trainingProgramString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  SizedBox(
                    height: screenHeight * 0.19,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        TopicWithImage(
                          logo: 'assets/images/fit-logo.png',
                          name: 'Công nghệ thông tin CLC',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Công nghệ thông tin CLC'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/avitech.png',
                          name: 'Công nghệ kỹ thuật điện tử – viễn thông CLC',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Công nghệ kỹ thuật điện tử – viễn thông CLC'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/aerospace.png',
                          name: 'Kỹ thuật máy tính',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Kỹ thuật máy tính'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/fema.png',
                          name: 'Kỹ thuật robot',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Kỹ thuật robot'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/logo_fet.png',
                          name: 'Cơ kỹ thuật',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Cơ kỹ thuật'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/nong_nghiep.jpg',
                          name: 'Công nghệ kỹ thuật xây dựng',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Công nghệ kỹ thuật xây dựng'), true);
                          },
                        ),
                        SizedBox(width: 0.077 * screenWidth,),
                        TopicWithImage(
                          logo: 'assets/images/physics.png',
                          name: 'Công nghệ hàng không vũ trụ',
                          onTap: () {
                            Navigate.pushNewScreen(context, const TrainingProgramPage(programName: 'Công nghệ hàng không vũ trụ'), true);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02 * screenHeight,),
                  Text(recentModuleString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  SizedBox(
                    height: screenHeight * 0.19,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        const TopicWithName(name: 'Toán rời rạc', id: 'INT 2212'),
                        SizedBox(width: 0.077 * screenWidth,),
                        const TopicWithName(name: 'Mạng máy tính', id: 'INT 2215'),
                        SizedBox(width: 0.077 * screenWidth,),
                        const TopicWithName(name: 'Nhập môn lập trình', id: 'INT 1005'),
                        SizedBox(width: 0.077 * screenWidth,),
                        const TopicWithName(name: 'Lịch sử Đảng', id: 'HIS 1324'),
                        SizedBox(width: 0.077 * screenWidth,),
                        const TopicWithName(name: 'Phát triển ứng dụng Web', id: 'INT 1234'),
                        SizedBox(width: 0.077 * screenWidth,),
                        const TopicWithName(name: 'Quản trị mạng', id: 'INT 3355'),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02 * screenHeight,),
                  Text(studyProcessString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  CircleFunctionality(icon: Icons.bar_chart, name: statisticString),
                  SizedBox(height: 0.03 * screenHeight,),
                  Text(internString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleFunctionality(icon: Icons.app_registration, name: signUpString),
                      SizedBox(width: 0.1 * screenWidth,),
                      CircleFunctionality(icon: Icons.apartment, name: listPartnerString),
                      SizedBox(width: 0.1 * screenWidth,),
                      CircleFunctionality(icon: Icons.description, name: reportString),
                    ],
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  Text(postString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.01 * screenHeight,),
                  Row(
                    children: [
                      Button(
                        type: 0,
                        width: 0.2 * screenWidth,
                        height: 0.035 * screenHeight,
                        text: allString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                      ),
                      SizedBox(width: 0.035 * screenWidth,),
                      Button(
                        type: 0,
                        width: 0.29 * screenWidth,
                        height: 0.035 * screenHeight,
                        text: schoolFacultyString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                      ),
                      SizedBox(width: 0.035 * screenWidth,),
                      Button(
                        type: 0,
                        width: 0.2 * screenWidth,
                        height: 0.035 * screenHeight,
                        text: companyString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                      ),
                    ],
                  ),
                  ListView(
                    padding: EdgeInsets.only(top: 0.022 * screenHeight),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Post(
                        type: 0,
                        author: 'Nhà trường',
                        date: DateTime.now(),
                        image: 'assets/images/post_image.jpg',
                        tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
                        title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
                      ),
                      SizedBox(height: 0.037 * screenHeight,),
                      Post(
                        type: 1,
                        author: 'Công ty cổ phần FPT',
                        date: DateTime.now(),
                        image: 'assets/images/post_image.jpg',
                        status: signUpString,
                        title: 'Tuyển thực tập sinh Web Frontend',
                      ),
                      SizedBox(height: 0.037 * screenHeight,),
                      Post(
                        type: 0,
                        author: 'Nhà trường',
                        date: DateTime.now(),
                        image: 'assets/images/post_image.jpg',
                        tags: const ['Ky thuat nang luong', 'Tri tue nhan tao'],
                        title: 'Lựa chọn ngành Kỹ thuật năng lượng: Bước đệm trở thành công dân toàn cầu, nâng tầm sự nghiệp',
                      ),
                      SizedBox(height: 0.037 * screenHeight,),
                      Post(
                        type: 1,
                        author: 'Công ty cổ phần FPT',
                        date: DateTime.now(),
                        image: 'assets/images/post_image.jpg',
                        status: signUpString,
                        title: 'Tuyển thực tập sinh Web Frontend',
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 0.04 * screenHeight,),
          ],
        ),
      )
    );
  }
}


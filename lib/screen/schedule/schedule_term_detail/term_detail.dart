import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/edit_module_name.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../../util/navigate.dart';

List<String> moduleListString = [
  'Bóng bàn',
  'Cấu Trúc Dữ Liệu và Giải Thuật',
  'CNXHKH',
  'Kiến trúc máy tính',
  'Lập trình hướng đối tượng',
  'Nguyên Lý Marketing',
  'Xác suốt thống kê',
];

List<Color> colorsListString = [
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.red,
  Colors.orangeAccent,
  Colors.yellow,
  Colors.green
];

class TermDetailPage extends StatelessWidget {
  const TermDetailPage({super.key, required this.termName});

  final String termName;

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
          Align(
            alignment: Alignment.center,
            child: Text(editString, style: Theme.of(context).textTheme.headlineSmall,),
          ),
          SizedBox(width: 0.04 * screenWidth,),
          IconButton(
            onPressed: () {
              Navigate.pushNewScreen(context, const EditModuleNamePage(type: 0), true);
            }, 
            icon: const Icon(Icons.add),
          ),
          SizedBox(width: 0.04 * screenWidth,),
        ],
        title: Text(termString),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.02 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity,),
                  Text(termName, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                  SizedBox(height: 0.004 * screenHeight,),
                  Text('24/8/2020 - 23/11/2020', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),),
                ],
              ),
            ),
            SizedBox(height: 0.0464 * screenHeight,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return moduleListTile(
                  context,
                  moduleListString.elementAt(index),
                  colorsListString.elementAt(index),
                );
              },
              itemCount: moduleListString.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget moduleListTile(BuildContext context, String name, Color color) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: secondaryLightColor.withOpacity(0.1),
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.horizontal(),
        ),
        height: 0.0648 * screenHeight,
        child: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: color,
                          radius: 0.012 * screenWidth,
                        ),
                        SizedBox(width: 0.042 * screenWidth,),
                        Text(name, style: Theme.of(context).textTheme.headlineSmall,),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 0.0237 * screenHeight, color: textLightColor,)
                  ],
                )
            )
        ),
      ),
      onTap: () {
        Navigate.pushNewScreen(context, ModuleDetailPage(name: name), true);
      },
    );
  }
}
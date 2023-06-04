import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/rectangle_with_color.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../component/button.dart';
import '../../../component/input_field.dart';
import '../../../util/navigate.dart';
import '../../../util/theme.dart';

List<Widget> rectangles = [
  RectangleWithColor(color: const Color(0xFFfe4a49), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF2ab7ca), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFfed766), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFf4b6c2), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF03396c), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFb3cde0), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF651e3e), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFfe8a71), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF4a4e4d), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF35a79c), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF7bc043), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF3d2352), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF8d5524), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFf1c27d ), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFFe3c9c9), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
  RectangleWithColor(color: const Color(0xFF8874a3), width: 0.1168 * screenWidth, height: 0.0648 * screenHeight),
];

class EditModuleNamePage extends StatelessWidget {
  const EditModuleNamePage({super.key, required this.type});

  //type = 0: add; type = 1: edit
  final int type;
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
        title: Text(
          type == 0 ? addModuleString : editModuleString,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(moduleNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            ),
            SizedBox(height: 0.004 * screenHeight,),
            SizedBox(
              height: 0.06 * screenHeight,
              child: InputField(
                icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                hintText: moduleNameString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.0432 * screenHeight,),
            Container(
              width: double.infinity,
              height: 0.4525 * screenHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.025 * screenHeight),
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth, vertical: 0.0345 * screenHeight),
                child: Wrap(
                  spacing: 0.098 * screenWidth,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: rectangles,
                ),
              ),
            ),
            SizedBox(height: 0.0324 * screenHeight,),
            Button(
              type: 0,
              width: 0.58 * screenWidth,
              height: 0.056 * screenHeight,
              text: addString,
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/search/search_all.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/button.dart';
import '../../util/navigate.dart';
import '../../util/strings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key,});

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
          elevation: 0,
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
                    onChanged: (text) {
                      if (text != '') {
                        Navigate.pushNewScreen(context, const SearchAllPage(), true);
                      }
                    },
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.0432 * screenHeight,),
              Text(recentString, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: 0.0216 * screenHeight,),
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 0.0216 * screenHeight,
                spacing: 0.07 * screenWidth,
                children: [
                  Button(
                    type: 0,
                    width: 0.45 * screenWidth,
                    height: 0.0324 * screenHeight,
                    text: 'Cong nghe thong tin',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Button(
                    type: 0,
                    width: 0.233 * screenWidth,
                    height: 0.0324 * screenHeight,
                    text: 'Dien tu',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Button(
                    type: 0,
                    width: 0.233 * screenWidth,
                    height: 0.0324 * screenHeight,
                    text: 'Dai hoc',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
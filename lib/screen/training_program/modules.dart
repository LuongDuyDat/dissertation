import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/module_tile.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../domain/entities/module_model.dart';
import '../../util/global.dart';
import '../../util/theme.dart';

class ModulesPage extends StatelessWidget {
  const ModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 0.032 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
        child: Column(
          children: [
            sectionListTile(
                context,
                totalCreditString,
                156,
                null
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              generalKnowledgeBlockString,
              34,
              Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,),
            ),
            SizedBox(height: 0.0194 * screenHeight,),
            SizedBox(
              height: 0.36 * screenHeight,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: ModuleTile(
                      moduleId: moduleList.elementAt(index).moduleId,
                      moduleName: moduleList.elementAt(index).moduleName,
                      numberOfCredit: moduleList.elementAt(index).creditNumber,
                    ),
                  );
                },
                itemCount: moduleList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 0.0194 * screenHeight,);
                },
              ),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              oneKnowledgeBlockString,
              16,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              twoKnowledgeBlockString,
              10,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionListTile(BuildContext context, String label, int creditNumber, Icon? suffixIcon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$label: ', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800, ),),
                  TextSpan(
                    text: '$creditNumber $creditString',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal, ),
                  ),
                ]
              ),
            ),
            suffixIcon ?? const SizedBox()
          ],
        ),
        SizedBox(height: 0.004 * screenHeight,),
        Divider(thickness: 1, color: textLightColor, height: 3,),
      ],
    );
  }
}
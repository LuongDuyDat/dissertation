import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/button.dart';
import '../../util/navigate.dart';

class PartnerListPage extends StatelessWidget {
  const PartnerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final searchFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text(partnerListString, style: Theme.of(context).textTheme.displayMedium,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.02 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilder(
                key: formKey,
                child: InputField(
                  key: searchFieldKey,
                  name: searchString,
                  icon: Icon(Icons.search, size: 0.03 * screenHeight,),
                  hintText: searchString,
                  hintTextStyle: Theme.of(context).textTheme.titleLarge,
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                  inputBorder: const UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 0.02 * screenHeight,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    width: 0.25 * screenWidth,
                    height: 0.035 * screenHeight,
                    text: recruitingString,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 0.0237 * screenHeight),
                children: [
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                  partnerTile(context, 'Cong ty phan mem', 'CompanyA'),
                  SizedBox(height: 0.0237 * screenHeight,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget partnerTile(BuildContext context, String type, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black45,
          radius: 0.0432 * screenHeight,
        ),
        SizedBox(width: 0.04 * screenWidth,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(type, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),),
            SizedBox(height: 0.012 * screenHeight,),
            Text(name, style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
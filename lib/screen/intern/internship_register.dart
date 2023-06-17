import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';
import 'package:learning_intern_support_system/component/register_status.dart';
import 'package:learning_intern_support_system/screen/intern/register_external_company.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';
import '../post/company_post.dart';

class InternshipRegisterPage extends StatelessWidget {
  const InternshipRegisterPage({super.key});

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
        title: Text(internshipRegisterString),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.032 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(partnerCompanyRegistrationString, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(
                height: 0.45 * screenHeight,
                child: ListView(
                  padding: EdgeInsets.only(top: 0.0237 * screenHeight),
                  children: [
                    RegisterStatusTile(
                      status: acceptString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên Web',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                    SizedBox(height: 0.0227 * screenHeight,),
                    RegisterStatusTile(
                      status: inProgressString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên Mobile',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                    SizedBox(height: 0.0227 * screenHeight,),
                    RegisterStatusTile(
                      status: declineString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên AI',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                    SizedBox(height: 0.0227 * screenHeight,),
                    RegisterStatusTile(
                      status: acceptString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên Web',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                    SizedBox(height: 0.0227 * screenHeight,),
                    RegisterStatusTile(
                      status: inProgressString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên Mobile',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                    SizedBox(height: 0.0227 * screenHeight,),
                    RegisterStatusTile(
                      status: declineString,
                      company: 'FPT',
                      image: 'assets/images/post_image.jpg',
                      title: 'Tuyển dụng lập trình viên AI',
                      onTap: () {
                        Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.038 * screenHeight,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(externalCompanyRegistrationString, style: Theme.of(context).textTheme.headlineMedium,),
                  IconButton(
                    onPressed: () {
                      Navigate.pushNewScreen(context, const RegisterExternalCompanyPage(), true);
                    },
                    icon: Icon(Icons.add, size: 0.03 * screenHeight,),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 0.0324 * screenHeight,),
                children: [
                  CompanyListTile(
                    name: 'Company A',
                    internArea: 'Thuc tap sinh Web',
                    status: inProgressString,
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  CompanyListTile(
                    name: 'Company B',
                    internArea: 'Thuc tap sinh Mobile',
                    status: acceptString,
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  CompanyListTile(
                    name: 'Company C',
                    internArea: 'Thuc tap sinh AI',
                    status: declineString,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
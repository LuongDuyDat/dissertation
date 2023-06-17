import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/navigate.dart';
import '../../util/theme.dart';

class CompanyPostPage extends StatelessWidget {
  const CompanyPostPage({Key? key}) : super(key: key);

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
        title: Text(postString,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.02 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 0.256 * screenHeight,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(0.0216 * screenHeight),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.03 * screenWidth, vertical: 0.0216 * screenHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 0.0432 * screenHeight,
                                height: 0.0432 * screenHeight,
                                color: Colors.black45,
                              ),
                              SizedBox(width: 0.016 * screenWidth,),
                              Text(
                                'Công ty cổ phần FPT',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800,),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                postedDateString,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor,),
                              ),
                              SizedBox(height: 0.002 * screenHeight,),
                              Text(
                                '24/08/2022',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 0.004 * screenHeight,),
                              Text(
                                expiredDateString,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor,),
                              ),
                              SizedBox(height: 0.002 * screenHeight,),
                              Text(
                                '24/09/2022',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        contactString,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor,),
                      ),
                      SizedBox(height: 0.005 * screenHeight,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 0.02 * screenHeight, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 0.02 * screenWidth,),
                          Text(
                            'Nguyễn Văn A',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.008 * screenHeight,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.mail, size: 0.02 * screenHeight, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 0.02 * screenWidth,),
                          Text(
                            'fpt@gmail.com',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.008 * screenHeight,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, size: 0.02 * screenHeight, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 0.02 * screenWidth,),
                          Text(
                            '0912345678',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.0108 * screenHeight,),
                      Align(
                        alignment: Alignment.center,
                        child: Button(
                          type: 0,
                          width: 0.22 * screenWidth,
                          height: 0.027 * screenHeight,
                          text: signUpString,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.019 * screenHeight,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Tuyển thực tập sinh Web Frontend',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 0.0162 * screenHeight,),
              Text(
                '    Tham gia phát triển các dự án phần mềm trên nền tảng Web PC và mobile. Phối hợp với các back-end developers để cải thiện tính năng đáp ứng nhu cầu của người sử dụng. Tối ưu hóa giao diện các ứng dụng/trang web để có được tốc độ và hiệu suất tối đa. Nghiên cứu, tìm hiểu các công nghệ về ReactJS/CSS Javascript mới nhất để áp dụng cái tiến sản phẩm.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),
              ),
              SizedBox(height: 0.0162 * screenHeight,),
              Text(
                '    Tham gia phát triển các dự án phần mềm trên nền tảng Web PC và mobile. Phối hợp với các back-end developers để cải thiện tính năng đáp ứng nhu cầu của người sử dụng. Tối ưu hóa giao diện các ứng dụng/trang web để có được tốc độ và hiệu suất tối đa. Nghiên cứu, tìm hiểu các công nghệ về ReactJS/CSS Javascript mới nhất để áp dụng cái tiến sản phẩm.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),
              ),
              SizedBox(height: 0.0162 * screenHeight,),
              Text(
                '    Tham gia phát triển các dự án phần mềm trên nền tảng Web PC và mobile. Phối hợp với các back-end developers để cải thiện tính năng đáp ứng nhu cầu của người sử dụng. Tối ưu hóa giao diện các ứng dụng/trang web để có được tốc độ và hiệu suất tối đa. Nghiên cứu, tìm hiểu các công nghệ về ReactJS/CSS Javascript mới nhất để áp dụng cái tiến sản phẩm.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/component/circle_functionality.dart';
import 'package:learning_intern_support_system/component/logo_with_image.dart';
import 'package:learning_intern_support_system/component/logo_with_name.dart';
import 'package:learning_intern_support_system/component/post.dart';
import 'package:learning_intern_support_system/screen/home/bloc/home_bloc.dart';
import 'package:learning_intern_support_system/screen/home/bloc/home_event.dart';
import 'package:learning_intern_support_system/screen/home/bloc/home_state.dart';
import 'package:learning_intern_support_system/screen/intern/intern_report.dart';
import 'package:learning_intern_support_system/screen/intern/internship_register.dart';
import 'package:learning_intern_support_system/screen/intern/partner_list.dart';
import 'package:learning_intern_support_system/screen/learning_process/learning_process_statistic.dart';
import 'package:learning_intern_support_system/screen/post/company_post.dart';
import 'package:learning_intern_support_system/screen/training_program/training_program.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../search/view/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.trainingProgramStatus != current.trainingProgramStatus;
                    },
                    builder: (context, state) {
                      switch(state.trainingProgramStatus) {
                        case TrainingProgramStatus.initial:
                          context.read<HomeBloc>().add(const HomeLoadTrainingProgram());
                          return const Center();
                        case TrainingProgramStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case TrainingProgramStatus.success:
                          return SizedBox(
                            height: screenHeight * 0.19,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return TopicWithImage(
                                  logo: state.trainingPrograms.elementAt(index).logo,
                                  name: state.trainingPrograms.elementAt(index).name,
                                  onTap: () {
                                    Navigate.pushNewScreen(
                                      context,
                                      TrainingProgramPage(programName: state.trainingPrograms.elementAt(index).name,),
                                      true,
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 0.077 * screenWidth,);
                              },
                              itemCount: state.trainingPrograms.length,
                            ),
                          );
                        default:
                          //todo: failure notification
                          return const Center();
                      }
                    },
                  ),
                  SizedBox(height: 0.02 * screenHeight,),
                  Text(recentModuleString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.moduleStatus != current.moduleStatus;
                    },
                    builder: (context, state) {
                      switch(state.moduleStatus) {
                        case ModuleStatus.initial:
                          context.read<HomeBloc>().add(const HomeLoadModule());
                          return const Center();
                        case ModuleStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case ModuleStatus.success:
                          return SizedBox(
                            height: screenHeight * 0.19,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return TopicWithName(
                                  name: state.modules.elementAt(index).moduleName,
                                  id: state.modules.elementAt(index).moduleId,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 0.077 * screenWidth,);
                              },
                              itemCount: state.modules.length,
                            ),
                          );
                        default:
                        //todo: failure notification
                          return const Center();
                      }
                    },
                  ),
                  SizedBox(height: 0.02 * screenHeight,),
                  Text(studyProcessString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  CircleFunctionality(
                    icon: Icons.bar_chart,
                    name: statisticString,
                    onTap: () {
                      Navigate.pushNewScreen(context, const LearningProcessStatisticalPage(), true);
                    },
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  Text(internString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.015 * screenHeight,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleFunctionality(
                        icon: Icons.app_registration,
                        name: signUpString,
                        onTap: () {
                          Navigate.pushNewScreen(context, const InternshipRegisterPage(), true);
                        },
                      ),
                      SizedBox(width: 0.1 * screenWidth,),
                      CircleFunctionality(
                        icon: Icons.apartment,
                        name: listPartnerString,
                        onTap: () {
                          Navigate.pushNewScreen(context, const PartnerListPage(), true);
                        },
                      ),
                      SizedBox(width: 0.1 * screenWidth,),
                      CircleFunctionality(
                        icon: Icons.description,
                        name: reportString,
                        onTap: () {
                          Navigate.pushNewScreen(context, const InternshipReportPage(), true);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  Text(postString, style: Theme.of(context).textTheme.displaySmall,),
                  SizedBox(height: 0.01 * screenHeight,),
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.postType != current.postType;
                    },
                    builder: (context, state) {
                      return Row(
                        children: [
                          Button(
                            type: state.postType == PostType.all ? 0 : 1,
                            width: 0.2 * screenWidth,
                            height: 0.035 * screenHeight,
                            text: allString,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: state.postType == PostType.all ? backgroundLightColor2 : textLightColor,
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().add(const HomeChangePostType(type: 2));
                            },
                          ),
                          SizedBox(width: 0.035 * screenWidth,),
                          Button(
                            type: state.postType == PostType.university ? 0 : 1,
                            width: 0.29 * screenWidth,
                            height: 0.035 * screenHeight,
                            text: schoolFacultyString,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: state.postType == PostType.university ? backgroundLightColor2 : textLightColor,
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().add(const HomeChangePostType(type: 0));
                            },
                          ),
                          SizedBox(width: 0.035 * screenWidth,),
                          Button(
                            type: state.postType == PostType.company ? 0 : 1,
                            width: 0.2 * screenWidth,
                            height: 0.035 * screenHeight,
                            text: companyString,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: state.postType == PostType.company ? backgroundLightColor2 : textLightColor,
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().add(const HomeChangePostType(type: 1));
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) {
                      return previous.postStatus != current.postStatus || previous.postType != current.postType;
                    },
                    builder: (context, state) {
                      switch(state.postStatus) {
                        case PostStatus.initial:
                          context.read<HomeBloc>().add(const HomeLoadPost());
                          return const Center();
                        case PostStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case PostStatus.success:
                          return ListView.separated(
                            padding: EdgeInsets.only(top: 0.022 * screenHeight),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Post(
                                type: state.posts.elementAt(index).type,
                                title: state.posts.elementAt(index).title,
                                author: state.posts.elementAt(index).author,
                                date: state.posts.elementAt(index).dateTime,
                                image: state.posts.elementAt(index).image,
                                tags: state.posts.elementAt(index).tags,
                                status: state.posts.elementAt(index).status,
                                onTap: () {
                                  if (state.posts.elementAt(index).type == 1) {
                                    Navigate.pushNewScreen(context, const CompanyPostPage(), true);
                                  }
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 0.037 * screenHeight,);
                            },
                            itemCount: state.posts.length,
                          );
                        default:
                        //todo: failure notification
                          return const Center();
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * screenHeight,),
          ],
        ),
      ),
    );
  }

}


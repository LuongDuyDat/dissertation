import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';
import 'package:learning_intern_support_system/component/logo_with_image.dart';
import 'package:learning_intern_support_system/component/logo_with_name.dart';
import 'package:learning_intern_support_system/screen/profile/company_profile.dart';
import 'package:learning_intern_support_system/screen/profile/teacher_profile.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_bloc.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_event.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_state.dart';
import 'package:learning_intern_support_system/screen/training_program/training_program.dart';

import '../../../util/global.dart';
import '../../../util/navigate.dart';
import '../../../util/strings.dart';
import '../../../util/theme.dart';

class SearchAll extends StatelessWidget {
  const SearchAll({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.04 * screenHeight,),
            Text(trainingProgramString, style: Theme.of(context).textTheme.headlineMedium,),
            Divider(thickness: 1, color: textLightColor,),
            SizedBox(height: 0.01 * screenHeight,),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) {
                return previous.trainingProgramStatus != current.trainingProgramStatus;
              },
              builder: (context, state) {
                switch(state.trainingProgramStatus) {
                  case SearchStatus.initial:
                    context.read<SearchBloc>().add(const SearchLoadTrainingProgram());
                    return const Center();
                  case SearchStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchStatus.success:
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return RectListItemTile(
                          leadingAsset: TopicWithImage(logo: state.trainingPrograms.elementAt(index).logo,),
                          title: state.trainingPrograms.elementAt(index).name,
                          large: 0.054 * screenHeight,
                          subtitle: state.trainingPrograms.elementAt(index).faculty,
                          onTap: () {
                            Navigate.pushNewScreen(context, TrainingProgramPage(programName: state.trainingPrograms.elementAt(index).name,), true);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 0.01 * screenHeight,);
                      },
                      itemCount: min(state.trainingPrograms.length, 4),
                    );
                  default:
                    //todo: failure processing
                    return const Center();
                }
              },
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Text(moduleString, style: Theme.of(context).textTheme.headlineMedium,),
            Divider(thickness: 1, color: textLightColor,),
            SizedBox(height: 0.01 * screenHeight,),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) {
                return previous.moduleStatus != current.moduleStatus;
              },
              builder: (context, state) {
                switch(state.moduleStatus) {
                  case SearchStatus.initial:
                    context.read<SearchBloc>().add(const SearchLoadModule());
                    return const Center();
                  case SearchStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchStatus.success:
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return RectListItemTile(
                          leadingAsset: TopicWithName(id: state.modules.elementAt(index).moduleId,),
                          title: state.modules.elementAt(index).moduleName,
                          subtitle: state.modules.elementAt(index).faculty,
                          large: 0.054 * screenHeight,
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 0.01 * screenHeight,);
                      },
                      itemCount: min(state.modules.length, 4),
                    );
                  default:
                  //todo: failure processing
                    return const Center();
                }
              },
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Text(lecturerString, style: Theme.of(context).textTheme.headlineMedium,),
            Divider(thickness: 1, color: textLightColor,),
            SizedBox(height: 0.01 * screenHeight,),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) {
                return previous.lecturerStatus != current.lecturerStatus;
              },
              builder: (context, state) {
                switch(state.lecturerStatus) {
                  case SearchStatus.initial:
                    context.read<SearchBloc>().add(const SearchLoadLecturer());
                    return const Center();
                  case SearchStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchStatus.success:
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CirListItemTile(
                          leadingAsset: Icon(
                            state.lecturers.elementAt(index).gender == maleString ? Icons.person : Icons.person_2,
                            color: backgroundLightColor2,
                            size: 0.04 * screenHeight,
                          ),
                          title: '${state.lecturers.elementAt(index).degree}.${state.lecturers.elementAt(index).name}',
                          subtitle: '$facultyString ${state.lecturers.elementAt(index).faculty}',
                          large: 0.027 * screenHeight,
                          onTap: () {
                            Navigate.pushNewScreen(context, TeacherProfile(name: state.lecturers.elementAt(index).name), true);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 0.01 * screenHeight,);
                      },
                      itemCount: min(state.lecturers.length, 6),
                    );
                  default:
                  //todo: failure processing
                    return const Center();
                }
              },
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Text(companyString, style: Theme.of(context).textTheme.headlineMedium,),
            Divider(thickness: 1, color: textLightColor,),
            SizedBox(height: 0.01 * screenHeight,),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) {
                return previous.companyStatus != current.companyStatus;
              },
              builder: (context, state) {
                switch(state.companyStatus) {
                  case SearchStatus.initial:
                    context.read<SearchBloc>().add(const SearchLoadCompany());
                    return const Center();
                  case SearchStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SearchStatus.success:
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CirListItemTile(
                          leadingAsset: Image.asset(state.companies.elementAt(index).logo, fit: BoxFit.cover,),
                          backgroundColor: backgroundLightColor2,
                          title: state.companies.elementAt(index).name,
                          large: 0.027 * screenHeight,
                          onTap: () {
                            Navigate.pushNewScreen(context, CompanyProfile(name: state.companies.elementAt(index).name), true);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 0.01 * screenHeight,);
                      },
                      itemCount: min(state.companies.length, 4),
                    );
                  default:
                  //todo: failure processing
                    return const Center();
                }
              },
            ),
            SizedBox(height: 0.015 * screenHeight,),
          ],
        ),
      ),
    );
  }
}
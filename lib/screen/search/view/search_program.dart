import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/list_tile.dart';
import '../../../component/logo_with_image.dart';
import '../../../util/global.dart';
import '../../../util/navigate.dart';
import '../../../util/strings.dart';
import '../../../util/theme.dart';
import '../../training_program/training_program.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';

class SearchProgram extends StatelessWidget {
  const SearchProgram({super.key,});

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
                      itemCount: state.trainingPrograms.length,
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
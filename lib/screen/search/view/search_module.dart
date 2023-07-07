import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/list_tile.dart';
import '../../../component/logo_with_name.dart';
import '../../../util/global.dart';
import '../../../util/strings.dart';
import '../../../util/theme.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';

class SearchModule extends StatelessWidget {
  const SearchModule({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      itemCount: state.modules.length,
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
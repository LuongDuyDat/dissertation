import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';
import 'package:learning_intern_support_system/screen/profile/company_profile.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_bloc.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_event.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_state.dart';

import '../../../util/global.dart';
import '../../../util/navigate.dart';
import '../../../util/strings.dart';
import '../../../util/theme.dart';

class SearchCompany extends StatelessWidget {
  const SearchCompany({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      itemCount: state.companies.length,
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_bloc.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_event.dart';
import 'package:learning_intern_support_system/screen/search/bloc/search_state.dart';
import 'package:learning_intern_support_system/screen/search/view/search_all.dart';
import 'package:learning_intern_support_system/screen/search/view/search_company.dart';
import 'package:learning_intern_support_system/screen/search/view/search_lecturer.dart';
import 'package:learning_intern_support_system/screen/search/view/search_module.dart';
import 'package:learning_intern_support_system/screen/search/view/search_program.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../../component/button.dart';
import '../../../util/navigate.dart';
import '../../../util/strings.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController _controller = TextEditingController();

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
            child: BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) {
                return previous.searchWord != current.searchWord;
              },
              builder: (context, state) {
                return Center(
                  child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: backgroundLightColor2,),
                      controller: _controller,
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
                          onPressed: () {
                            context.read<SearchBloc>().add( const SearchWordChange(word: ''));
                            _controller.text = '';
                            _controller.selection =
                                TextSelection.collapsed(offset: _controller.text.length);
                          },
                        ),
                      ),
                      autofocus: false,
                      cursorColor: Theme.of(context).primaryColor,
                      onChanged: (text) {
                        context.read<SearchBloc>().add(SearchWordChange(word: text));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          bottom: const BottomTabBar(),
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
        body: BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) {
            return previous.searchWord != current.searchWord;
          },
          builder: (context, state) {
            if (state.searchWord == '') {
              context.read<SearchBloc>().add(const SearchLoadRecentSearch());
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.0432 * screenHeight,),
                    Text(recentString, style: Theme.of(context).textTheme.headlineMedium,),
                    SizedBox(height: 0.0216 * screenHeight,),
                    BlocBuilder<SearchBloc, SearchState>(
                      buildWhen: (previous, current) {
                        return previous.recentSearch != current.recentSearch;
                      },
                      builder: (context, state) {
                        return Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 0.0216 * screenHeight,
                          spacing: 0.07 * screenWidth,
                          children: state.recentSearch.map((text) {
                            return Button2(
                              height: 0.0324 * screenHeight,
                              text: text,
                              style: Theme.of(context).textTheme.bodyMedium,
                              onPressed: () {
                                _controller.text = text;
                                _controller.selection =
                                    TextSelection.collapsed(offset: _controller.text.length);
                                context.read<SearchBloc>().add(SearchWordChange(word: text));
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const TabBarView(
                children: [
                  SearchAll(),
                  SearchProgram(),
                  SearchModule(),
                  SearchLecturer(),
                  SearchCompany(),
                ],
              );
            }
          }
        )
      ),
    );
  }
}

class BottomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.searchWord != current.searchWord;
      },
      builder: (context, state) {
        if (state.searchWord == '') {
          return PreferredSize(preferredSize: const Size(0.0, 0.0),child: Container(),);
        } else {
          return TabBar(
            tabs: [
              Tab(
                text: allString,
              ),
              Tab(
                text: shortTrainingProgramString,
              ),
              Tab(
                text: moduleString,
              ),
              Tab(
                text: lecturerString,
              ),
              Tab(
                text: partnerString,
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight / 15);

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/add_module/edit_module_name.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/module_detail.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_state.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../../../util/navigate.dart';

class TermDetailPage extends StatelessWidget {
  const TermDetailPage({super.key, required this.termName, required this.onDeleteTerm,});

  final String termName;
  final Function() onDeleteTerm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermDetailBloc(),
      child: TermDetailView(termName: termName, onDeleteTerm: onDeleteTerm,),
    );
  }
}

class TermDetailView extends StatelessWidget {
  const TermDetailView({super.key, required this.termName, required this.onDeleteTerm,});

  final String termName;
  final Function() onDeleteTerm;
  
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
        actions: [
          BlocBuilder<TermDetailBloc, TermDetailState>(
            builder: (context, state) {
              if (!state.editModuleStatus) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context1) {
                            return SizedBox(
                              height: 0.196 * screenHeight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.0327 * screenWidth,),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigate.popPage(context);
                                        onDeleteTerm();
                                        context.read<TermDetailBloc>().add(const TermDetailDeleteTerm());
                                      },
                                      child: bottomSheetWidget(
                                        context,
                                        deleteTermString,
                                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 0.0152 * screenHeight,),
                                    InkWell(
                                      onTap: () {
                                        Navigate.popPage(context);
                                        context.read<TermDetailBloc>().add(const TermDetailChangeEditModuleStatus());
                                      },
                                      child: bottomSheetWidget(
                                        context,
                                        editModuleString,
                                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 0.024 * screenHeight,),
                                    InkWell(
                                      onTap: () {
                                        Navigate.popPage(context);
                                      },
                                      child: bottomSheetWidget(
                                        context,
                                        cancelString,
                                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(editString, style: Theme.of(context).textTheme.headlineSmall,),
                      ),
                    ),
                    SizedBox(width: 0.04 * screenWidth,),
                    IconButton(
                      onPressed: () {
                        Navigate.pushNewScreen(context, EditModuleNamePage(type: 0, previousContext: context,), true,);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                );
              } else {
                return InkWell(
                  onTap: () {
                    context.read<TermDetailBloc>().add(const TermDetailChangeEditModuleStatus());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      finishString,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(width: 0.04 * screenWidth,),
        ],
        title: Text(termString),
        elevation: 0,
      ),
      body: BlocListener<TermDetailBloc, TermDetailState>(
        listenWhen: (previous, current) {
          return previous.deleteTermStatus != current.deleteTermStatus;
        },
        listener: (context, state) {
          if (state.deleteTermStatus == TermDetailStatus.success) {
            Navigate.popPage(context);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.02 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: double.infinity,),
                    Text(termName, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w700),),
                    SizedBox(height: 0.004 * screenHeight,),
                    Text('24/8/2020 - 23/11/2020', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              SizedBox(height: 0.0464 * screenHeight,),
              BlocBuilder<TermDetailBloc, TermDetailState>(
                buildWhen: (previous, current) {
                  return previous.moduleList != current.moduleList
                      || previous.moduleListStatus != current.moduleListStatus
                      || previous.editModuleStatus != current.editModuleStatus;
                },
                builder: (context, state) {
                  switch(state.moduleListStatus) {
                    case TermDetailStatus.initial:
                      context.read<TermDetailBloc>().add(const TermDetailLoadModuleList());
                      return const Center();
                    case TermDetailStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case TermDetailStatus.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlocBuilder<TermDetailBloc, TermDetailState>(
                            buildWhen: (previous, current) {
                              return previous.moduleList != current.moduleList
                                  || previous.moduleListStatus != current.moduleListStatus
                                  || previous.editModuleStatus != current.editModuleStatus
                                  || previous.moduleIsEdit.elementAt(index) != current.moduleIsEdit.elementAt(index);
                            },
                            builder: (context, state) {
                              return moduleListTile(
                                context,
                                state.moduleList.elementAt(index).moduleName,
                                state.moduleList.elementAt(index).color,
                                state.editModuleStatus,
                                state.moduleIsEdit.elementAt(index),
                                index,
                              );
                            },
                          );
                        },
                        itemCount: state.moduleList.length,
                      );
                    default:
                      //todo: failure processing
                      return const Center();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moduleListTile(BuildContext context, String name, Color color, bool onEditModuleList, bool onEditModule, int index) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: secondaryLightColor.withOpacity(0.1),
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: const BorderRadius.horizontal(),
        ),
        height: 0.0648 * screenHeight,
        child: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: onEditModule ? 0 : 0.056 * screenWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        !onEditModule && onEditModuleList ? InkWell(
                          onTap: () {
                            context.read<TermDetailBloc>().add(TermDetailOnClickEditModule(index: index));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 0.03 * screenWidth,
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: backgroundLightColor2,
                                size: 0.05 * screenWidth,
                              ),
                            ),
                          ),
                        ) : const SizedBox(),
                        SizedBox(width: !onEditModule && onEditModuleList ? 0.042 * screenWidth : 0,),
                        CircleAvatar(
                          backgroundColor: color,
                          radius: 0.012 * screenWidth,
                        ),
                        SizedBox(width: 0.042 * screenWidth,),
                        SizedBox(
                          width: onEditModuleList && !onEditModule ? 0.64 * screenWidth
                              : (onEditModule ? 0.5 * screenWidth : 0.75 * screenWidth),
                          child: Text(name, style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                    onEditModule
                        ? Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigate.pushNewScreen(
                              context,
                              EditModuleNamePage(
                                type: 1,
                                initialValue: name,
                                initialColor: color,
                                previousContext: context,
                                index: index,
                              ),
                              true,
                            );
                          },
                          child: Container(
                            height: 0.0648 * screenHeight,
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 0.035 * screenWidth,),
                            child: Center(
                              child: Text(
                                editString,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: backgroundLightColor2),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<TermDetailBloc>().add(TermDetailDeleteModule(index: index));
                          },
                          child: Container(
                            height: 0.0648 * screenHeight,
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 0.035 * screenWidth,),
                            child: Center(
                              child: Text(
                                deleteString,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: backgroundLightColor2),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                        : Icon(Icons.arrow_forward_ios, size: 0.0237 * screenHeight, color: textLightColor,)
                  ],
                )
            )
        ),
      ),
      onTap: () {
        Navigate.pushNewScreen(context, ModuleDetailPage(name: name), true);
      },
    );
  }

  Widget bottomSheetWidget(BuildContext context, String title, TextStyle style) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0.011 * screenHeight,),
      decoration: BoxDecoration(
        color: backgroundLightColor2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
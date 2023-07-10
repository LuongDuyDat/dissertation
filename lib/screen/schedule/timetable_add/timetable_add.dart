import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/component/time_picker.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add/bloc/timetable_add_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add/bloc/timetable_add_event.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add/bloc/timetable_add_state.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../../component/button.dart';
import '../../../component/dropdown_field.dart';
import '../../../util/global.dart';
import '../../../util/navigate.dart';

class TimetableAddPage extends StatelessWidget {
  const TimetableAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimetableAddBloc(),
      child: const TimetableAddView(),
    );
  }
}

class TimetableAddView extends StatelessWidget {
  const TimetableAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text(addTimetableString),
        elevation: 0,
      ),
      body: BlocConsumer<TimetableAddBloc, TimetableAddState>(
        listenWhen: (previous, current) {
          return previous.submitStatus != current.submitStatus;
        },
        buildWhen: (previous, current) {
          return previous.submitStatus != current.submitStatus;
        },
        listener: (context, state) {
          if (state.submitStatus == TimetableAddStatus.success) {
            Navigate.popPage(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
            child: FormBuilder(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoryString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  SizedBox(
                    height: 0.06 * screenHeight,
                    child: DropDownField(
                      name: categoryString,
                      icon: Icon(Icons.school, size: 0.03 * screenHeight,),
                      dropdownString: categoryDropDownString,
                      hintText: categoryString,
                      inputBorder: const UnderlineInputBorder(),
                      hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      iconSize: 0.05 * screenHeight,
                      validator: FormBuilderValidators.required(),
                      onChange: (text) {
                        context.read<TimetableAddBloc>().add(TimeTableAddChangeType(type: text ?? ''));
                      },
                    ),
                  ),
                  SizedBox(height: 0.0324 * screenHeight,),
                  Text(moduleNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  SizedBox(
                    height: 0.06 * screenHeight,
                    child: InputField(
                      name: moduleNameString,
                      icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                      hintText: moduleNameString,
                      hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      obscure: false,
                      inputBorder: const UnderlineInputBorder(),
                      validator: FormBuilderValidators.required(),
                      onChange: (text) {
                        context.read<TimetableAddBloc>().add(TimeTableAddChangeTitle(title: text ?? ''));
                      },
                    ),
                  ),
                  SizedBox(height: 0.02 * screenHeight,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fromString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                          BlocBuilder<TimetableAddBloc, TimetableAddState>(
                            buildWhen: (previous, current) {
                              return previous.from != current.from;
                            },
                            builder: (context, state) {
                              return TimePicker(
                                title: fromString,
                                onChange: (time) {
                                  if (time != null) {
                                    context.read<TimetableAddBloc>().add(TimeTableAddChangeFromTime(time: time));
                                  }
                                },
                                time: state.from,
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(toString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                          BlocBuilder<TimetableAddBloc, TimetableAddState>(
                            buildWhen: (previous, current) {
                              return previous.to != current.to;
                            },
                            builder: (context, state) {
                              return TimePicker(
                                title: toString,
                                onChange: (time) {
                                  if (time != null) {
                                    context.read<TimetableAddBloc>().add(TimeTableAddChangeToTime(time: time));
                                  }
                                },
                                time: state.to,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 0.0324 * screenHeight,),
                  Text(lecturerString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  SizedBox(
                    height: 0.06 * screenHeight,
                    child: InputField(
                      name: lecturerString,
                      icon: Icon(Icons.person, size: 0.03 * screenHeight,),
                      hintText: lecturerString,
                      hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      obscure: false,
                      inputBorder: const UnderlineInputBorder(),
                      validator: FormBuilderValidators.required(),
                      onChange: (text) {
                        context.read<TimetableAddBloc>().add(TimeTableAddChangeLecturer(lecturer: text ?? ''));
                      },
                    ),
                  ),
                  SizedBox(height: 0.0324 * screenHeight,),
                  Text(locationString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  SizedBox(
                    height: 0.06 * screenHeight,
                    child: InputField(
                      name: locationString,
                      icon: Icon(Icons.location_pin, size: 0.03 * screenHeight,),
                      hintText: locationString,
                      hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      obscure: false,
                      inputBorder: const UnderlineInputBorder(),
                      validator: FormBuilderValidators.required(),
                      onChange: (text) {
                        context.read<TimetableAddBloc>().add(TimeTableAddChangeLocation(location: text ?? ''));
                      },
                    ),
                  ),
                  SizedBox(height: 0.0648 * screenHeight,),
                  state.submitStatus == TimetableAddStatus.loading ?
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      height: 0.056 * screenHeight,
                      width: 0.58 * screenWidth,
                      child: Center(
                        child: SizedBox(
                          width: 0.045 * screenHeight,
                          height: 0.045 * screenHeight,
                          child: const Center(
                            child: CircularProgressIndicator(color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ) :
                  Align(
                    alignment: Alignment.center,
                    child: Button(
                      type: 0,
                      width: 0.58 * screenWidth,
                      height: 0.056 * screenHeight,
                      text: addString,
                      onPressed: () {
                        if (formKey.currentState!.validate() && state.from != null && state.to != null) {
                          context.read<TimetableAddBloc>().add(const TimeTableAddSubmit());
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
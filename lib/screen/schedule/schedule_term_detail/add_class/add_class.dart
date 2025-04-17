import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/time_picker.dart';
import 'package:learning_intern_support_system/domain/entities/class_schedule_model.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_event.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../../../../component/button.dart';
import '../../../../component/dropdown_field.dart';
import '../../../../component/input_field.dart';
import '../../../../util/global.dart';
import '../../../../util/navigate.dart';
import '../../../../util/theme.dart';
import 'bloc/add_class_bloc.dart';
import 'bloc/add_class_event.dart';
import 'bloc/add_class_state.dart';

class AddClassPage extends StatelessWidget {
  const AddClassPage({
    super.key,
    required this.type,
    this.category,
    this.from,
    this.to,
    this.numberRepeat,
    this.unitRepeat,
    this.dayOfWeek,
    this.lecturer,
    this.location,
    required this.previousContext,
    this.index,
  });

  //type = 0: add; type = 1: edit
  final int type;
  final String? category;
  final TimeOfDay? from;
  final TimeOfDay? to;
  final int? numberRepeat;
  final String? unitRepeat;
  final int? dayOfWeek;
  final String? lecturer;
  final String? location;
  final BuildContext previousContext;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddClassBloc(
        category: category,
        fromTime: from,
        toTime: to,
        numberRepeat: numberRepeat,
        unitRepeat: unitRepeat,
        datOfWeek: dayOfWeek,
        lecturer: lecturer,
        location: location,
      ),
      child: AddClassView(
        type: type,
        category: category,
        from: from,
        to: to,
        numberRepeat: numberRepeat,
        unitRepeat: unitRepeat,
        dayOfWeek: dayOfWeek,
        lecturer: lecturer,
        location: location,
        previousContext: previousContext,
        index: index,
      ),
    );
  }
}

class AddClassView extends StatelessWidget {
  const AddClassView({
    super.key,
    required this.type,
    this.category,
    this.from,
    this.to,
    this.numberRepeat,
    this.unitRepeat,
    this.dayOfWeek,
    this.lecturer,
    this.location,
    required this.previousContext,
    this.index,
  });

  //type = 0: add; type = 1: edit
  final int type;
  final String? category;
  final TimeOfDay? from;
  final TimeOfDay? to;
  final int? numberRepeat;
  final String? unitRepeat;
  final int? dayOfWeek;
  final String? lecturer;
  final String? location;
  final BuildContext previousContext;
  final int? index;

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
        title: Text(
          type == 0 ? addClassString : editClassString,
          style: type == 0 ? Theme.of(context).textTheme.displayLarge : Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          type == 1 ? Padding(
            padding: EdgeInsets.only(right: 0.035 * screenWidth),
            child: InkWell(
              onTap: () {
                previousContext.read<ModuleDetailBloc>().add(ModuleDetailDeleteClass(index: index!));
                Navigate.popPage(context);
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  deleteString,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red),
                ),
              ),
            ),
          ) : const SizedBox(),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: BlocListener<AddClassBloc, AddClassState>(
          listenWhen: (previous, current) {
            return previous.submitStatus != current.submitStatus;
          },
          listener: (context, state) {
            if (state.submitStatus == AddClassStatus.success) {
              Navigate.popPage(context);
            }
          },
          child: Padding(
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
                        initialValue: category ?? '',
                        icon: Icon(Icons.class_, size: 0.03 * screenHeight,),
                        dropdownString: classTypeDropDownString,
                        hintText: categoryString,
                        inputBorder: const UnderlineInputBorder(),
                        hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        iconSize: 0.05 * screenHeight,
                        validator: FormBuilderValidators.required(),
                        onChange: (text) {
                          context.read<AddClassBloc>().add(AddClassChangeCategory(category: text ?? ''));
                        },
                      ),
                    ),
                    SizedBox(height: 0.0324 * screenHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fromString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                            BlocBuilder<AddClassBloc, AddClassState>(
                              buildWhen: (previous, current) {
                                return previous.from != current.from;
                              },
                              builder: (context, state) {
                                return TimePicker(
                                  title: fromString,
                                  onChange: (time) {
                                    if (time != null) {
                                      context.read<AddClassBloc>().add(AddClassChangeFromTime(time: time));
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
                            BlocBuilder<AddClassBloc, AddClassState>(
                              buildWhen: (previous, current) {
                                return previous.to != current.to;
                              },
                              builder: (context, state) {
                                return TimePicker(
                                  title: toString,
                                  onChange: (time) {
                                    if (time != null) {
                                      context.read<AddClassBloc>().add(AddClassChangeToTime(time: time));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(repeatString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                            SizedBox(
                              height: 0.06 * screenHeight,
                              width: 0.42 * screenWidth,
                              child: DropDownField(
                                name: repeatString,
                                initialValue: numberRepeat != null ? numberRepeat.toString() : '',
                                icon: Icon(Icons.timer, size: 0.03 * screenHeight,),
                                dropdownString: numberRepeatDropDownString,
                                hintText: repeatNumberString,
                                inputBorder: const UnderlineInputBorder(),
                                hintTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: hintLightText2),
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                iconSize: 0.05 * screenHeight,
                                validator: FormBuilderValidators.required(),
                                onChange: (number) {
                                  if (number != null) {
                                    context.read<AddClassBloc>().add(AddClassChangeNumberRepeat(number: int.parse(number)));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.06 * screenHeight,
                              width: 0.418 * screenWidth,
                              child: DropDownField(
                                name: '${repeatString}2',
                                initialValue: unitRepeat ?? '',
                                icon: Icon(Icons.timer, size: 0.03 * screenHeight,),
                                dropdownString: unitRepeatDropDownString,
                                hintText: unitString,
                                inputBorder: const UnderlineInputBorder(),
                                hintTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: hintLightText2),
                                textStyle: Theme.of(context).textTheme.bodyLarge,
                                iconSize: 0.05 * screenHeight,
                                validator: FormBuilderValidators.required(),
                                onChange: (text) {
                                  context.read<AddClassBloc>().add(AddClassChangeUnitRepeat(unit: text ?? ''));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 0.0324 * screenHeight,),
                    BlocBuilder<AddClassBloc, AddClassState>(
                      buildWhen: (previous, current) {
                        return (previous.dayOfWeek != current.dayOfWeek) || (previous.unitRepeat != current.unitRepeat);
                      },
                      builder: (context, state) {
                        if (state.unitRepeat != unitRepeatDropDownString[0]) {
                          return const Center();
                        }
                        final values = List.filled(7, false);
                        if (state.dayOfWeek != null) {
                          values[state.dayOfWeek!] = true;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(weekDaysString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                            SizedBox(height: 0.02 * screenHeight,),
                            WeekdaySelector(
                              onChanged: (int day) {
                                context.read<AddClassBloc>().add(AddClassChangeWeekDay(dayOfWeek: day));
                              },
                              values: values,
                              shortWeekdays: daysOfWeek,
                              firstDayOfWeek: 0,
                              selectedColor: backgroundLightColor2,
                              selectedFillColor: Theme.of(context).primaryColor,
                            ),
                            SizedBox(height: 0.0324 * screenHeight,),
                          ],
                        );
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lecturerString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                        SizedBox(
                          height: 0.06 * screenHeight,
                          child: InputField(
                            name: lecturerString,
                            initialValue: lecturer ?? '',
                            icon: Icon(Icons.person, size: 0.03 * screenHeight,),
                            hintText: lecturerString,
                            hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            obscure: false,
                            inputBorder: const UnderlineInputBorder(),
                            validator: FormBuilderValidators.required(),
                            onChange: (text) {
                              context.read<AddClassBloc>().add(AddClassChangeLecturer(lecturer: text ?? ''));
                            },
                          ),
                        ),
                        SizedBox(height: 0.0324 * screenHeight,),
                        Text(locationString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                        SizedBox(
                          height: 0.06 * screenHeight,
                          child: InputField(
                            name: locationString,
                            initialValue: location ?? '',
                            icon: Icon(Icons.location_pin, size: 0.03 * screenHeight,),
                            hintText: locationString,
                            hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            obscure: false,
                            inputBorder: const UnderlineInputBorder(),
                            validator: FormBuilderValidators.required(),
                            onChange: (text) {
                              context.read<AddClassBloc>().add(AddClassChangeLocation(location: text ?? ''));
                            },
                          ),
                        ),
                        SizedBox(height: 0.0648 * screenHeight,),
                        BlocBuilder<AddClassBloc, AddClassState>(
                          builder: (context, state) {
                            if (state.submitStatus == AddClassStatus.loading) {
                              return Align(
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
                              );
                            }
                            return Align(
                              alignment: Alignment.center,
                              child: Button(
                                type: 0,
                                width: 0.58 * screenWidth,
                                height: 0.056 * screenHeight,
                                text: type == 0 ? addString : editString,
                                onPressed: () {
                                  if (formKey.currentState!.validate() && state.from != null && state.to != null) {
                                    ClassScheduleModel newModel = ClassScheduleModel(
                                      category: state.category!,
                                      startTime: state.from!,
                                      endTime: state.to!,
                                      numberRepeat: state.number!,
                                      unitRepeat: state.unitRepeat!,
                                      dayOfWeek: state.dayOfWeek,
                                      lecturer: state.lecturer,
                                      location: state.location,
                                    );

                                    if (type == 0) {
                                      previousContext.read<ModuleDetailBloc>().add(ModuleDetailAddClass(classSchedule: newModel,));
                                    } else {
                                      previousContext.read<ModuleDetailBloc>().add(ModuleDetailEditClass(classSchedule: newModel, index: index!));
                                    }
                                    context.read<AddClassBloc>().add(const AddClassSubmit());
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 0.03 * screenHeight,),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ),
      )
    );
  }
}
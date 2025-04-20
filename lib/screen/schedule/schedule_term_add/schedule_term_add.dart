import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/date_picker.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add/bloc/schedule_term_add_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add/bloc/schedule_term_add_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add/bloc/schedule_term_add_state.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../component/button.dart';
import '../../../component/input_field.dart';
import '../../../util/global.dart';
import '../../../util/navigate.dart';
import '../../../util/theme.dart';

class TermAddPage extends StatelessWidget {
  const TermAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleTermAddBloc(),
      child: const ScheduleTermAddView(),
    );
  }
}

class ScheduleTermAddView extends StatelessWidget {
  const ScheduleTermAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final termFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text(addTermString),
        elevation: 0,
      ),
      body: BlocListener<ScheduleTermAddBloc, ScheduleTermAddState>(
        listenWhen: (previous, current) {
          return previous.submitStatus != current.submitStatus;
        },
        listener: (context, state) {
          if (state.submitStatus == ScheduleTermAddStatus.success) {
            Navigate.popPage(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(termString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              SizedBox(height: 0.004 * screenHeight,),
              FormBuilder(
                key: formKey,
                child: SizedBox(
                  height: 0.06 * screenHeight,
                  child: InputField(
                    formKey: termFieldKey,
                    name: termString,
                    icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                    hintText: termString,
                    hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    obscure: false,
                    inputBorder: const UnderlineInputBorder(),
                    validator: FormBuilderValidators.required(),
                    onChange: (text) {
                      context.read<ScheduleTermAddBloc>().add(ScheduleTermAddChangeTitle(title: text ?? ''));
                    },
                  ),
                ),
              ),
              SizedBox(height: 0.02 * screenHeight,),
              Text(startString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              SizedBox(height: 0.004 * screenHeight,),
              BlocBuilder<ScheduleTermAddBloc, ScheduleTermAddState>(
                buildWhen: (previous, current) {
                  return previous.start != current.start;
                },
                builder: (context, state) {
                  return DatePicker(
                    title: startString,
                    onChange: (date) {
                      if (date != null) {
                        context.read<ScheduleTermAddBloc>().add(ScheduleTermAddChangeStartDate(date: date));
                      }
                    },
                    date: state.start,
                  );
                },
              ),
              SizedBox(height: 0.02 * screenHeight,),
              Text(endString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              SizedBox(height: 0.004 * screenHeight,),
              BlocBuilder<ScheduleTermAddBloc, ScheduleTermAddState>(
                buildWhen: (previous, current) {
                  return previous.end != current.end;
                },
                builder: (context, state) {
                  return DatePicker(
                    title: endString,
                    onChange: (date) {
                      if (date != null) {
                        context.read<ScheduleTermAddBloc>().add(ScheduleTermAddChangeEndDate(date: date));
                      }
                    },
                    date: state.start,
                  );
                },
              ),
              SizedBox(height: 0.0648 * screenHeight,),
              BlocBuilder<ScheduleTermAddBloc, ScheduleTermAddState>(
                buildWhen: (previous, current) {
                  return previous.submitStatus != current.submitStatus;
                },
                builder: (context, state) {
                  if (state.submitStatus == ScheduleTermAddStatus.loading) {
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
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Button(
                        type: 0,
                        width: 0.58 * screenWidth,
                        height: 0.056 * screenHeight,
                        text: addString,
                        onPressed: () {
                          if (formKey.currentState!.validate() && state.start != null && state.end != null) {
                            context.read<ScheduleTermAddBloc>().add(const ScheduleTermAddSubmit());
                          }
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
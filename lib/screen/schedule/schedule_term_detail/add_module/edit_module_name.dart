import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/rectangle_with_color.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_event.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../../component/button.dart';
import '../../../../component/input_field.dart';
import '../../../../util/navigate.dart';
import '../../../../util/theme.dart';
import 'bloc/add_module_bloc.dart';
import 'bloc/add_module_event.dart';
import 'bloc/add_module_state.dart';

List<Color> colorList = [
  const Color(0xFFfe4a49),
  const Color(0xFF2ab7ca),
  const Color(0xFFfed766),
  const Color(0xFFf4b6c2),
  const Color(0xFF03396c),
  const Color(0xFFb3cde0),
  const Color(0xFF651e3e),
  const Color(0xFFfe8a71),
  const Color(0xFF4a4e4d),
  const Color(0xFF35a79c),
  const Color(0xFF7bc043),
  const Color(0xFF3d2352),
  const Color(0xFF8d5524),
  const Color(0xFFf1c27d),
  const Color(0xFFe3c9c9),
  const Color(0xFF8874a3),
];

class EditModuleNamePage extends StatelessWidget {
  const EditModuleNamePage({super.key, required this.type, this.initialValue, this.initialColor, this.index, required this.previousContext,});

  //type = 0: add; type = 1: edit
  final int type;
  final String? initialValue;
  final Color? initialColor;
  final int? index;
  final BuildContext previousContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddModuleBloc(initialColor: initialColor),
      child: EditModuleNameView(
        type: type,
        initialValue: initialValue,
        initialColor: initialColor,
        index: index,
        previousContext: previousContext,
      ),
    );
  }

}

class EditModuleNameView extends StatelessWidget {
  const EditModuleNameView({super.key, required this.type, this.initialValue, this.initialColor, this.index, this.previousContext,});

  //type = 0: add; type = 1: edit
  final int type;
  final String? initialValue;
  final Color? initialColor;
  final int? index;
  final BuildContext? previousContext;

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
          type == 0 ? addModuleString : editModuleString,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      body: BlocListener<AddModuleBloc, AddModuleState>(
        listenWhen: (previous, current) {
          return previous.submitStatus != current.submitStatus;
        },
        listener: (context, state) {
          if (state.submitStatus == AddModuleStatus.success) {
            Navigate.popPage(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(moduleNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              ),
              SizedBox(height: 0.004 * screenHeight,),
              FormBuilder(
                key: formKey,
                child: SizedBox(
                  height: 0.06 * screenHeight,
                  child: InputField(
                    name: moduleNameString,
                    initialValue: initialValue ?? '',
                    icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                    hintText: moduleNameString,
                    hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    obscure: false,
                    inputBorder: const UnderlineInputBorder(),
                    validator: FormBuilderValidators.required(),
                    onChange: (text) {
                      context.read<AddModuleBloc>().add(AddModuleChangeModuleName(moduleName: text ?? ''));
                    },
                  ),
                ),
              ),
              SizedBox(height: 0.0432 * screenHeight,),
              BlocBuilder<AddModuleBloc, AddModuleState>(
                buildWhen: (previous, current) {
                  return previous.color != current.color;
                },
                builder: (context, state) {
                  List<Widget> rectangles = [];
                  for (var color in colorList) {
                    if (color == state.color) {
                      rectangles.add(RectangleWithColor(
                        color: color,
                        width: 0.1168 * screenWidth,
                        height: 0.0648 * screenHeight,
                        border: true,
                        onPressed: () {
                          context.read<AddModuleBloc>().add(AddModuleChangeColor(color: color));
                        },
                      ));
                    } else {
                      rectangles.add(RectangleWithColor(
                        color: color,
                        width: 0.1168 * screenWidth,
                        height: 0.0648 * screenHeight,
                        onPressed: () {
                          context.read<AddModuleBloc>().add(AddModuleChangeColor(color: color));
                        },
                      ));
                    }
                  }
                  return Container(
                    width: double.infinity,
                    height: 0.4525 * screenHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.025 * screenHeight),
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth, vertical: 0.0345 * screenHeight),
                      child: Wrap(
                        spacing: 0.098 * screenWidth,
                        runAlignment: WrapAlignment.spaceBetween,
                        children: rectangles,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 0.0324 * screenHeight,),
              BlocBuilder<AddModuleBloc, AddModuleState>(
                builder: (context, state) {
                  if (state.submitStatus == AddModuleStatus.loading) {
                    return Container(
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
                    );
                  }
                  return Button(
                    type: 0,
                    width: 0.58 * screenWidth,
                    height: 0.056 * screenHeight,
                    text: type == 0 ? addString : finishString,
                    onPressed: () {
                      if (formKey.currentState!.validate() && state.color != Colors.transparent) {
                        if (type == 1) {
                          previousContext!.read<TermDetailBloc>().add(TermDetailEditModule(
                            moduleName: state.moduleName,
                            color: state.color,
                            index: index!,
                          ),);
                        } else {
                          previousContext!.read<TermDetailBloc>().add(TermDetailAddModule(
                            moduleName: state.moduleName,
                            color: state.color,
                          ),);
                        }
                        context.read<AddModuleBloc>().add(const AddModuleSubmit());
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
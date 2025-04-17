import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../util/global.dart';

class InputField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool obscure;
  final Icon? suffixIcon;
  final TextInputFormatter? textInputFormatter;
  final String? type;
  final void Function(String?)? onChange;
  final Function()? onSuffixIconTap;
  final InputBorder? inputBorder;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String name;
  final String? Function(String?)? validator;
  final String initialValue;

  const InputField({
    //required Key key,
    Key? key,
    required this.name,
    required this.icon,
    required this.hintText,
    this.suffixIcon,
    this.textInputFormatter,
    this.type,
    this.obscure = false,
    this.onChange,
    this.inputBorder,
    this.hintTextStyle,
    this.textStyle,
    this.validator,
    this.onSuffixIconTap,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      //key: key,
      name: name,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? Theme.of(context).textTheme.titleLarge,
        prefixIcon: icon,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02, right: 0),
          child: InkWell(
            onTap: onSuffixIconTap,
            child: suffixIcon,
          ),
        ) : const SizedBox(width: 0, height: 0),
        border: inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
        isDense: true,
      ),
      obscureText: obscure,
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      textAlignVertical: TextAlignVertical.center,
      validator: validator,
      onChanged: onChange,
    );
  }
}

class EditInputField extends StatelessWidget {
  final bool obscure;
  final Icon? suffixIcon;
  final TextInputFormatter? textInputFormatter;
  final String? type;
  final TextStyle style;
  final Function(String)? onChange;
  final String? initialText;
  final String? hintText;
  final String name;
  final String? Function(String?)? validator;

  const EditInputField({
    required Key key,
    required this.name,
    required this.obscure,
    this.suffixIcon,
    this.textInputFormatter,
    this.type,
    this.onChange,
    this.initialText,
    this.hintText,
    required this.style,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      //key: key,
      name: name,
      initialValue: initialText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02, right: 0, top: 0.01 * screenHeight,),
          child: suffixIcon,
        ) : const SizedBox(width: 0, height: 0),
        border: const UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
        isDense: true,
        hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: hintLightText2, fontWeight: FontWeight.w500),
        hintText: hintText ?? '',
        contentPadding: const EdgeInsets.only(top: 15),
      ),
      obscureText: obscure,
      style: style,
      validator: validator,
    );
  }

}
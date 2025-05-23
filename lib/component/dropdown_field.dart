import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../util/global.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
    Key? key,
    required this.formKey,
    required this.dropdownString,
    required this.hintText,
    this.icon,
    this.inputBorder,
    this.hintTextStyle,
    this.textStyle,
    this.iconSize,
    required this.name,
    this.validator,
    this.onChange,
    this.initialValue = '',
  }) : super(key: key);

  final Key formKey;
  final List<String> dropdownString;
  final String hintText;
  final Icon? icon;
  final InputBorder? inputBorder;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final double? iconSize;
  final String name;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      key: formKey,
      name: name,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? Theme.of(context).textTheme.titleLarge,
        prefixIcon: icon,
        border: inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
        isDense: true,
      ),
      iconSize: iconSize ?? 24,
      menuMaxHeight: screenHeight * 0.3,
      items: dropdownString.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      onChanged: onChange,
      validator: validator,
    );
  }

}
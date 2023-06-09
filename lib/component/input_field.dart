import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/global.dart';

class InputField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool obscure;
  final Icon? suffixIcon;
  final TextInputFormatter? textInputFormatter;
  final String? type;
  final Function(String)? onChange;
  final InputBorder? inputBorder;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;

  const InputField({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? Theme.of(context).textTheme.titleLarge,
        prefixIcon: icon,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02, right: 0),
          child: suffixIcon,
        ) : const SizedBox(width: 0, height: 0),
        border: inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
        isDense: true,
      ),
      obscureText: obscure,
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: [
        textInputFormatter != null
            ? textInputFormatter!
            : FilteringTextInputFormatter.deny(RegExp(r'')),
      ],
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

  const EditInputField({
    super.key,
    required this.obscure,
    this.suffixIcon,
    this.textInputFormatter,
    this.type,
    this.onChange,
    this.initialText,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02, right: 0, top: 0.01 * screenHeight,),
          child: suffixIcon,
        ) : const SizedBox(width: 0, height: 0),
        border: const UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 15),
      ),
      obscureText: obscure,
      style: style,
      inputFormatters: [
        textInputFormatter != null
            ? textInputFormatter!
            : FilteringTextInputFormatter.deny(RegExp(r'')),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../util/global.dart';

class InputField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final bool obscure;
  final Icon? suffixIcon;
  final TextInputFormatter? textInputFormatter;
  final String? type;
  final Function(String)? onChange;

  const InputField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.suffixIcon,
    this.textInputFormatter,
    this.type,
    this.obscure = false,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleLarge,
        prefixIcon: icon,
        suffixIcon: suffixIcon != null
            ? Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.02, right: 0),
          child: suffixIcon,
        ) : const SizedBox(width: 0, height: 0),
        contentPadding: EdgeInsets.only(top: screenHeight * 0.016,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
      ),
      obscureText: obscure,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      inputFormatters: [
        textInputFormatter != null
            ? textInputFormatter!
            : FilteringTextInputFormatter.deny(RegExp(r'')),
      ],
    );
  }
}
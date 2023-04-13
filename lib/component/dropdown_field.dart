import 'package:flutter/material.dart';

import '../util/global.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({
    super.key,
    required this.dropdownString,
    required this.hintText,
    this.icon,
    this.inputBorder,
    this.hintTextStyle,
    this.textStyle,
    this.iconSize,
  });

  final List<String> dropdownString;
  final String hintText;
  final Icon? icon;
  final InputBorder? inputBorder;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final double? iconSize;

  @override
  State<StatefulWidget> createState() => _DropDownFieldState();

}

class _DropDownFieldState extends State<DropDownField> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ?? Theme.of(context).textTheme.titleLarge,
        prefixIcon: widget.icon,
        border: widget.inputBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
        isDense: true,
      ),
      iconSize: widget.iconSize ?? 24,
      menuMaxHeight: screenHeight * 0.3,
      items: widget.dropdownString.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      onChanged: (e) {},
    );
  }

}
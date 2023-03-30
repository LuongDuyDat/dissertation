import 'package:flutter/material.dart';

import '../util/global.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({
    super.key,
    required this.dropdownString,
    required this.hintText,
    required this.icon,
  });

  final List<String> dropdownString;
  final String hintText;
  final Icon icon;

  @override
  State<StatefulWidget> createState() => _DropDownFieldState();

}

class _DropDownFieldState extends State<DropDownField> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleLarge,
        prefixIcon: widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.04)),
        ),
        isDense: true,
      ),
      menuMaxHeight: screenHeight * 0.3,
      items: widget.dropdownString.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
      onChanged: (e) {},
    );
  }

}
import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';

class SettingTextfield extends StatelessWidget {
  final String textLabel;
  final String textValue;
  final bool isMultiline;

  const SettingTextfield(
      {required this.textLabel,
      required this.textValue,
      required this.isMultiline,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        maxLines: isMultiline ? null : 1,
        cursorColor: accentColor,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: accentColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: accentColor,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: textLabel,
        ),
      ),
    );
  }
}

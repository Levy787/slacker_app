import 'package:flutter/material.dart';
import 'package:slacker/widgets/text_fields/rounded_text_field.dart';

class FormInputField extends StatelessWidget {
  final bool autofocus;
  final bool isPassword;
  final String titleText;
  final Color titleTextColor;
  final Color outlineColor;
  final Color fillColor;
  final String hintText;
  final double titleTextSize;

  FormInputField({
    this.autofocus = false,
    this.outlineColor = Colors.black,
    this.isPassword = false,
    this.titleText = '',
    this.titleTextSize = 18.0,
    this.titleTextColor = Colors.black,
    this.fillColor = Colors.white,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              titleText,
              style: TextStyle(color: titleTextColor, fontSize: titleTextSize),
            ),
          ),
          RoundedTextField(
            outlineColor: outlineColor,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
            fillColor: Colors.white,
            isPassword: isPassword,
            autofocus: autofocus,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}

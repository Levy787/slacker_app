import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final Color outlineColor;
  final EdgeInsets margin;
  final bool autofocus;
  final Color fillColor;

  RoundedTextField({
    this.isPassword = false,
    this.hintText = '',
    this.outlineColor,
    this.margin,
    this.autofocus = false,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextField(
        autofocus: autofocus,
        onChanged: (value) {}, //TODO: Implement on Changed
        textAlign: TextAlign.start,
        obscureText: isPassword,
        cursorColor: Colors.black,
        maxLines: 1,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fillColor, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outlineColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),

          ///This Changes the height of the textField
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Color outlineColor;
  final EdgeInsets margin;
  final bool autofocus;
  final Color fillColor;
  final IconData leadingIcon;
  final Function onTap;
  final FocusNode focusNode;

  SearchField({
    this.hintText = '',
    this.hintStyle = const TextStyle(color: Color(0xffa1a5af)),
    this.outlineColor,
    this.margin,
    this.autofocus = false,
    this.fillColor = Colors.white,
    this.leadingIcon = Icons.search,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      focusNode: focusNode,
      onEditingComplete: onTap,
      autofocus: autofocus,
      onChanged: (value) {}, //TODO: Implement on Changed
      textAlign: TextAlign.start,
      cursorColor: outlineColor,
      maxLines: 1,
      style: TextStyle(
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(leadingIcon),
        filled: true,
        fillColor: fillColor,
        hintStyle: hintStyle,
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
        ///Padding between text/icon and the textField border
        contentPadding:
            EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 10.0),
      ),
    );
  }
}

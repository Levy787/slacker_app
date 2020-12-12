import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;
  final double borderWidth;
  final double borderRadius;
  final String text;
  final Function onPressed;
  final EdgeInsets margin;

  RoundedButton({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.fontSize = 22.0,
    this.text,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderWidth = 0.0,
    this.borderRadius = 10,
    this.onPressed,
    this.margin = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          side: BorderSide(width: borderWidth, color: borderColor),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

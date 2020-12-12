import 'package:flutter/material.dart';

class FormHyperText extends StatelessWidget {
  final String normalText;
  final Color normalTextColor;
  final String linkText;
  final Color linkTextColor;
  final double fontSize;
  final Function onTap;
  final double spaceBetween;
  final EdgeInsets margin;
  final MainAxisAlignment mainAxisAlignment;

  FormHyperText({
    this.normalText = '',
    this.normalTextColor = const Color(0XFF424242),
    this.linkText = '',
    this.linkTextColor = const Color(0XFF1779B1),
    this.fontSize = 18,
    this.onTap,
    this.spaceBetween = 5.0,
    this.margin = const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
    this.mainAxisAlignment = MainAxisAlignment.end,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            normalText,
            style: TextStyle(
              fontSize: fontSize,
              color: normalTextColor,
            ),
          ),
          SizedBox(width: spaceBetween),
          InkWell(
            child: Text(
              linkText,
              style: TextStyle(
                fontSize: fontSize,
                color: linkTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

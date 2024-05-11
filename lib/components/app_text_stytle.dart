import 'package:flutter/material.dart';

class AppTextStyle extends StatelessWidget {
  const AppTextStyle({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 22.0,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

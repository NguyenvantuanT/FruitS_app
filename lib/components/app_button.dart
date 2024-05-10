import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 55.0,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.boderColor = Colors.white,
  });

  final String text;
  final Function()? onTap;
  final double height;
  final Color bgColor;
  final Color textColor;
  final Color boderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: boderColor),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 17),
          )),
    );
  }
}

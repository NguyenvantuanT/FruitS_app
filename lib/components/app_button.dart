import 'package:flutter/material.dart';
import 'package:nectar/themes/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 55.0,
  });

  final String text;
  final Function()? onTap;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: pyColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )),
    );
  }
}

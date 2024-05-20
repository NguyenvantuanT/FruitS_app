import 'package:flutter/material.dart';

class AppTextField2 extends StatelessWidget {
  const AppTextField2({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.obscureText = false,
    this.icon,
    this.labelText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            suffixIcon: icon,
          ),
          textInputAction: textInputAction,
          
        ),
        Divider(
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}

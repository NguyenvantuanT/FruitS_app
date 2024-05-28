import 'package:flutter/material.dart';

class AppTextFormField  extends StatelessWidget {
  const AppTextFormField ({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.obscureText = false,
    this.icon,
    this.labelText,this.validator,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validator,
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

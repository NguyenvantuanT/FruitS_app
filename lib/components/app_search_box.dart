import 'package:flutter/material.dart';

class AppSearchBox extends StatelessWidget {
  const AppSearchBox({super.key, this.controller, this.onchange});

  final TextEditingController? controller;
  final Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow:const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0
            )
          ]),
      child: TextField(
        onChanged: onchange,
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search Store",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.red),
            contentPadding: EdgeInsets.symmetric(vertical: 13.0)),            
      ),
    );
  }
}

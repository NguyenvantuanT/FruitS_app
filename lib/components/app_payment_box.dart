import 'package:flutter/material.dart';

class AppPayment extends StatelessWidget {
  const AppPayment({super.key, this.icon, required this.text, this.onTap,});

  final String text;
  final Icon? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 6.0)
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(text),
          Container(
            color: Colors.white,
            child: icon,
          )
        ]),
      ),
    );
  }
}

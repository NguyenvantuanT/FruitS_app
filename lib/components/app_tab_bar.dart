import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key, this.color, required this.text});

  final Color? color;
  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
          top: MediaQuery.of(context).padding.top + 20.0, bottom: 10.0),
      color: color,
      child: Column(children: [
        Image.asset(
          "assets/images/Icon.png",
          height: 30,
          width: 30,
        ),
        const Spacer(),
        Text(
          text,
          style:const TextStyle(color: Colors.black, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

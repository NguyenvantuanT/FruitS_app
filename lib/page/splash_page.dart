import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/page/onbording_page.dart';
import 'package:nectar/themes/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Route route = MaterialPageRoute(builder: (context) =>const OnbordingPage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.green,
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
      
    );
  }
}
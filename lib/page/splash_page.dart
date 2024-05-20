import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/page/admin_page.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/page/onbording_page.dart';
import 'package:nectar/page/root_page.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();
  bool isOnboarding = false;
  bool isLoging = false;
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  void _navigateTo(Widget page) {
    Route route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  void _checkLoginState() async {
    isOnboarding = await prefs.getOnboarding() ?? false;
    isLoging = await prefs.getLoging() ?? false;
    isAdmin = await prefs.getAdmin() ?? false;


    Timer(const Duration(seconds: 2), () {
      if (isOnboarding) {
        _navigateTo(const OnbordingPage());
      } else {
        if (isLoging) {
          if (isAdmin) {
            _navigateTo(const AdminPage());
          }else{
            _navigateTo(const RootPage());
          }
        } else {
          _navigateTo(const LoginPage());
        }
      }
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

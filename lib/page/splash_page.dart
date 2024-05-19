import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/models/auth_model.dart';
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

    Timer(const Duration(milliseconds: 4000), () {
      if (isLoging) {
        final user = persons.firstWhere((element) => element.isAdmin == true,orElse: () => AuthModel());
        if (user.isAdmin == true) {
          _navigateTo(const AdminPage());
        } else {
          _navigateTo(const RootPage());
        }
      } else {
        if (isOnboarding) {
          _navigateTo(const OnbordingPage());
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

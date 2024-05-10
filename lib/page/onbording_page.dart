import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/page/admin_user_page.dart';
import 'package:nectar/themes/colors.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/onbording.png",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 60,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  const Text(
                    "🥕",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const Text(
                    "to our store",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const Text(
                    "Get your groceries in as fast as one hour",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(height: 40),
                  FractionallySizedBox(
                      widthFactor: 0.9,
                      child: AppButton(
                        text: 'Get Started',
                        bgColor: pyColor,
                        boderColor: pyColor,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminUserPage()),
                              (route) => false);
                        },
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

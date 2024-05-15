import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/page/root_page.dart';
import 'package:nectar/themes/colors.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({super.key});

  @override
  State<AdminUserPage> createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg2.png",
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AppButton(
                      text: "Admin",
                      bgColor: AppColor.green,
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (context) => const LoginPage());
                        Navigator.pushAndRemoveUntil(
                            context, newRoute, (route) => false);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppButton(
                    text: "User",
                    bgColor: AppColor.green,
                    onTap: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => const RootPage());
                      Navigator.pushAndRemoveUntil(
                          context, newRoute, (route) => false);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

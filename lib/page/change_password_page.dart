import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/themes/colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool check = persons.any((element) => element.isLogin == true);
    AuthModel user = persons.firstWhere((element) => element.isLogin == check);

    void checkPass() {
      if (user.pass == passwordController.text) {
        if (newPasswordController.text == confirmPasswordController.text) {
          user.pass = newPasswordController.text.trim();
          setState(() {});
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>  LoginPage(email: user.email)),
              (route) => false);
        }
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg2.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppTextStyle(
                    text: 'Change Password',
                    fontSize: 23,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 30),
                  AppTextField2(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Current Password',
                    obscureText: obscureText1,
                    icon: IconButton(
                        onPressed: () =>
                            setState(() => obscureText1 = !obscureText1),
                        icon: obscureText1
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(height: 10),
                  AppTextField2(
                    controller: newPasswordController,
                    textInputAction: TextInputAction.next,
                    hintText: 'New Password',
                    obscureText: obscureText2,
                    icon: IconButton(
                        onPressed: () =>
                            setState(() => obscureText2 = !obscureText2),
                        icon: obscureText2
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(height: 10),
                  AppTextField2(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Confirm Password',
                    obscureText: obscureText3,
                    icon: IconButton(
                        onPressed: () =>
                            setState(() => obscureText3 = !obscureText3),
                        icon: obscureText3
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: 'Done',
                    boderColor: pyColor,
                    bgColor: pyColor,
                    onTap: checkPass,
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

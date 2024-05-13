import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/themes/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg2.png",
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(top: MediaQuery.of(context).padding.top + 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      const AppTextStyle(
                        text: "Sign Up",
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                      ),
                      const AppTextStyle(
                        text: "Enter your credentials to continue",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      const SizedBox(height: 30),
                      const AppTextStyle(
                        text: "Username",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      AppTextField2(
                        controller: usernameController,
                        hintText: "Enter Username",
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      const AppTextStyle(
                        text: "Email",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      AppTextField2(
                        controller: emailController,
                        hintText: "Enter Email",
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      const AppTextStyle(
                        text: "Password",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      AppTextField2(
                        controller: passwordController,
                        hintText: "Enter Password",
                        textInputAction: TextInputAction.done,
                        obscureText: obscureText,
                        icon: IconButton(
                            onPressed: () =>
                                setState(() => obscureText = !obscureText),
                            icon: Icon(obscureText
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        text: "Sign Up",
                        bgColor: pyColor,
                        boderColor: pyColor,
                        onTap: () {
                          AuthModel newUser = AuthModel(
                            name: usernameController.text.trim(),
                            email: emailController.text.trim(),
                            pass: passwordController.text,
                          );
                  
                          persons.add(newUser);
                          setState(() {});
                          Route newRoute = MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage(email: emailController.text));
                          Navigator.pushAndRemoveUntil(
                              context, newRoute, (route) => false);
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppTextStyle(
                            text: "Already have an account?",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage(
                                            email: emailController.text,
                                          )),
                                  (route) => false);
                            },
                            child: const AppTextStyle(
                              text: "Sign up",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0XFF53B175),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

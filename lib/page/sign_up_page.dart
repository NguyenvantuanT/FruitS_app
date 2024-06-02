import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_form_field.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool obscureText = true;
  SharedPrefs prefs = SharedPrefs();

  void addNewUser() {
    if (_formKey.currentState!.validate()) {
      AuthModel newUser = AuthModel(
        name: usernameController.text.trim(),
        email: emailController.text.trim(),
        pass: passwordController.text,
      );

      persons.add(newUser);
      prefs.saveAuthList(persons);
      setState(() {});
      Route newRoute = MaterialPageRoute(builder: (context) => LoginPage(email: emailController.text));
      Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tạo tài khoản thành công'),
        ),
      );
    }
  }

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
                  child: Form(
                    key: _formKey,
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
                        AppTextFormField(
                          controller: usernameController,
                          hintText: "Enter Username",
                          textInputAction: TextInputAction.next,
                          validator: checkUsername,
                        ),
                        const SizedBox(height: 15),
                        const AppTextStyle(
                          text: "Email",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey,
                        ),
                        AppTextFormField(
                          controller: emailController,
                          hintText: "Enter Email",
                          textInputAction: TextInputAction.next,
                          validator: checkEmail,
                        ),
                        const SizedBox(height: 15),
                        const AppTextStyle(
                          text: "Password",
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey,
                        ),
                        AppTextFormField(
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
                          validator: checkPass,
                        ),
                        const SizedBox(height: 30),
                        AppButton(
                            text: "Sign Up",
                            bgColor: AppColor.green,
                            onTap: addNewUser),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  String? checkUsername(value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập Username của bạn';
    }
    return null;
  }

  String? checkEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập Email của bạn';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Vui lòng nhập địa chỉ email hợp lệ';
    }
    for (var person in persons) {
      if (value == person.email) {
        return 'Email này đã được sử dụng';
      }
    }
    return null;
  }

  String? checkPass(value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập Pass của bạn';
    }
    return null;
  }
}

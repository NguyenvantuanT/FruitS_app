import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/admin_page.dart';
import 'package:nectar/page/root_page.dart';
import 'package:nectar/page/sign_up_page.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.email});

  final String? email;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      emailController.text = widget.email ?? "";
    }
    _getAuthList();
  }

  void _getAuthList() {
    prefs.getAuthList().then((value) {
      persons = value ?? [...persons];
      setState(() {});
    });
  }

  void checkUser() {
    final email = emailController.text;
    final pass = passwordController.text;

    AuthModel user = persons.firstWhere(
      (person) => person.email == email && person.pass == pass,
    );
    bool admin = user.isAdmin ?? false;
    user.isLogin = true;

    setState(() {
      prefs.setAdmin(admin);
      prefs.setLoging(true);
      prefs.saveAuthList(persons);
    });

    if (admin) {
      Route route = MaterialPageRoute(builder: (context) => const AdminPage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {
      Route route = MaterialPageRoute(builder: (context) => const RootPage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(user.isAdmin ?? false
            ? 'Admin login successful'
            : 'User login successful'),
      ),
    );
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      const AppTextStyle(
                        text: "Loging",
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                      ),
                      const AppTextStyle(
                        text: "Enter your emails and password",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      const SizedBox(height: 30),
                      const AppTextStyle(
                        text: "Email",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.grey,
                      ),
                      AppTextField2(
                        controller: widget.email != null
                            ? TextEditingController(text: widget.email)
                            : emailController,
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
                      const SizedBox(height: 40),
                      AppButton(
                          text: "Log In",
                          bgColor: AppColor.green,
                          onTap: checkUser),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppTextStyle(
                            text: "Don’t have an account?",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpPage()),
                                  (route) => false);
                            },
                            child: const AppTextStyle(
                              text: "Signup",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0XFF53B175),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_form_field.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  SharedPrefs prefs = SharedPrefs();

  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void changePassword() {
      if (_formKey.currentState!.validate()) {
        final currentPassword = currentPasswordController.text;
        final newPassword = newPasswordController.text;
        final confirmPassword = confirmPasswordController.text;

        bool currentPasswordMatch = false;
        bool newPasswordMatch = false;
        for (var person in persons) {
          if (person.pass == currentPassword) {
            currentPasswordMatch = true;
            break;
          }
        }

        if (!currentPasswordMatch) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Mật khẩu hiện tại không đúng'),
            ),
          );
          return;
        }

        if (newPassword == confirmPassword) {
          newPasswordMatch = true;
          for (var person in persons) {
            if (person.pass == currentPassword) {
              person.pass = newPassword;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã thay đổi mật khẩu thành công'),
                ),
              );
              break;
            }
          }
        }

        if (!newPasswordMatch) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Mật khẩu mới không trùng khớp'),
            ),
          );
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg2.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const AppTextStyle(
                        text: 'Change Password',
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        controller: currentPasswordController,
                        textInputAction: TextInputAction.next,
                        hintText: 'Current Password',
                        obscureText: obscureText1,
                        icon: IconButton(
                            onPressed: () =>
                                setState(() => obscureText1 = !obscureText1),
                            icon: obscureText1
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập pass của bạn';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập pass mới của bạn';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập lại pass mới của bạn';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        text: 'Done',
                        bgColor: AppColor.green,
                        onTap: changePassword,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

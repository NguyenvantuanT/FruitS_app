import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/admin_user_page.dart';
import 'package:nectar/page/change_password_page.dart';
import 'package:nectar/themes/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool check = persons.any((element) => element.isLogin == true);
    AuthModel user = persons.firstWhere((element) => element.isLogin == check);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
                top: MediaQuery.of(context).padding.top + 20, bottom: 25),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 30.0,
                  backgroundColor: pyColor,
                  child: Image.asset("assets/images/food_1.png"),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    AppTextStyle(
                      text: check ? user.name ?? "" : "Username",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    AppTextStyle(
                      text: check ? user.email ?? "" : 'Email@gmail.com',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black26,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(color: Colors.black26, thickness: 1.2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 10, bottom: 10),
            child: Row(
              children: [
                const Icon(Icons.password_outlined),
                const SizedBox(width: 20),
                const AppTextStyle(
                  text: "Change Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const ChangePasswordPage()));
                    }, icon: const Icon(Icons.chevron_right)),
              ],
            ),
          ),
          const Divider(color: Colors.black26, thickness: 1.2),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 10, bottom: 20),
            child: AppButton(
              text: "Log Out",
              bgColor: pyColor2,
              textColor: pyColor,
              boderColor: pyColor,
              onTap: () {
                user.isLogin = false;
                Route route = MaterialPageRoute(
                    builder: (context) => const AdminUserPage());
                Navigator.push(context, route);
              },
            ),
          )
        ],
      ),
    );
  }
}

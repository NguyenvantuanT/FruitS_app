import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/auth_model.dart';
import 'package:nectar/page/change_password_page.dart';
import 'package:nectar/page/log_in_page.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SharedPrefs prefs = SharedPrefs();
  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    prefs.getAuthList().then((value) {
      persons = value ?? [...persons];
      setState(() {});
    });
  }

  AuthModel? _loadCurrentUser() {
    final user = persons.firstWhere((element) => element.isLogin == true,orElse: () => AuthModel());
    return user.isLogin == true ? user : null;
  }

  void _logoutUser() {
    final currentUser = _loadCurrentUser();
    if (currentUser != null) {
      currentUser.isLogin = false;
    }
    prefs.saveAuthList(persons);
    setState(() {});
    Route route = MaterialPageRoute(builder: (context) => const LoginPage());
     Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final AuthModel? currentUser = _loadCurrentUser();
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
                  backgroundColor: AppColor.grey,
                  child: Image.asset("assets/images/food_1.png"),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    AppTextStyle(
                      text: currentUser?.name ?? "Username",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    AppTextStyle(
                      text: currentUser?.email ?? "Email@gmail.com",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordPage()));
                    },
                    icon: const Icon(Icons.chevron_right)),
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
              bgColor: AppColor.white,
              textColor: AppColor.green,
              boderColor: AppColor.green,
              onTap: _logoutUser,
            ),
          )
        ],
      ),
    );
  }
}

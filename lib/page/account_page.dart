import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/page/admin_user_page.dart';
import 'package:nectar/themes/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   

  //  bool check() {
  //   late bool isCheck ;
  //   (persons.any((element) => element.isLogin == true)) ? isCheck = true :  isCheck = false ;
  //   return isCheck;
  //  }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0).copyWith(
                top: MediaQuery.of(context).padding.top + 20, bottom: 25),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 30.0,
                  backgroundColor: pyColor,
                  child: Image.asset("assets/images/food_1.png"),
                ),
                SizedBox(width: 20),
                const  Column(
                  children: [
                    AppTextStyle(
                      text: "adda",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    AppTextStyle(
                       text: 
                          'Email@gmail.com',
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
            child: const Row(
              children: [
                Icon(Icons.password_outlined),
                SizedBox(width: 20),
                AppTextStyle(
                  text: "Change Password",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                Icon(Icons.chevron_right),
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
                // user.isLogin = false;
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

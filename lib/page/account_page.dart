import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? image;
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

    prefs.getAvata().then((value) {
      if (value == null) return;
      image = File(value);
      setState(() {});
    });
  }

  AuthModel? _loadCurrentUser() {
    return persons.firstWhere((element) => element.isLogin == true, orElse: () => AuthModel());
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
            child: _buildProfile(currentUser),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordPage())),
                  icon: const Icon(Icons.chevron_right),
                ),
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

  Widget _buildProfile(AuthModel? currentUser) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pickedImage(),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.brown),
                    borderRadius: const BorderRadius.all(Radius.circular(35)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 6.0)
                    ]),
                child: ClipOval(
                  child: image != null
                      ? Image.file(
                          image ?? File(''),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/food_1.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.green),
                  child: const Icon(
                    Icons.edit,
                    color: AppColor.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
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
          ),
        )
      ],
    );
  }

  Future pickedImage() async {
    final pickedImage  = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage  == null) return;
    final imageTemporary = File(pickedImage.path);
    prefs.setAvata(imageTemporary.path);
    setState(() => image = imageTemporary);
  }

  void _logoutUser() {
    for (var person in persons) {
        person.isLogin = false;
    }
    prefs.saveAuthList(persons);
    setState(() {});
    Route route = MaterialPageRoute(builder: (context) => const LoginPage());
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}
import 'package:flutter/material.dart';
import 'package:nectar/page/admin_user_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => const AdminUserPage());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.logout))),
    );
  }
}

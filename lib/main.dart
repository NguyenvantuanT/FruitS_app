import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/page/admin_page.dart';
import 'package:nectar/page/receipt_view_page.dart';
import 'package:nectar/page/splash_page.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminPage(),
    );
  }
}

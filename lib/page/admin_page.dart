import 'package:flutter/material.dart';
import 'package:nectar/page/account_page.dart';
import 'package:nectar/page/add_item_page.dart';
import 'package:nectar/page/receipt_view_page.dart';
import 'package:nectar/page/update_items_page.dart';
import 'package:nectar/themes/colors.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int selectIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics:  const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          AddItemPage(),
          UpdateItemsPage(),
          ReceiptViewPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.white,
          fixedColor: AppColor.green,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectIndex,
          onTap: (int index) {
            setState(() {
              selectIndex = index;
              _pageController.jumpToPage(selectIndex);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "New Item",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: "Update Item",
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: "Receipt",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            ),
          ]),
    );
  }
}

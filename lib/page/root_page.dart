import 'package:flutter/material.dart';
import 'package:nectar/page/account_page.dart';
import 'package:nectar/page/cart_page.dart';
import 'package:nectar/page/favourite_page.dart';
import 'package:nectar/page/home_page.dart';
import 'package:nectar/themes/colors.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          CartPage(),
          FavouritePages(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: pyColor,
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
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
            )
          ]),
    );
  }
}

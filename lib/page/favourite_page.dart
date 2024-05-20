import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_favoure_item.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/cart_page.dart';
import 'package:nectar/themes/colors.dart';

class FavouritePages extends StatefulWidget {
  const FavouritePages({super.key});

  @override
  State<FavouritePages> createState() => _FavouritePagesState();
}

class _FavouritePagesState extends State<FavouritePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
         backgroundColor: AppColor.white,
        title: const Text('Favourite',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(color: Colors.black26, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final favourite = favourites[index];
                  return FavouriteItem(favourite);
                },
                separatorBuilder: ((_,__) => Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey.shade500,
                      ),
                    )),
                itemCount: favourites.length,
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.9,
                child: AppButton(
                  text: 'Add All To Cart',
                  bgColor: AppColor.green,
                  onTap: () {
                    cartFruits.addAll(favourites);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_cart_detal.dart';
import 'package:nectar/components/app_row.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/order_accect.dart';
import 'package:nectar/page/payment_page.dart';
import 'package:nectar/themes/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    double sum = 0;
    for (var fruit in cartFruits) {
      sum += fruit.total;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              color: Colors.grey.shade400,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Divider(
                          color: Colors.grey.shade500,
                        ),
                      )),
                  itemCount: cartFruits.length,
                  itemBuilder: (context, index) {
                    final cart = cartFruits[index];
                    return AppCartDetail(
                      cartFruits: cart,
                      onAdd: () => setState(
                          () => cart.quantity = (cart.quantity ?? 0) + 1),
                      onRemove: () => cart.quantity == 1
                          ? null
                          : setState(
                              () => cart.quantity = (cart.quantity ?? 0) - 1),
                      onDelete: () => setState(() => cartFruits
                          .removeWhere((element) => element.id == cart.id)),
                    );
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 21.0, right: 20.0),
                child: AppTextStyle(
                  text: 'Total Price = ${totalPrice.toStringAsFixed(2)}',
                  fontSize: 16,
                )),
            const SizedBox(height: 8),
            _checkOut(context)
          ],
        ),
      ),
    );
  }

  Widget _checkOut(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: AppButton(
        text: "Go To Checkout",
        bgColor: pyColor,
        boderColor: pyColor,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentPage()),
          );
          // showModalBottomSheet(
          //     elevation: 0.9,
          //     backgroundColor: Colors.white,
          //     context: context,
          //     builder: (context) {
          //       return SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(15.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   const AppTextStyle(
          //                     text: "Checkout",
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                   TextButton(
          //                       onPressed: () => Navigator.pop(context),
          //                       child: const AppTextStyle(
          //                           text: "X", fontWeight: FontWeight.w500))
          //                 ],
          //               ),
          //             ),
          //             Divider(
          //               color: Colors.grey.shade500,
          //             ),
          //             const AppRow(text: "Delivery", text2: "Select Method"),
          //             const AppRow(text: "Payment", text2: "Card"),
          //             const AppRow(text: "Promo Code", text2: "Pick Discount"),
          //             AppRow(
          //                 text: "Total Cost",
          //                 text2: totalPrice.toStringAsFixed(2)),
          //             const SizedBox(height: 20),
          //             FractionallySizedBox(
          //               widthFactor: 0.7,
          //               child: AppButton(
          //                 text: "Place Order",
          //                 bgColor: pyColor,
          //                 boderColor: pyColor,
          //                 onTap: () {},
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //           ],
          //         ),
          //       );
          //     });
        },
      ),
    );
  }
}

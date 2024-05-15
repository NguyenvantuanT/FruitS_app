import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/themes/colors.dart';

class AppCartDetail extends StatelessWidget {
  const AppCartDetail(
      {super.key,
      required this.cartFruits,
      this.onAdd,
      this.onRemove,
      this.onDelete});
      
  final FruitModel cartFruits;
  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(
            cartFruits.img ?? "",
            width: 100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextStyle(
                      text: cartFruits.name ?? "",
                      fontSize: 15,
                    ),
                    TextButton(
                        onPressed: onDelete,
                        child: Text(
                          "X",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 20),
                        )),
                  ],
                ),
                AppTextStyle(
                  text: cartFruits.fs ?? "",
                  textColor: Colors.grey.shade500,
                  fontSize: 14,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                        onPressed: onRemove, icon: const Icon(Icons.remove)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15)
                          .copyWith(top: 7, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        cartFruits.quantity.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                        onPressed: onAdd,
                        icon: const Icon(
                          Icons.add,
                          color: AppColor.green,
                        )),
                    // const  SizedBox(width: 40),
                    const Spacer(),
                    AppTextStyle(
                        text: '\$ ${cartFruits.price ?? "0.0"}',
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}

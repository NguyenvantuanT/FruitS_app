// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/themes/colors.dart';

class FruitDetail extends StatefulWidget {
  const FruitDetail({super.key, required this.fruit});

  final FruitModel fruit;

  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.0),
            child: Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 6.0)
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: 
                  // widget.fruit.img != null
                  //     ? Image.file(File(widget.fruit.img ?? "") ,fit: BoxFit.cover,)
                  //     : null ,
                  Image.asset(
                          widget.fruit.img ?? "",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextStyle(
                        text: widget.fruit.name ?? "",
                        fontSize: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                      )
                    ],
                  ),
                  AppTextStyle(
                    text: widget.fruit.fs ?? "",
                    textColor: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.fruit.quantity == 1
                                ? null
                                : setState(
                                    () => widget.fruit.quantity =
                                        (widget.fruit.quantity ?? 0) - 1,
                                  );
                          },
                          icon: const Icon(Icons.remove)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15)
                            .copyWith(top: 7, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          widget.fruit.quantity.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      IconButton(
                          onPressed: () => setState(
                                () => widget.fruit.quantity =
                                    (widget.fruit.quantity ?? 0) + 1,
                              ),
                          icon: Icon(
                            Icons.add,
                            color: pyColor,
                          )),
                      const Spacer(),
                      AppTextStyle(
                          text: '\$ ${widget.fruit.price ?? "0.0"}',
                          fontSize: 20),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  const AppTextStyle(
                    text: "Product Detail",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 10),
                  AppTextStyle(
                    text: widget.fruit.description ?? "",
                    fontWeight: FontWeight.normal,
                    textColor: Colors.grey,
                    fontSize: 15,
                  ),
                  const Spacer(),
                  AppButton(
                    text: "Add To Basket",
                    height: 60,
                    onTap: () {
                      Navigator.pop(context);
                      cartFruits.add(widget.fruit);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';

class AppContainerFruit extends StatelessWidget {
  const AppContainerFruit({
    super.key,
    required this.fruit,
    this.onPressed,
  });

  final FruitModel fruit;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: 135,
            padding:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1.2),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: 
                    //  fruit.img != null ? Image.file(File(fruit.img ?? "")) : null
                    Image.asset(
                      fruit.img ?? "",
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AppTextStyle(
                    text: fruit.name ?? "",
                    fontSize: 13,
                  ),
                  AppTextStyle(
                    text: fruit.fs ?? "",
                    fontSize: 12,
                    textColor: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextStyle(
                        text: "\$ ${fruit.price ?? "0"}",
                        fontSize: 14,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

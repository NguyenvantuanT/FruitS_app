import 'package:flutter/material.dart';
import 'package:nectar/components/app_fruit_detail.dart';
import 'package:nectar/models/fruit_model.dart';

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
        body: AppFruitDetail(
          fruit: widget.fruit,
          onAdd: () {
            setState(
              () => widget.fruit.quantity = (widget.fruit.quantity ?? 0) + 1,
            );
          },
          onRemove: () {
            widget.fruit.quantity == 1
                ? null
                : setState(
                    () => widget.fruit.quantity =
                        (widget.fruit.quantity ?? 0) - 1,
                  );
          },
          onfavorite: () => favourites.add(widget.fruit),
          onTap: () {
            Navigator.pop(context);
            cartFruits.add(widget.fruit);
          },
        ));
  }
}

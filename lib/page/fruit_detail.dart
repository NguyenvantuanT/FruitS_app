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
    final Fruit = widget.fruit;

    void addToFavourite() {
      setState(() {
        Fruit.isFavourite = !Fruit.isFavourite;
        if (Fruit.isFavourite) {
          favourites.add(Fruit);
        } else {
          favourites.removeWhere((element) => element.id == Fruit.id);
        }
      });
    }

    void addToCart() {
      setState(() {
        Fruit.isCart = !Fruit.isCart;
        if (Fruit.isCart) {
          cartFruits.add(Fruit);
          Navigator.pop(context);
        }
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: AppFruitDetail(
          fruit: Fruit,
          onAdd: () {
            setState(
              () => Fruit.quantity = (Fruit.quantity ?? 0) + 1,
            );
          },
          onRemove: () {
            Fruit.quantity == 1
                ? null
                : setState(
                    () => Fruit.quantity = (Fruit.quantity ?? 0) - 1,
                  );
          },
          onfavorite: addToFavourite,
          onTap: addToCart,
        ));
  }
}

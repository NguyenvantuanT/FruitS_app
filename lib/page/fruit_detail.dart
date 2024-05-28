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
    final sruit = widget.fruit;

    void addToFavourite() {
     
        sruit.isFavourite = !sruit.isFavourite;
        if (sruit.isFavourite) {
          favourites.add(sruit);
        } else {
          favourites.removeWhere((element) => element.id == sruit.id);
        }
       setState(() {});
    }

    void addToCart() {
      setState(() {
        sruit.isCart = !sruit.isCart;
        if (sruit.isCart) {
          cartFruits.add(sruit);
          Navigator.pop(context);
        }
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: AppFruitDetail(
          fruit: sruit,
          onAdd: () {
            setState(
              () => sruit.quantity = (sruit.quantity ?? 0) + 1,
            );
          },
          onRemove: () {
            sruit.quantity == 0
                ? null
                : setState(
                    () => sruit.quantity = (sruit.quantity ?? 0) - 1,
                  );
          },
          onfavorite: addToFavourite,
          onTap: addToCart,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem(
    this.favourite, {
    super.key,
  });

  final FruitModel favourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset(
            favourite.img ?? '',
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                AppTextStyle(
                  text: favourite.name ?? '',
                  fontSize: 14,
                ),
                AppTextStyle(
                  text: favourite.fs ?? '',
                  fontSize: 13,
                  textColor: Colors.black26,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextStyle(
                  text: '\$ ${favourite.price?.toStringAsFixed(2) ?? 0.0}',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                const SizedBox(width: 5.0),
                IconButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => FruitDetail(fruit: favourite));
                    Navigator.push(context, route);
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

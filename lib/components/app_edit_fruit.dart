import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';

class AppEditFruit extends StatelessWidget {
  const AppEditFruit(
    this.fruit, {
    super.key,
    this.onDelete,
    this.onTap,
    this.icon,
  });

  final Function()? onTap;
  final Function()? onDelete;
  final FruitModel fruit;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0),
                blurRadius: 6.0),
          ],
        ),
        child: ListTile(
          leading: Image.asset(fruit.img ?? ''),
          title: AppTextStyle(
            text: fruit.name ?? "",
            fontSize: 17,
            fontWeight: FontWeight.normal,
            textColor: Colors.black,
          ),
          subtitle: AppTextStyle(
            text: 'Price: ${fruit.price ?? '0'}',
            fontSize: 15,
            fontWeight: FontWeight.normal,
            textColor: Colors.grey,
          ),
          trailing: GestureDetector(
            onTap: onDelete,
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: icon != null
                  ? CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 16.6,
                      child: icon,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

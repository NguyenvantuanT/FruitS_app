import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';

class UpdateItemsPage extends StatefulWidget {
  const UpdateItemsPage({Key? key}) : super(key: key);

  @override
  State<UpdateItemsPage> createState() => _UpdateItemsPageState();
}

class _UpdateItemsPageState extends State<UpdateItemsPage> {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController newDescriptionController = TextEditingController();
  TextEditingController newfsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Items'),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return GestureDetector(
            child: ListTile(
              leading: Image.asset(fruit.img ?? ''),
              title: Text(fruit.name ?? ''),
              subtitle: Text('Price: ${fruit.price}'),
              trailing: IconButton(
                  onPressed: () => setState(() =>
                      fruits.removeWhere((element) => element.id == fruit.id)),
                  icon: const Icon(Icons.delete)),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Update Item"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              AppTextField2(
                                controller: newNameController,
                                labelText: 'Name',
                                textInputAction: TextInputAction.next,
                              ),
                              AppTextField2(
                                controller: newPriceController,
                                labelText: 'Price',
                                textInputAction: TextInputAction.next,
                              ),
                              AppTextField2(
                                controller: newDescriptionController,
                                labelText: 'Description',
                                textInputAction: TextInputAction.done,
                              ),
                              AppTextField2(
                                controller: newfsController,
                                labelText: 'fs',
                                textInputAction: TextInputAction.done,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        FruitModel updateFruit = FruitModel(
                                          name: newNameController.text.trim(),
                                           img: fruit.img != null ? fruit.img : "assets/images/food_2.png",
                                          price: double.parse(newPriceController.text),
                                          fs: newfsController.text.trim(),
                                          description: newDescriptionController.text.trim(),
                                          quantity: fruit.quantity,
                                        );

                                        fruits[index] = updateFruit ;

                                        favourites.removeWhere((element) => element.id == fruit.id );
                                        if(fruit.isFavourite == true){
                                            favourites.add(updateFruit);
                                        }

                                        cartFruits.removeWhere((element) => element.id == fruit.id );
                                        if(fruit.isCart == true){
                                            cartFruits.add(updateFruit);
                                        }

                                        setState(() {});
                                        newNameController.clear();
                                        newDescriptionController.clear();
                                        newPriceController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: const AppTextStyle(
                                        text: "Save",
                                        textColor: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const AppTextStyle(
                                        text: "No",
                                        textColor: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
            },
          );
        },
      ),
    );
  }
}

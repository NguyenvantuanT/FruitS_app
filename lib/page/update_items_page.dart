import 'package:flutter/material.dart';
import 'package:nectar/components/app_edit_fruit.dart';
import 'package:nectar/components/app_search_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/components/app_text_form_field.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/services/local/shared_prefs.dart';
import 'package:nectar/themes/colors.dart';

class UpdateItemsPage extends StatefulWidget {
  const UpdateItemsPage({Key? key}) : super(key: key);

  @override
  State<UpdateItemsPage> createState() => _UpdateItemsPageState();
}

class _UpdateItemsPageState extends State<UpdateItemsPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController newDescriptionController = TextEditingController();
  TextEditingController newfsController = TextEditingController();

  SharedPrefs prefs = SharedPrefs();

  List<FruitModel> listSearch = [];

  @override
  void initState() {
    super.initState();
    _getFruitList();
  }

  void _getFruitList() {
    prefs.getFruitList().then((value) {
      fruits = value ?? [...fruits];
      listSearch = [...fruits];
      setState(() {});
    });
  }

  void _search(String value) {
    value = value.toLowerCase();
    listSearch = fruits
        .where((element) => (element.name ?? '').toLowerCase().contains(value))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const AppTabBar(
        color: AppColor.white,
        text: "Dhaka, Banassre",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 8),
            child: AppSearchBox(
              controller: searchController,
              onchange: _search,
            ),
          ),
          const SizedBox(height: 16.0),
          _divider(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: 10, bottom: 30),
              separatorBuilder: (_, __) => const SizedBox(height: 10.0),
              itemCount: listSearch.length,
              itemBuilder: (context, index) {
                final fruit = listSearch.reversed.toList()[index];
                return AppEditFruit(
                  fruit,
                  onDelete: () => _delete(context, fruit),
                  onTap: () => _editing(context, fruit),
                  icon:
                      const Icon(Icons.delete, size: 18.0, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      height: 1.2,
      color: AppColor.grey,
    );
  }

  void _delete(BuildContext context, FruitModel fruit) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text('😒'),
              content: const SingleChildScrollView(
                child: ListBody(children: [
                  Text("Do you want delete",
                      style: TextStyle(color: Colors.brown, fontSize: 20.0),
                      textAlign: TextAlign.center),
                ]),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      fruits.removeWhere((element) => element.id == fruit.id);
                      listSearch.removeWhere((element) => element.id == fruit.id);
                      cartFruits.removeWhere((element) => element.id == fruit.id);
                      favourites.removeWhere((element) => element.id == fruit.id);
                      prefs.saveFruitList(fruits);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Yes",
                      style: TextStyle(),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "No",
                      style: TextStyle(),
                    ))
              ],
            ));
  }

  void _editing(BuildContext context, FruitModel fruit) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text("Update Item"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    AppTextFormField(
                      controller: newNameController,
                      labelText: 'Name',
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextFormField(
                      controller: newPriceController,
                      labelText: 'Price',
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextFormField(
                      controller: newDescriptionController,
                      labelText: 'Description',
                      textInputAction: TextInputAction.done,
                    ),
                    AppTextFormField(
                      controller: newfsController,
                      labelText: 'fs',
                      textInputAction: TextInputAction.done,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              fruit.name = newNameController.text.trim();
                              fruit.price = double.parse(newPriceController.text);
                              fruit.fs = newfsController.text.trim();
                              fruit.description =
                                  newDescriptionController.text.trim();

                              _updateFavorites(fruit);
                              _updateCartFruits(fruit);

                              prefs.saveFruitList(fruits);
                              setState(() {});
                              newNameController.clear();
                              newDescriptionController.clear();
                              newPriceController.clear();
                              newfsController.clear();
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
  }

  void _updateCartFruits(FruitModel fruit) {
    if (fruit.isCart) {
      cartFruits.removeWhere((element) => element.id == fruit.id);
      cartFruits.add(fruit);
      return;
    }
  }

  void _updateFavorites(FruitModel fruit) {
    if (fruit.isFavourite) {
      favourites.removeWhere((element) => element.id == fruit.id);
      favourites.add(fruit);
      return;
    }
  }
}

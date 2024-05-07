import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
// import 'package:nectar/components/app_button.dart';
// import 'package:nectar/components/app_text_filder.dart';
// import 'package:nectar/page/update_items_page.dart';
// import 'package:nectar/themes/colors.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/update_items_page.dart';
import 'package:nectar/themes/colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void addNewFruit() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      FruitModel newFruit = FruitModel(
        id: newFruits.length + 1,
        name: nameController.text.trim(),
        price: double.parse(priceController.text),
        description: descriptionController.text.trim(),
        fs: 'Fresh',
        img: pickedImage.path,
        quantity: 0,
      );
      print(pickedImage.path);
      newFruits.add(newFruit);
    }
  }

  ///data/user/0/com.example.nectar/cache/51f55ace-de78-4814-98e8-d62869542756/food_2.png

  Future<void> saveData(List<FruitModel> fruits) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> encodedDataList =
        fruits.map((data) => json.encode(data.toJson())).toList();
    prefs.setStringList("data", encodedDataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fruit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField2(
                controller: nameController,
                labelText: 'Name',
                textInputAction: TextInputAction.next,
              ),
              AppTextField2(
                controller: priceController,
                labelText: 'Price',
                textInputAction: TextInputAction.next,
              ),
              AppTextField2(
                controller: descriptionController,
                labelText: 'Description',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 40),
              AppButton(
                text: "Add Fruit",
                onTap: () async {
                  nameController.clear();
                  priceController.clear();
                  descriptionController.clear();
                  await saveData(fruits);
                  Route route = MaterialPageRoute(builder: (context) => const UpdateItemsPage());
                  Navigator.push(context, route);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pyColor,
        onPressed: addNewFruit,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

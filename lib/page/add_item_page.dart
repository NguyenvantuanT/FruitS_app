import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/themes/colors.dart';

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
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      FruitModel newFruit = FruitModel(
        id: fruits.length + 1,
        name: nameController.text.trim(),
        price: double.parse(priceController.text),
        description: descriptionController.text.trim(),
        fs: 'Fresh',
        img: "assets/images/food_2.png",
        quantity: 0,
      );
      fruits.add(newFruit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(
        text: "Dhaka, Banassre",
        color: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.grey,
                height: 1.2,
              ),
              const SizedBox(height: 15),
              const AppTextStyle(text: "Add new fruit"),
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
                bgColor: pyColor,
                boderColor: pyColor,
                onTap: () async {
                  nameController.clear();
                  priceController.clear();
                  descriptionController.clear();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pyColor,
        onPressed: addNewFruit,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/admin_user_page.dart';
import 'package:nectar/page/update_items_page.dart';
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
      appBar: AppBar(
        title: const Text('Add Fruit'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (context) => const AdminUserPage());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.logout))
        ],
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
                bgColor: pyColor,
                boderColor: pyColor,
                onTap: () async {
                  nameController.clear();
                  priceController.clear();
                  descriptionController.clear();
                  Route route = MaterialPageRoute(
                      builder: (context) => const UpdateItemsPage());
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
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

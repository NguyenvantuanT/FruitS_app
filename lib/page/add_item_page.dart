import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_text_filder.dart';
import 'package:nectar/models/fruit_model.dart';
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
      newFruits.add(newFruit);
      await saveFruitsToHive(newFruits);
    }
  }

  Future<void> saveFruitsToHive(List<FruitModel> fruits) async {
    final box = await Hive.openBox<FruitModel>('newFruits');
    await box.addAll(fruits);
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
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

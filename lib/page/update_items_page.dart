import 'dart:io';

import 'package:hive/hive.dart';


import 'package:flutter/material.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/fruit_detail.dart';

class UpdateItemsPage extends StatefulWidget {
  const UpdateItemsPage({Key? key}) : super(key: key);

  @override
  State<UpdateItemsPage> createState() => _UpdateItemsPageState();
}

class _UpdateItemsPageState extends State<UpdateItemsPage> {
   @override
  void initState() {
    super.initState();
    getFruitsFromHive();
  }

  Future<List<FruitModel>> getFruitsFromHive() async {
    final box = await Hive.openBox<FruitModel>('newFruits');
    return box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Items'),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newFruits.length,
        itemBuilder: (context, index) {
          final fruit = newFruits[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FruitDetail(fruit: fruit),
              ),
            ),
            child: ListTile(
              leading: Image.file(File(fruit.img ?? "")),  
              title: Text(fruit.name ?? ''),  
              subtitle: Text('Price: ${fruit.price}'),
            ),
          );
        },
      ),
    );
  }
}

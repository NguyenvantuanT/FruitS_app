import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';

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
    loadData();
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? encodedDataList = prefs.getStringList("data");
    if (encodedDataList != null) {
      setState(() {
        fruits = encodedDataList
            .map((data) => FruitModel.fromJson(json.decode(data)))
            .toList();
      });
    }
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
              leading: fruit.img != null ? Image.file(File(fruit.img ?? "")) : null,
              title: Text(fruit.name ?? ''),
              subtitle: Text('Price: ${fruit.price}'),
            ),
          );
        },
      ),
    );
  }
}

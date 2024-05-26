import 'dart:convert';

import 'package:nectar/models/auth_model.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String keyFruit = 'keyFruit';
  final String keyAuth = 'keyAuth';
  final String keyOnboarding = 'keyOnboarding';

//avata
  Future<String?> getAvata() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString('keyAvata');
  }

  Future<void> setAvata(String path) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString('keyAvata', path);
  }

  //Onboarding
  Future<bool?> getOnboarding() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool(keyOnboarding);
  }

  Future<void> setOnboarding(bool onboarding) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setBool(keyOnboarding, onboarding);
  }

  //Fruit
  Future<List<FruitModel>?> getFruitList() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString(keyFruit);
    if (data == null) return null;
    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

    return maps.map((e) => FruitModel.fromJson(e)).toList();
  }

  Future<void> saveFruitList(List<FruitModel> fruits) async {
    SharedPreferences prefs = await _prefs;
    List<Map<String, dynamic>> maps = fruits.map((e) => e.toJson()).toList();
    prefs.setString(keyFruit, jsonEncode(maps));
  }

  //Auth
  Future<List<AuthModel>?> getAuthList() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString(keyAuth);
    if (data == null) return null;
    List<Map<String, dynamic>> maps = jsonDecode(data)
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

    return maps.map((e) => AuthModel.fromJson(e)).toList();
  }

  Future<void> saveAuthList(List<AuthModel> persons) async {
    SharedPreferences prefs = await _prefs;
    List<Map<String, dynamic>> maps = persons.map((e) => e.toJson()).toList();
    prefs.setString(keyAuth, jsonEncode(maps));
  }
}

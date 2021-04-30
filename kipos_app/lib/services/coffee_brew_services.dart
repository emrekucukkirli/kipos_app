import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_brew_model.dart';

class CoffeeBrewServices {
  static Future<List<CoffeeBrew>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/coffee_brew_data.json');
    final body = json.decode(data);

    return body.map<CoffeeBrew>(CoffeeBrew.fromJson).toList();
  }
}

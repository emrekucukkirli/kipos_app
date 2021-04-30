import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_model.dart';

class CoffeeServices {
  static Future<List<Coffee>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/coffee_data.json');
    final body = json.decode(data);

    return body.map<Coffee>(Coffee.fromJson).toList();
  }
}

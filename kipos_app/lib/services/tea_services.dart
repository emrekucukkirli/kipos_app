import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/tea_model.dart';

class CoffeeServices {
  static Future<List<Tea>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/tea_data.json');
    final body = json.decode(data);

    return body.map<Tea>(Tea.fromJson).toList();
  }
}

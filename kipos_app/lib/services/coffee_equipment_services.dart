import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_equipment_model.dart';

class CoffeeEquipmentServices {
  static Future<List<CoffeeEquipment>> getUsersLocally(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data =
        await assetBundle.loadString('assets/coffee_equipment_data.json');
    final body = json.decode(data);

    return body.map<CoffeeEquipment>(CoffeeEquipment.fromJson).toList();
  }
}

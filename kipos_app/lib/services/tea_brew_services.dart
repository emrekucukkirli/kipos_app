import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/tea_brew_model.dart';

class TeaBrewServices {
  static Future<List<TeaBrew>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/tea_brew_data.json');
    final body = json.decode(data);

    return body.map<TeaBrew>(TeaBrew.fromJson).toList();
  }
}

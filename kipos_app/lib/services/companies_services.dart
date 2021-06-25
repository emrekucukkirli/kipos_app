import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/companies_model.dart';

class CompaniesServices {
  static Future<List<Company>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/companies_data.json');
    final body = json.decode(data);

    return body.map<Company>(Company.fromJson).toList();
  }
}

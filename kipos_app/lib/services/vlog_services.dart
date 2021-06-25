import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/vlog_model.dart';

class VlogServices {
  static Future<List<Vlog>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/vlog_data.json');
    final body = json.decode(data);

    return body.map<Vlog>(Vlog.fromJson).toList();
  }
}

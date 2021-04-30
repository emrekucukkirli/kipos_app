import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kipos_app/models/post_model.dart';

class PostServices {
  static Future<List<Post>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/post_data.json');
    final body = json.decode(data);

    return body.map<Post>(Post.fromJson).toList();
  }
}

import 'package:kipos_app/services/dbhelper.dart';

class Recipe {
  int id;
  String name;
  String content;

  Recipe(this.id, this.name, this.content);

  Recipe.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    content = map['content'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnContent: content,
    };
  }
}

import 'package:meta/meta.dart';

class Tea {
  final int id;
  final String name;
  final String contents;
  final String taste;
  final String drinktime;
  final String definition;
  final String format1;
  final String format2;
  final String format3;
  final String format4;
  final String imgurl;

  const Tea({
    @required this.id,
    @required this.name,
    @required this.contents,
    @required this.taste,
    @required this.drinktime,
    @required this.definition,
    @required this.format1,
    @required this.format2,
    @required this.format3,
    @required this.format4,
    @required this.imgurl,
  });

  static Tea fromJson(json) => Tea(
        id: json['id'],
        name: json['name'],
        contents: json['contents'],
        taste: json['taste'],
        drinktime: json['drinktime'],
        definition: json['definition'],
        format1: json['format1'],
        format2: json['format2'],
        format3: json['format3'],
        format4: json['format4'],
        imgurl: json['imgurl'],
      );
}

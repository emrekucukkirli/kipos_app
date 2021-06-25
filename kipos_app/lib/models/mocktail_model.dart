import 'package:meta/meta.dart';

class Mocktail {
  final int id;
  final String name;
  final String contents;
  final String preparing;
  final String imgurl;

  const Mocktail({
    @required this.id,
    @required this.name,
    @required this.contents,
    @required this.preparing,
    @required this.imgurl,
  });

  static Mocktail fromJson(json) => Mocktail(
        id: json['id'],
        name: json['name'],
        contents: json['contents'],
        preparing: json['preparing'],
        imgurl: json['imgurl'],
      );
}

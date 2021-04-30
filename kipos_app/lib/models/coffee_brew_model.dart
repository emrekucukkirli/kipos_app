import 'package:meta/meta.dart';

class CoffeeBrew {
  final int id;
  final String title;
  final String writer;
  final String category;
  final String body;
  final String imgurl;

  const CoffeeBrew({
    @required this.id,
    @required this.title,
    @required this.writer,
    @required this.category,
    @required this.body,
    @required this.imgurl,
  });

  static CoffeeBrew fromJson(json) => CoffeeBrew(
        id: json['id'],
        title: json['title'],
        writer: json['writer'],
        category: json['category'],
        body: json['body'],
        imgurl: json['imgurl'],
      );
}

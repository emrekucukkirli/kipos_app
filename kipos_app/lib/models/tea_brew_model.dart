import 'package:meta/meta.dart';

class TeaBrew {
  final int id;
  final String title;
  final String writer;
  final String category;
  final String body;
  final String imgurl;

  const TeaBrew({
    @required this.id,
    @required this.title,
    @required this.writer,
    @required this.category,
    @required this.body,
    @required this.imgurl,
  });

  static TeaBrew fromJson(json) => TeaBrew(
        id: json['id'],
        title: json['title'],
        writer: json['writer'],
        category: json['category'],
        body: json['body'],
        imgurl: json['imgurl'],
      );
}

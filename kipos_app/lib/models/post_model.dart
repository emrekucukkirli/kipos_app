import 'package:meta/meta.dart';

class Post {
  final int id;
  final String title;
  final String writer;
  final String date;
  final String body;
  final String imgurl;

  const Post({
    @required this.id,
    @required this.title,
    @required this.writer,
    @required this.date,
    @required this.body,
    @required this.imgurl,
  });

  static Post fromJson(json) => Post(
        id: json['id'],
        title: json['title'],
        writer: json['writer'],
        date: json['date'],
        body: json['body'],
        imgurl: json['imgurl'],
      );
}

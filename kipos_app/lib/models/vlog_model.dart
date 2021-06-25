import 'package:meta/meta.dart';

class Vlog {
  final int id;
  final String title;
  final String date;
  final String videourl;

  const Vlog({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.videourl,
  });

  static Vlog fromJson(json) => Vlog(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        videourl: json['videourl'],
      );
}

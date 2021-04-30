import 'package:meta/meta.dart';

class Coffee {
  final int id;
  final String name;
  final String subname;
  final String continent;
  final String country;
  final String classification;
  final String region;
  final String height;
  final String botanic;
  final String operation;
  final String body;
  final String acidity;
  final String tastingNotes;
  final String cupingScore;
  final String description;
  final String imgurl;

  const Coffee({
    @required this.id,
    @required this.name,
    @required this.subname,
    @required this.continent,
    @required this.country,
    @required this.classification,
    @required this.region,
    @required this.height,
    @required this.botanic,
    @required this.operation,
    @required this.body,
    @required this.acidity,
    @required this.tastingNotes,
    @required this.cupingScore,
    @required this.description,
    @required this.imgurl,
  });

  static Coffee fromJson(json) => Coffee(
        id: json['id'],
        name: json['name'],
        subname: json['subname'],
        continent: json['continent'],
        country: json['country'],
        classification: json['classification'],
        region: json['region'],
        height: json['height'],
        botanic: json['botanic'],
        operation: json['operation'],
        body: json['body'],
        acidity: json['acidity'],
        tastingNotes: json['tasting-notes'],
        cupingScore: json['cuping-score'],
        description: json['description'],
        imgurl: json['imgurl'],
      );
}

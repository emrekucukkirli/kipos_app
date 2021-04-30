import 'package:meta/meta.dart';

class CoffeeEquipment {
  final int id;
  final String name;
  final String description;
  final String imgurl;

  const CoffeeEquipment({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.imgurl,
  });

  static CoffeeEquipment fromJson(json) => CoffeeEquipment(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imgurl: json['imgurl'],
      );
}

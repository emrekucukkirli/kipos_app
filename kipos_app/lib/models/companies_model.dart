import 'package:meta/meta.dart';

class Company {
  final int id;
  final String name;
  final String about;
  final String profession;
  final String discount;
  final String city;
  final String instagram;

  const Company({
    @required this.id,
    @required this.name,
    @required this.about,
    @required this.profession,
    @required this.discount,
    @required this.city,
    @required this.instagram,
  });

  static Company fromJson(json) => Company(
        id: json['id'],
        name: json['name'],
        about: json['about'],
        profession: json['profession'],
        discount: json['discount'],
        city: json['city'],
        instagram: json['instagram'],
      );
}

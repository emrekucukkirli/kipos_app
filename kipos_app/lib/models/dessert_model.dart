import 'dart:convert';

List<Dessert> dessertFromJson(String str) =>
    List<Dessert>.from(json.decode(str).map((x) => Dessert.fromJson(x)));

String dessertToJson(List<Dessert> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dessert {
  Dessert({
    this.id,
    this.name,
    this.contents,
    this.preparing,
    this.imgurl,
  });

  int id;
  String name;
  String contents;
  String preparing;
  String imgurl;

  factory Dessert.fromJson(Map<String, dynamic> json) => Dessert(
        id: json["id"],
        name: json["name"],
        contents: json["contents"],
        preparing: json["preparing"],
        imgurl: json["imgurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contents": contents,
        "preparing": preparing,
        "imgurl": imgurl,
      };
}

// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.name,
    required this.image,
    required this.items,
    this.isFavourite = false,
    this.price = 50,
  });

  String name;
  String image;
  List<String> items;
  bool isFavourite;
  int price;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        image: json["image"],
        items: List<String>.from(json["items"].map((x) => x)),
        isFavourite: json["isFavourite"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "items": List<dynamic>.from(items.map((x) => x)),
        "isFavourite": isFavourite,
        "price": price,
      };
}

List<Data> candles = [];

// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Food> foodFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  int id;
  int userId;
  String title;
  String price;
  String descr;
  DateTime createdAt;
  String restaurantName;
  List<dynamic> images;

  Food({
    required this.id,
    required this.userId,
    required this.title,
    required this.price,
    required this.descr,
    required this.createdAt,
    required this.restaurantName,
    required this.images,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        price: json["price"],
        descr: json["descr"],
        createdAt: DateTime.parse(json["created_at"]),
        restaurantName: json["restaurant_name"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "price": price,
        "descr": descr,
        "created_at": createdAt.toIso8601String(),
        "restaurant_name": restaurantName,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

List<Property> propertyFromJson(String str) =>
    List<Property>.from(json.decode(str).map((x) => Property.fromJson(x)));

String propertyToJson(List<Property> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Property {
  int id;
  int userId;
  String title;
  String purpose;
  String category;
  String features;
  String propertyType;
  String address;
  String price;
  String deposit;
  String phone;
  String descr;
  DateTime createdAt;
  List<String> images;

  Property({
    required this.id,
    required this.userId,
    required this.title,
    required this.purpose,
    required this.category,
    required this.features,
    required this.propertyType,
    required this.address,
    required this.price,
    required this.deposit,
    required this.phone,
    required this.descr,
    required this.createdAt,
    required this.images,
  });
  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        purpose: json["purpose"],
        category: json["category"],
        features: json["features"],
        propertyType: json["property_type"],
        address: json["address"],
        price: json["price"],
        deposit: json["deposit"],
        phone: json["phone"],
        descr: json["descr"],
        createdAt: DateTime.parse(json["created_at"]),
        images: List<String>.from(json['images'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "purpose": purpose,
        "category": category,
        "features": features,
        "property_type": propertyType,
        "address": address,
        "price": price,
        "deposit": deposit,
        "phone": phone,
        "descr": descr,
        "created_at": createdAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

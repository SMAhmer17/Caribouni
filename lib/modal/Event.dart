// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  int id;
  int userId;
  String title;
  String address;
  String price;
  String deposit;
  String phone;
  String descr;
  DateTime eventDate;
  DateTime createdAt;
  List<String> images;

  Event({
    required this.id,
    required this.userId,
    required this.title,
    required this.address,
    required this.price,
    required this.deposit,
    required this.phone,
    required this.descr,
    required this.eventDate,
    required this.createdAt,
    required this.images,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        address: json["address"],
        price: json["price"],
        deposit: json["deposit"],
        phone: json["phone"],
        descr: json["descr"],
        eventDate: DateTime.parse(json["event_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "address": address,
        "price": price,
        "deposit": deposit,
        "phone": phone,
        "descr": descr,
        "event_date": eventDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

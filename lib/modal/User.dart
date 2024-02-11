// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool success;
  Data data;
  String message;

  User({
    required this.success,
    required this.data,
    required this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String token;
  String image;
  String phone;
  String name;
  String email;
  int id;

  Data({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "image": image,
        "phone": phone,
        "name": name,
        "email": email,
        "id": id,
      };
}

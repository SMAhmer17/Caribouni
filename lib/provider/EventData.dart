// ignore_for_file: file_names, depend_on_referenced_packages, unused_import

import 'dart:convert';
import 'dart:io';
import 'package:caribouni/modal/Event.dart';
import 'package:caribouni/modal/Food.dart';
import 'package:caribouni/utils/api_checker.dart';
import 'package:caribouni/utils/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class EventData with ChangeNotifier {
  List<Event> _listOfEvents = [];
  List<Event> get listOfEvents => _listOfEvents;

  final headers = {'Content-Type': 'application/json'};
  Future<String> getAllEvent() async {
    final body = {};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.events, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        //     print(message['data']);
        List<Event> dumy = [];
        //     print(message['data']);
        for (var word in message['data']) {
          print(word);

          dumy.add(Event(
              id: word['id'],
              userId: word['user_id'],
              title: word['title'],
              address: word['address'],
              price: word['price'],
              deposit: word['deposit'],
              phone: word['phone'],
              descr: word['descr'],
              eventDate: DateTime.parse(word['event_date']),
              createdAt: DateTime.parse(word['created_at']),
              images: List<String>.from(word["images"].map((x) => x))));
        }

        _listOfEvents = dumy;
      } else {
        print(message["message"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["message"].toString();
        return err;
      }

      final err = message["message"].toString();
      return err;
    } catch (e) {
      print(e);
      print('login catch');
      rethrow;
    }
  }

  Future<String> saveEvent(
      int userId,
      String title,
      String address,
      String price,
      String deposit,
      String phone,
      String descrp,
      File image,
      DateTime data) async {
    final body = {
      "user_id": userId,
      "title": title,
      "address": address,
      "price": price,
      "deposit": deposit,
      "phone": phone,
      "descr": descrp,
      "images": image,
      "event_date": data,
    };

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.createevent, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        final messag = message['message'];
      } else {
        print(message["message"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["message"].toString();
        return err;
      }

      final err = message["message"].toString();
      return err;
    } catch (e) {
      print(e);
      print('login catch');
      rethrow;
    }
  }
}

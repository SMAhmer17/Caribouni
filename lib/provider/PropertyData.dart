// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:convert';

import 'package:caribouni/modal/Property.dart';
import 'package:caribouni/utils/api_checker.dart';
import 'package:caribouni/utils/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class PropertyData with ChangeNotifier {
  List<Property> _listOfProperties = [];
  List<Property> get listOfProperties => _listOfProperties;
  List<Property> _filterdlist = [];
  List<Property> get filterdlist => _filterdlist;

  void withFeatures(String feature) {
    var al = listOfProperties
        .where((element) => element.features == feature)
        .toList();
    _filterdlist = al;
    notifyListeners();
  }

  final headers = {'Content-Type': 'application/json'};
  Future<String> getAllProperties() async {
    final body = {};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.properties, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        List<Property> dumy = [];
        //     print(message['data']);
        for (var word in message['data']) {
          print(word);

          dumy.add(Property(
              id: word['id'],
              userId: word['user_id'],
              title: word['title'],
              purpose: word['purpose'],
              category: word['category'],
              features: word['features'],
              propertyType: word['property_type'],
              address: word['address'],
              price: word['price'],
              deposit: word['deposit'],
              phone: word['phone'],
              descr: word['descr'],
              createdAt: DateTime.parse(word['created_at']),
              images: List<String>.from(word["images"].map((x) => x))));
        }

        _listOfProperties = dumy;
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

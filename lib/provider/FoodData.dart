// ignore_for_file: file_names, depend_on_referenced_packages, unused_import

import 'dart:convert';
import 'package:caribouni/modal/Food.dart';
import 'package:caribouni/utils/api_checker.dart';
import 'package:caribouni/utils/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class FoodData with ChangeNotifier {
  List<Food> _listOfFoods = [];
  List<Food> get listOfFood => _listOfFoods;

  final headers = {'Content-Type': 'application/json'};
  Future<String> getAllFood() async {
    final body = {};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.foods, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        //     print(message['data']);
        List<Food> dumy = [];
        //     print(message['data']);
        for (var word in message['data']) {
          print(word);

          dumy.add(Food(
              id: word['id'],
              userId: word['user_id'],
              title: word['title'],
              price: word['price'],
              descr: word['descr'],
              createdAt: DateTime.parse(word['created_at']),
              restaurantName: word['restaurant_name'],
              images: List<String>.from(word["images"].map((x) => x))));
        }

        _listOfFoods = dumy;
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

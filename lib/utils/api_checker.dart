import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiChecker {
  static Future<Response> postApiCheck(Uri uri, final apibody, headers) async {
    final body = json.encode(apibody);
    // print(body);
    // final uri = ApiConstants.otprequestApi;
    try {
      Response response = await post(
        uri,
        headers: headers,
        body: body,
      );
      final message = json.decode(response.body);

      return response;
    } catch (e) {
      print("exception is this ...... $e");
      throw 'error';
    }
  }

  static Future<Response> getApiCheck(Uri uri, String token) async {
    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      final message = json.decode(response.body);

      return response;
    } catch (e) {
      print("exception is this ...... $e");
      throw 'error';
    }
  }
}

// ignore_for_file: file_names, avoid_print, prefer_final_fields

import 'dart:async';
import 'dart:convert';
import 'package:caribouni/Services/local_storage_service.dart';
import 'package:caribouni/modal/User.dart';
import 'package:caribouni/utils/api_checker.dart';
import 'package:caribouni/utils/api_constant.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  User? currentUser;
  String? _loginName;
  String? _token;
  DateTime? _expiryDate;
  String? get loginName => _loginName;
  String? get token => _token;
  DateTime? get expiryDate => _expiryDate;

  Timer? _authTimer;

  bool get isAuth {
    if (_token != null) {
      return true;
    }
    return false;
  }

  final headers = {'Content-Type': 'application/json'};

  Future<String> login(String email, String passwords) async {
    final body = {"email": email, "password": passwords};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.loginApi, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        print(message['success']);

        currentUser = User(
            success: message['success'],
            data: Data(
                token: message['data']['token'],
                name: message['data']['name'],
                phone: message['data']['phone'] ?? '',
                image: message['data']['image'] ?? '',
                email: message['data']['email'],
                id: message['data']['id']),
            message: message['message']);

        _token = message["token"];

        _expiryDate =
            _expiryDate = DateTime.now().add(const Duration(hours: 168));

        notifyListeners();
      } else {
        print(message["message"].toString() + 'Ali');
        final err = message["message"].toString();
        return err;
      }
      autoLogout();
      notifyListeners();
      print('SharedPreferences');

      LocalStorageService.storeLocally('login', currentUser!, _expiryDate!);

      notifyListeners();
      final err = message["message"].toString();
      return err;
    } catch (e) {
      print('login catch');
      rethrow;
    }
  }

  Future<String> signUp(String name, String email, String passwords) async {
    final body = {
      "name": name,
      "email": email,
      "password": passwords,
      "confirm-password": passwords
    };

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.signUp, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        print(message['success']);

        currentUser = User(
            success: message['success'],
            data: Data(
                token: message['data']['token'],
                name: message['data']['name'],
                phone: message['data']['phone'] ?? '',
                image: message['data']['image'] ?? '',
                email: message['data']['email'],
                id: message['data']['id']),
            message: message['message']);
        print(message['success']);
        _token = message["token"];

        _expiryDate =
            _expiryDate = DateTime.now().add(const Duration(hours: 168));

        notifyListeners();

        notifyListeners();
      } else {
        print(message["data"]["email"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["data"]["email"].toString();
        return err;
      }
      autoLogout();
      notifyListeners();

      print('SharedPreferences');

      LocalStorageService.storeLocally('login', currentUser!, _expiryDate!);

      notifyListeners();
      final err = message["data"]["email"].toString();
      print(err);
      return err;
    } catch (e) {
      print('signup catch');
      rethrow;
    }
  }

  Future<String> updateName(String name) async {
    final body = {"id": currentUser!.data.id, "name": name};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.updatename, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        print(message['success']);
        currentUser = User(
            success: currentUser!.success,
            data: Data(
                token: currentUser!.data.token,
                name: name,
                email: currentUser!.data.email,
                image: currentUser!.data.image,
                phone: currentUser!.data.phone,
                id: currentUser!.data.id),
            message: currentUser!.message);
        print('SharedPreferences');

        LocalStorageService.storeLocally('login', currentUser!, _expiryDate!);

        notifyListeners();

        notifyListeners();
      } else {
        print(message["message"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["message"].toString();
        return err;
      }

      notifyListeners();
      final err = message["message"].toString();
      return err;
    } catch (e) {
      print('login catch');
      rethrow;
    }
  }

  Future<String> updatePhone(String phone) async {
    final body = {"id": currentUser!.data.id, "phone_number": phone};

    try {
      Response response =
          await ApiChecker.postApiCheck(ApiConstant.updatephone, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        print(message['success']);
        currentUser = User(
            success: currentUser!.success,
            data: Data(
                token: currentUser!.data.token,
                name: currentUser!.data.name,
                email: currentUser!.data.email,
                image: currentUser!.data.image,
                phone: phone,
                id: currentUser!.data.id),
            message: currentUser!.message);
        print('SharedPreferences');

        LocalStorageService.storeLocally('login', currentUser!, _expiryDate!);

        notifyListeners();

        notifyListeners();
      } else {
        print(message["message"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["message"].toString();
        return err;
      }

      notifyListeners();
      final err = message["message"].toString();
      return err;
    } catch (e) {
      print('login catch');
      rethrow;
    }
  }

  Future<String> updatePassword(String oldPassword, newPassword) async {
    final body = {
      "id": currentUser!.data.id,
      "old-password": oldPassword,
      "new-password": newPassword,
      "confirm-password": newPassword
    };
    print(body);
    try {
      Response response = await ApiChecker.postApiCheck(
          ApiConstant.updatepassword, body, headers);
      final message = json.decode(response.body);
      if (response.statusCode == 200) {
        print(message['success']);
      } else {
        print(message["message"].toString() + 'Ali');
        // MySnackBar.errorSnackbar(message["message"].toString());
        final err = message["message"].toString();
        return err;
      }

      final err = message["message"].toString();
      return err;
    } catch (e) {
      print('login catch');
      rethrow;
    }
  }

  // Future<String> otpRequest(String email) async {
  //   final body = json.encode({"email": email.toString()});
  //   // print(body);
  //   final uri = ApiConstants.otprequestApi;
  //   try {
  //     Response response = await post(
  //       uri,
  //       headers: headers,
  //       body: body,
  //     );
  //     final message = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       _loginName = email;
  //       // print(message['message']);
  //       notifyListeners();
  //       return message['message'];
  //     } else {
  //       // print(message);
  //       return message['message'];
  //     }
  //   } catch (e) {
  //     throw 'error';
  //   }
  // }

  // Future<String> otpSubmit(int code) async {
  //   final uri =
  //       Uri.parse('http://135.181.62.34:8040/auth-api/getOTP?OTP=$code');
  //   try {
  //     Response response = await http.get(uri);

  //     final message = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       // print(message);
  //       // print(message[0]['otpNo']);

  //       return message.toString();
  //     } else {
  //       // print(message);
  //       return message.toString();
  //     }
  //   } catch (e) {
  //     throw 'error';
  //   }
  // }

  // Future<String> newPassword(String password) async {
  //   final body = json.encode({"email": _loginName, "password": password});
  //   // print(body);
  //   final uri = ApiConstants.newPasswordApi;
  //   try {
  //     Response response = await post(
  //       uri,
  //       headers: headers,
  //       body: body,
  //     );
  //     final message = json.decode(response.body);

  //     if (response.statusCode == 200) {
  //       _loginName = '';
  //       // print(message['message']);
  //       notifyListeners();
  //       return message.toString();
  //     } else {
  //       // print(message);
  //       return message.toString();
  //     }
  //   } catch (e) {
  //     throw 'error';
  //   }
  // }

  Future<bool> tryAutoLogin() async {
    if (await LocalStorageService.checkDataKey('login') == false) {
      return false;
    }

    final extractedUserDate =
        await LocalStorageService.retriveLocalData('login');

    final expiryDate =
        DateTime.parse(extractedUserDate['expiryDate'].toString());

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    final user = json.decode(extractedUserDate['currentUser']);

    currentUser = User(
      success: true,
      data: Data(
          token: user['token'],
          name: user['name'],
          phone: user['phone'],
          image: user['image'],
          email: user['email'],
          id: user['id']),
      message: 'AutoLogin',
    );

    _token = user['token'].toString();
    _expiryDate = expiryDate;

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    currentUser = null;

    _token = null;
    _expiryDate = null;
    LocalStorageService.clearLocalData();

    notifyListeners();
  }

  void autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}

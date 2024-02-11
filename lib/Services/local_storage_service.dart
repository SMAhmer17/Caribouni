import 'dart:convert';
import 'package:caribouni/modal/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> storeLocally(
      String instantName, User currentuser, DateTime time) async {
    print('shared in......');
    final prefs = await SharedPreferences.getInstance();

    final userData = json.encode({
      "currentUser": json.encode({
        "token": currentuser.data.token,
        "phone": currentuser.data.phone,
        "image": currentuser.data.image,
        "name": currentuser.data.name,
        "email": currentuser.data.email,
        "id": currentuser.data.id,
      }),
      "expiryDate": time.toIso8601String()
    });
    print(instantName);
    prefs.setString(instantName, userData).then((value) {
      print('success');
    });
  }

  static retriveLocalData(String instantName) async {
    final prefs = await SharedPreferences.getInstance();

    final str = prefs.getString(instantName);

    final extractedUserDate = json.decode(str!);

    return extractedUserDate;
  }

  static Future<bool> checkDataKey(String instantName) async {
    print(instantName);
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(instantName)) {
      return false;
    }
    return true;
  }

  static clearLocalData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

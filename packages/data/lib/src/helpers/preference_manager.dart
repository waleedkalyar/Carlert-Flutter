// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:convert';

import 'package:data/src.dart';
import 'package:data/src/const/consts.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class PreferenceManager {
  PreferenceManager._();

  static final PreferenceManager _instance = PreferenceManager._();
  late StreamingSharedPreferences prefs;

  static PreferenceManager getInstance() {
    return _instance;
  }

  Future<void> initSharedPreferences() async {
    prefs = await StreamingSharedPreferences.instance;
  }

  Future<void> saveUserModelInPref(UserModel? userModel) async {
    await prefs.setString(USER_MODEL, jsonEncode(userModel!.toJson()));
  }

  Future<bool> deleteUser() async {
    return await prefs.remove(USER_MODEL);
  }

  UserModel getCurrentUser() {
   var user = prefs.getCustomValue(USER_MODEL, defaultValue: UserModel.empty, adapter: JsonAdapter(
      deserializer: (value) => UserModel.fromJson(value as Map<String,dynamic>),
    )).getValue();
    // var userString =
    //     prefs.getString(USER_MODEL, defaultValue: '{}').getValue();
    //   Map<String, dynamic> user = jsonDecode(userString);
    //   return UserModel.fromJson(user);

    return user;

  }

  Stream<UserModel> streamCurrentUser() async* {
    prefs.getString(USER_MODEL, defaultValue: '{}').listen((value) async* {
      Map<String, dynamic> user = jsonDecode(value);
      yield UserModel.fromJson(user);
    });
  }
}

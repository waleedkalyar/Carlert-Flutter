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

  String getCurrentUserToken(){
  return prefs.getCustomValue(USER_MODEL, defaultValue: UserModel.empty, adapter: JsonAdapter(
      deserializer: (value) => UserModel.fromJson(value as Map<String,dynamic>),
    )).getValue().token;
  }

  String getDummyToken(){
    return "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YzMyZDMzOC0yM2I2LTRlOWYtYWMyZS1hZGQzYjY4MWE3NzciLCJqdGkiOiI1ZDJmNzY4MDlhMDA4MjhiZTUyNDNiOTE5OTRlOWY2N2UzNGExMzU0YTg1MmNkYWNhZjJlNGE4MWVhNWIwZmU4MGViYjVlYjNhMzg4NjhiZSIsImlhdCI6MTcyNTQ1MzEzNy4wNDY4MTMsIm5iZiI6MTcyNTQ1MzEzNy4wNDY4MTYsImV4cCI6MTc1Njk4OTEzNy4wMzIzOCwic3ViIjoiMiIsInNjb3BlcyI6W119.J0qi4cXhDPBoMt1_TYFIV69cp7IhUk9lPQiovjTZ0-zL-Q4O0xvyKQL9sIzLSUiUksCPV2s23rd7qVSmmPPiJwiy0o5adHMAFtFiuPO20HaM27w7H7rq5dkr2ms5USteC8YvKQzk9x0SEXrwOA2ww8yYb7S0CezGsEogKxQssYnGzvB1PldSFOYW3YFHpRdjBRn5tXq0_KqNVluomJKDHFNY4e8BuHboEjubEN2l_tg90BJPjMsLGP8BEqlxzNLVygSwlZFX7bil66pER7rMgJNa1WSrcQFnlu5y4gN_WgVZQP5w-L2yugPHkoCMR6Pkqdjekf5hwMHd6xpG_cKwkQLdci0MFWjgZNXrxAiTi1EJtSPj7BxAk57Zed9tW6ioMT4pLLh6K_z4LRFBDXlGTFuMUmLSJIh7jusiI3BEgXpGUtRZgA1mw3EmmGLVJIOY2MfKocl0UxyCbkfRKBQ5-3MyegAj29fiDRBfGhgvgqgsw4684sV2_WFwMX3t3XlbXC4cNEMLY4tb8Tk5XwcG_Nc3Yi-xwmtn8urRYDKx85-t5n1BwUHntMdxr2pfoqHXNGk_IS2bLueJoaPDKFpXOm1-fvdqxYIBMYPrrrOlcrUFxI-AmeE8GWUF6MxsioNijZnG_gdPRsgqm0pm8ImQJHDBiojPjIcnx-v_q5TWSn4";
  }


  Stream<UserModel> streamCurrentUser() async* {
    prefs.getString(USER_MODEL, defaultValue: '{}').listen((value) async* {
      Map<String, dynamic> user = jsonDecode(value);
      yield UserModel.fromJson(user);
    });
  }
}

// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src.dart';
import 'package:data/src/const/consts.dart';
import 'package:data/src/network/base_request_handler.dart';
import 'package:http/http.dart' as http;

class AuthRepoImpl with BaseRequestHandler implements AuthRepo {
  @override
  Future<NetworkResult<BaseResponse<String>>> sendOtpToPhone(
      Map<String, dynamic> data) async {
    return handleApiFuture(
      endPoint: VERIFY_USER_MOBILE_ENDPOINT,
      methodFunction: http.post,
      formData: data,
    );
  }

  @override
  Future<NetworkResult<BaseResponse<UserModel>>> verifyOtpCode(
      Map<String, dynamic> data) async {
    return handleApiFuture(
        endPoint: VERIFY_OTP_ENDPOINT,
        methodFunction: http.post,
        formData: data);
  }

  @override
  Stream<UserModel> currentUser() =>
      PreferenceManager.getInstance().streamCurrentUser();

  @override
  currentUserNow() =>  UserModel.dummyUser;//PreferenceManager.getInstance().getCurrentUser(); TODO: replace this with actual method

  @override
  Future<void> logoutUser() async {
    PreferenceManager.getInstance().deleteUser();
  }
}

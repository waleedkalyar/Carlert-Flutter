// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src/models/user/user_model.dart';
import 'package:data/src/network/responses/base/base_response.dart';
import 'package:data/src/sealed/network_result.dart';

abstract class AuthRepo {
  Future<NetworkResult<BaseResponse<String>>> sendOtpToPhone(
      Map<String, dynamic> data);

  Future<NetworkResult<BaseResponse<UserModel>>> verifyOtpCode(
      Map<String, dynamic> data);

  Stream<UserModel> currentUser();

  currentUserNow();

  Future<void> logoutUser();

}

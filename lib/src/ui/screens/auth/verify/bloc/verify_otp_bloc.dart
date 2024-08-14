import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'verify_otp_event.dart';

part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepo _authRepo;

  VerifyOtpBloc(this._authRepo) : super(VerifyOtpInitial()) {
    on<SendOtpCodeToVerify>(_onVerifyOtpCode);
  }

  FutureOr<void> _onVerifyOtpCode(
      SendOtpCodeToVerify event, Emitter<VerifyOtpState> emit) async {
    emit(VerifyOtpLoading());
    const String fcmToken =
        "fvA7nxVfuEERhWXHGQslMT:APA91bEf4RJmHB6EYbx-tyvRsFB-uwlahzGjnnKflrP2e98So7Yz8dpfYEBsxIYaowUvO2z-Ql_K2l0VHwdGmJGce7kgsZvlknSLqUxPrN_gkzv253IA8HcRbXlvlm-5czoVZj7UxfzE";
    var result = await _authRepo.verifyOtpCode({
      "otpCode": event.otpCode,
      "phone": event.phoneNumber,
      "fcmToken": fcmToken
    });
    if (result is NetworkLoading) {
      emit(VerifyOtpLoading());
    } else if (result is NetworkError) {
      emit(VerifyOtpFailure(errorMessage: (result as NetworkError).message));
    } else if (result is NetworkSuccess) {
      try {
        var data = (((result as NetworkSuccess).data as BaseResponse).data)
            as Map<String, dynamic>?;
        var user = UserModel.fromJson(data!);
        PreferenceManager.getInstance().saveUserModelInPref(user);
        emit(VerifyOtpSuccess(userModel: user));
      } catch (e) {
        emit(VerifyOtpFailure(errorMessage: e.toString()));
      }
    } else {
      emit(VerifyOtpInitial());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

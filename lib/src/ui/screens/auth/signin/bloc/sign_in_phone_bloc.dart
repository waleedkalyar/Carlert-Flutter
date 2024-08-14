import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_in_phone_event.dart';

part 'sign_in_phone_state.dart';

class SignInPhoneBloc extends Bloc<SignInPhoneEvent, SignInPhoneState> {
  final AuthRepo _authRepo;

  SignInPhoneBloc(this._authRepo) : super(SignInPhoneLoading()) {
    on<SubmitOtpRequest>(_onSubmitOtpRequest);
  }

  FutureOr<void> _onSubmitOtpRequest(
      SubmitOtpRequest event, Emitter<SignInPhoneState> emit) async {
    emit(SignInPhoneLoading());
    debugPrint("SignInPhoneBloc: _onSubmitOtpRequest()");
    var result =
        await _authRepo.sendOtpToPhone({"varUserPhone": event.fullPhoneNumber});

    if (result is NetworkLoading) {
      debugPrint("SignInPhoneBloc: loading");
      emit(SignInPhoneLoading());
    } else if (result is NetworkError) {
      emit(SignInPhoneError(errorMessage: (result as NetworkError).message));
      debugPrint("SignInPhoneBloc: error -> ");
    } else if (result is NetworkSuccess) {
      debugPrint("SignInPhoneBloc: success -> ");
      emit(SignInPhoneSuccess(
          successMessage: ((result as NetworkSuccess).data as BaseResponse)
              .data
              .toString(),
          fullPhoneNumber: event.fullPhoneNumber));
    } else {
      emit(SignInPhoneInitial());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

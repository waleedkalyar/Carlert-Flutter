part of 'verify_otp_bloc.dart';

sealed class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

final class SendOtpCodeToVerify extends VerifyOtpEvent {
  final String otpCode;
  final String phoneNumber;

  const SendOtpCodeToVerify({required this.otpCode, required this.phoneNumber});

  @override
  List<Object?> get props => [otpCode, phoneNumber];
}

part of 'verify_otp_bloc.dart';

sealed class VerifyOtpState extends Equatable {
  const VerifyOtpState();
}

final class VerifyOtpInitial extends VerifyOtpState {
  @override
  List<Object> get props => [];
}

final class VerifyOtpLoading extends VerifyOtpState {
  @override
  List<Object> get props => [];
}

final class VerifyOtpFailure extends VerifyOtpState {
  final String errorMessage;

  const VerifyOtpFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class VerifyOtpSuccess extends VerifyOtpState {
  final UserModel userModel;

  const VerifyOtpSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

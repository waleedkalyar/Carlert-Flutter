part of 'sign_in_phone_bloc.dart';

sealed class SignInPhoneEvent extends Equatable {
  const SignInPhoneEvent();
}

final class SubmitOtpRequest extends SignInPhoneEvent{
  final String fullPhoneNumber;

 const SubmitOtpRequest({required this.fullPhoneNumber});
  @override
  List<Object?> get props => [fullPhoneNumber];


}

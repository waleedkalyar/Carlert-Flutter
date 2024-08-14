part of 'sign_in_phone_bloc.dart';

sealed class SignInPhoneState extends Equatable {
  const SignInPhoneState();
}

final class SignInPhoneInitial extends SignInPhoneState {
  @override
  List<Object> get props => [];
}

final class SignInPhoneLoading extends SignInPhoneState {
  @override
  List<Object> get props => [];
}

final class SignInPhoneSuccess extends SignInPhoneState {
  final String successMessage;
  final String fullPhoneNumber;

  const SignInPhoneSuccess({required this.successMessage, required this.fullPhoneNumber});

  @override
  List<Object> get props => [];
}

final class SignInPhoneError extends SignInPhoneState {
  final String errorMessage;

  const SignInPhoneError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

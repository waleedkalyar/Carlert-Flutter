part of 'app_nav_bloc.dart';

sealed class AppNavState extends Equatable {
  const AppNavState();
}

final class SignInPhoneScreenState extends AppNavState {
  const SignInPhoneScreenState();

  @override
  List<Object> get props => [];
}

final class VerifyOtpScreenState extends AppNavState {
  const VerifyOtpScreenState();

  @override
  List<Object> get props => [];
}

final class HomeScreenState extends AppNavState {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

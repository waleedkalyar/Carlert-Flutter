part of 'app_nav_bloc.dart';

sealed class AppNavEvent extends Equatable {
  const AppNavEvent();
}


final class _AppUserChanged extends AppNavEvent {
  final UserModel user;

  const _AppUserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

final class NavToSignInPhoneScreen extends AppNavEvent {
  const NavToSignInPhoneScreen();

  @override
  List<Object> get props => [];
}

final class NavToVerifyOtpScreen extends AppNavEvent {
  final String phoneNumber;

  const NavToVerifyOtpScreen({required this.phoneNumber});

  @override
  List<Object> get props => [];
}

final class NavToHomeScreen extends AppNavEvent {
  const NavToHomeScreen();

  @override
  List<Object> get props => [];
}

final class NavToTripHistoryScreen extends AppNavEvent {
  const NavToTripHistoryScreen();

  @override
  List<Object> get props => [];
}


final class LogoutOutUser  extends AppNavEvent{

  const LogoutOutUser();

  @override
  List<Object?> get props => [];

}


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

final class TripHistoryScreenState extends AppNavState {
  const TripHistoryScreenState();

  @override
  List<Object> get props => [];
}

final class GeoFencingScreenState extends AppNavState {
  const GeoFencingScreenState();

  @override
  List<Object> get props => [];
}

final class ServiceRequestsScreenState extends AppNavState {
  const ServiceRequestsScreenState();

  @override
  List<Object> get props => [];
}

final class KilometersScreenState extends AppNavState {
  const KilometersScreenState();

  @override
  List<Object> get props => [];
}

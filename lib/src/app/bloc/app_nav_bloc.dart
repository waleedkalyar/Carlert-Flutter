import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';

part 'app_nav_event.dart';

part 'app_nav_state.dart';

class AppNavBloc extends Bloc<AppNavEvent, AppNavState> {
  final AuthRepo _authRepo;

  late final StreamSubscription<UserModel> _currentUserListener;

  AppNavBloc(this._authRepo)
      : super(_authRepo.currentUserNow().isEmpty
            ? const SignInPhoneScreenState()
            : const HomeScreenState()) {
    on<NavToVerifyOtpScreen>(_onNavigateToVerifyOtpScreen);
    on<NavToHomeScreen>(_onNavigateToHomeScreen);
    on<_AppUserChanged>(_onAppUserChanged);
    on<LogoutOutUser>(_logoutUser);
    _currentUserListener =
        _authRepo.currentUser().listen((user) => add(_AppUserChanged(user)));
  }

  FutureOr<void> _onNavigateToVerifyOtpScreen(
      NavToVerifyOtpScreen event, Emitter<AppNavState> emit) {
    emit(const VerifyOtpScreenState());
  }

  FutureOr<void> _onNavigateToHomeScreen(
      NavToHomeScreen event, Emitter<AppNavState> emit) {
    emit(const HomeScreenState());
  }

  FutureOr<void> _onAppUserChanged(
      _AppUserChanged event, Emitter<AppNavState> emit) {
    emit(event.user.isEmpty
        ? const SignInPhoneScreenState()
        : const HomeScreenState());
  }

  @override
  Future<void> close() {
    _currentUserListener.cancel();
    return super.close();
  }

  FutureOr<void> _logoutUser(
      LogoutOutUser event, Emitter<AppNavState> emit) async {
    _authRepo.logoutUser();
    emit(const SignInPhoneScreenState());
  }
}

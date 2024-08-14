part of 'my_cars_bloc.dart';

sealed class MyCarsState extends Equatable {
  const MyCarsState();
}

final class MyCarsInitial extends MyCarsState {
  @override
  List<Object> get props => [];
}

final class MyCarsLoading extends MyCarsState {
  @override
  List<Object> get props => [];
}

final class MyCarsSuccess extends MyCarsState {
  List<DeviceModel> devices;

  MyCarsSuccess({required this.devices});

  @override
  List<Object> get props => [];
}

final class MyCarsError extends MyCarsState {
  final String errorMessage;

  const MyCarsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

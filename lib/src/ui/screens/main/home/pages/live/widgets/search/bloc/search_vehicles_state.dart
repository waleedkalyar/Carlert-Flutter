part of 'search_vehicles_bloc.dart';

sealed class SearchVehiclesState extends Equatable {
  const SearchVehiclesState();
}

final class SearchVehiclesInitial extends SearchVehiclesState {
  @override
  List<Object> get props => [];
}

final class SearchVehiclesSelectedState extends SearchVehiclesState {
  final DeviceModel selected;

  const SearchVehiclesSelectedState({required this.selected});

  @override
  List<Object?> get props => [selected];
}

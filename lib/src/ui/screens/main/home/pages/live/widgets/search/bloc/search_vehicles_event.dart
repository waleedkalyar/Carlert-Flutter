part of 'search_vehicles_bloc.dart';

sealed class SearchVehiclesEvent extends Equatable {
  const SearchVehiclesEvent();
}

class SearchVehicleSelectedEvent extends SearchVehiclesEvent{
  final DeviceModel selected;
  const SearchVehicleSelectedEvent({required this.selected});

  @override
  List<Object?> get props => [];

}

part of 'my_cars_bloc.dart';

sealed class MyCarsEvent extends Equatable {
  const MyCarsEvent();
}

class FetchAllCars extends MyCarsEvent {
  const FetchAllCars();

  @override
  List<Object?> get props => [];
}

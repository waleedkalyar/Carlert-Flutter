import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';

part 'search_vehicles_event.dart';

part 'search_vehicles_state.dart';

class SearchVehiclesBloc
    extends Bloc<SearchVehiclesEvent, SearchVehiclesState> {
  SearchVehiclesBloc() : super(SearchVehiclesInitial()) {
    on<SearchVehicleSelectedEvent>(_onVehicleSelected);
  }

  FutureOr<void> _onVehicleSelected(
      SearchVehicleSelectedEvent event, Emitter<SearchVehiclesState> emit) {
    emit(SearchVehiclesSelectedState(selected: event.selected));
  }
}

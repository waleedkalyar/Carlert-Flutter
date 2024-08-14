import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'my_cars_event.dart';

part 'my_cars_state.dart';

class MyCarsBloc extends Bloc<MyCarsEvent, MyCarsState> {
  final VehicleRepo _vehiclesRepo;

  MyCarsBloc(this._vehiclesRepo) : super(MyCarsInitial()) {
    on<FetchAllCars>(_onFetchAllCars);
  }

  FutureOr<void> _onFetchAllCars(FetchAllCars event,
      Emitter<MyCarsState> emit) async {
    emit(MyCarsLoading());

    var result = await _vehiclesRepo.fetchAllVehicles();

    if (result is NetworkLoading) {
      debugPrint("MyCarsBloc: loading");
      emit(MyCarsLoading());
    } else if (result is NetworkError) {
      emit(MyCarsError(errorMessage: (result as NetworkError).message));
      debugPrint("MyCarsBloc: error -> ${(result as NetworkError).message}");
    } else if (result is NetworkSuccess) {
      debugPrint("MyCarsBloc: success -> ");
      emit(MyCarsSuccess(devices:
      ((result as NetworkSuccess).data as BaseResponse<List<DeviceModel>>)
          .data ?? []
      ));
    }

    }
  }

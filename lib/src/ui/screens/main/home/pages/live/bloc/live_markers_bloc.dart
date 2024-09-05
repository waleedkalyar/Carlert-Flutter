import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data/src.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'live_markers_event.dart';

part 'live_markers_state.dart';

class LiveMarkersBloc extends Bloc<LiveMarkersEvent, LiveMarkersState> {
  final VehicleRepo _vehicleRepo;

  LiveMarkersBloc(this._vehicleRepo) : super(LiveMarkersInitial()) {
    on<InitPusherEvent>(_onInitPusher);
     on<SubscribeToVehiclesEvent>(_onSubscribeToVehicles);
     on<UnsubscribeToVehiclesEvent>(_onUnSubscribeToVehicles);
  }

  FutureOr<void> _onInitPusher(
      InitPusherEvent event, Emitter<LiveMarkersState> emit) async {
    await emit.onEach(_vehicleRepo.initPusherClient(userToken: event.userToken),
        onData: (connectionState) {
      emit(PusherConnectionState(state: connectionState));
      debugPrint("LiveMarkersBloc: Pusher connectionState -> $connectionState");
    });
  }

  @override
  Future<void> close() {
    _vehicleRepo.disconnect();
    return super.close();
  }

  FutureOr<void> _onSubscribeToVehicles(SubscribeToVehiclesEvent event, Emitter<LiveMarkersState> emit)  async{
    debugPrint("LiveMarkersBloc: _onSubscribeToVehicles called");
    await emit.onEach(_vehicleRepo.subscribePrivateChannel(privateChannelName: event.privateChannelName), onData: (data)  {
    var loc = LatLng(double.parse(data.lat ?? "0"),
          double.parse(data.longi ?? "0"));
      debugPrint("LiveMarkersBloc: Event Data of channel -> ${data.make}-${data.model}  -> $loc");
      emit(VehiclesChannelConnectedState("connected", data));
    });
}

  FutureOr<void> _onUnSubscribeToVehicles(UnsubscribeToVehiclesEvent event, Emitter<LiveMarkersState> emit) {
    _vehicleRepo.unsubscribeToPrivateChannel(privateChannelName: event.privateChannelName);
    emit(const PusherConnectionState(state: "connected"));
  }
}

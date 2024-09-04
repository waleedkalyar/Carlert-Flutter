part of 'live_markers_bloc.dart';

sealed class LiveMarkersState extends Equatable {
  const LiveMarkersState();
}

final class LiveMarkersInitial extends LiveMarkersState {
  @override
  List<Object> get props => [];
}

final class PusherConnectionState extends LiveMarkersState{
  final String state;
  const PusherConnectionState({required this.state});

  @override
  List<Object?> get props => [state];
}

final class VehiclesChannelConnectedState extends LiveMarkersState{
  final String connectionState;
  final SocketChipModel data;

  const VehiclesChannelConnectedState(this.connectionState,this.data);

  @override
  List<Object?> get props => [connectionState,data];


}


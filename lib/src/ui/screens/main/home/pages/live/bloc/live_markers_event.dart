part of 'live_markers_bloc.dart';

sealed class LiveMarkersEvent extends Equatable {
  const LiveMarkersEvent();
}

final class InitPusherEvent extends LiveMarkersEvent{
  final String userToken;
  const InitPusherEvent({required this.userToken});

  @override
  List<Object?> get props => [userToken];
}

final class SubscribeToVehiclesEvent extends LiveMarkersEvent{
  final String privateChannelName;
  const SubscribeToVehiclesEvent(this.privateChannelName);

  @override
  List<Object?> get props => [privateChannelName];
}

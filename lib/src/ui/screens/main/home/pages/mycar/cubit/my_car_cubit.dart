import 'dart:async';

import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/bloc/live_markers_bloc.dart';
import 'package:data/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarCubit extends Cubit<DeviceModel?> {
  late StreamSubscription<DeviceModel?> currentDeviceStream;

  LiveMarkersBloc? bloc;

  MyCarCubit() : super(PreferenceManager.getInstance().getSelectedVehicle()) {
    currentDeviceStream =
        PreferenceManager.getInstance().streamCurrentDevice().listen((device) {
      bloc?.add(
          UnsubscribeToVehiclesEvent("vehicle-location.${state!.deviceId}"));
      // debugPrint("selected vehicle updated -> ${device?.deviceId}");
      emit(device);
      bloc?.add(
          SubscribeToVehiclesEvent("vehicle-location.${state!.deviceId}"));
    });
  }

  void streamCurrentDevice(BuildContext context) {
    bloc = context.read<LiveMarkersBloc>();
   // bloc?.add(UnsubscribeToVehiclesEvent("vehicle-location.${state!.deviceId}"));

    bloc?.add(SubscribeToVehiclesEvent("vehicle-location.${state!.deviceId}"));
    bloc?.stream.listen((liveState) {
      if (liveState is VehiclesChannelConnectedState) {
        if (liveState.data.deviceID == state?.deviceId) {
          if (!isClosed) {
            emit(liveState.data.toDeviceModel(state!));
          }
        }
      }
    });
  }

  @override
  Future<void> close() {
    bloc?.add(
        UnsubscribeToVehiclesEvent("vehicle-location.${state!.deviceId}"));
    currentDeviceStream.cancel();
    return super.close();
  }

}

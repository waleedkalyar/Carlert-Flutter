// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'dart:async';
import 'dart:convert' as convert;
import 'package:data/src.dart';
import 'package:data/src/const/consts.dart';
import 'package:data/src/network/base_request_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pusher_client/pusher_client.dart';

class VehicleRepoImpl with BaseRequestHandler implements VehicleRepo {
  PusherClient? pusherClient;

  @override
  Future<NetworkResult<BaseResponse<List<DeviceModel>>>>
      fetchAllVehicles() async {
    return handleApiFuture(
      endPoint: GET_DEVICES_LIST,
      methodFunction: http.get,
    );
  }

  @override
  Stream<NetworkResult<BaseResponse<ServiceModel>>> fetchServiceList(
      int vehicleId) async* {
    yield* handleApi(
        endPoint: SERVICES_LIST,
        methodFunction: http.post,
        formData: {"vehId": vehicleId});
  }

  @override
  Stream<NetworkResult<BaseResponse<String>>> changeTrackStatus(
      int vehicleId, bool allowTracking) async* {
    yield* handleApi(
        endPoint: CHANGE_TRACK_STATUS,
        methodFunction: http.post,
        formData: {"vehId": vehicleId, "allowTraking": allowTracking ? 1 : 0});
  }

  @override
  Stream<NetworkResult<BaseResponse<NotificationModel>>> fetchNotificationsList(
      int vehicleId) async* {
    yield* handleApi(
        endPoint: NOTIFICATIONS_LIST,
        methodFunction: http.post,
        formData: {"vehId": vehicleId});
  }

  @override
  Stream<String> initPusherClient({required String userToken}) async* {
    StreamController<String> streamController = StreamController();

    PusherOptions options = PusherOptions(
        host: PUSHER_HOST,
        wssPort: 443,
        encrypted: true,
        auth: PusherAuth(CHANNELS_AUTH_URL,
            headers: {'Authorization': 'Bearer $userToken'}));

    pusherClient = PusherClient(PUSHER_APP_KEY, options, autoConnect: true);

    pusherClient?.onConnectionStateChange((state) {
      if (state?.currentState == "connected") {}
      streamController.add(state?.currentState ?? "unknown");
    });

    yield* streamController.stream;
  }

  @override
  void disconnect() {
    pusherClient?.disconnect();
  }

  @override
  Stream<SocketChipModel> subscribePrivateChannel(
      {required String privateChannelName}) async* {
    StreamController<SocketChipModel> streamController = StreamController();
    Channel? channel =
        pusherClient?.subscribe("private-$privateChannelName");
    //debugPrint("LiveMarkersBloc: channel created ${channel?.toString()}");

    channel?.bind("App\\Events\\LiveVehicleLocation", (event) {
      //debugPrint("LiveMarkersBloc: event received $event");

      if(event!= null && event.data != null) {
        var jsonResponse =
        convert.jsonDecode(event.data!) as Map<String, dynamic>;

        var jsonChip = jsonResponse["chip"] as Map<String, dynamic>;
        streamController.add(SocketChipModel.fromJson(jsonChip));
      }
    });
    yield* streamController.stream;
  }
}

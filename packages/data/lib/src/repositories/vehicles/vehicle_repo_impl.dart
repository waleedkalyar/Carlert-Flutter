// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src.dart';
import 'package:data/src/const/consts.dart';
import 'package:data/src/network/base_request_handler.dart';
import 'package:http/http.dart' as http;

class VehicleRepoImpl with BaseRequestHandler implements VehicleRepo {
  @override
  Future<NetworkResult<BaseResponse<List<DeviceModel>>>> fetchAllVehicles() async {
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
}

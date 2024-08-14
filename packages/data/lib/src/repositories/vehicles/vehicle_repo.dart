// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src.dart';

abstract class VehicleRepo {


  Future<NetworkResult<BaseResponse<List<DeviceModel>>>> fetchAllVehicles();

  Stream<NetworkResult<BaseResponse<ServiceModel>>> fetchServiceList(
      int vehicleId);

  Stream<NetworkResult<BaseResponse<NotificationModel>>> fetchNotificationsList(
      int vehicleId);

  Stream<NetworkResult<BaseResponse<String>>> changeTrackStatus(
      int vehicleId, bool allowTracking);
}

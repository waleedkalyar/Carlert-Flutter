// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src/const/consts.dart';
import 'package:data/src/models/location/service_location.dart';
import 'package:data/src/models/slot/time_slot_model.dart';
import 'package:data/src/network/base_request_handler.dart';
import 'package:data/src/network/responses/base/base_response.dart';
import 'package:data/src/repositories/booking/booking_repo.dart';
import 'package:data/src/sealed/network_result.dart';
import 'package:http/http.dart' as http;

class BookingRepoImpl with BaseRequestHandler implements BookingRepo {
  @override
  Stream<NetworkResult<BaseResponse<String>>> bookService(
      Map<String, dynamic> body) async* {
    yield* handleApi(
        endPoint: SERVICE_BOOKING, methodFunction: http.post, formData: body);
  }

  @override
  Stream<NetworkResult<BaseResponse<ServiceLocation>>>
      fetchServiceLocations() async* {
    yield* handleApi(endPoint: SERVICE_LOCATION, methodFunction: http.get);
  }

  @override
  Stream<NetworkResult<BaseResponse<TimeSlotModel>>> fetchTimeSlots() async* {
    yield* handleApi(endPoint: SERVICE_TIME_SLOT, methodFunction: http.get);
  }
}

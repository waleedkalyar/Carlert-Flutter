// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src.dart';

abstract class BookingRepo {
  Stream<NetworkResult<BaseResponse<ServiceLocation>>> fetchServiceLocations();

  Stream<NetworkResult<BaseResponse<TimeSlotModel>>> fetchTimeSlots();

  Stream<NetworkResult<BaseResponse<String>>> bookService(Map<String,dynamic> body);
}

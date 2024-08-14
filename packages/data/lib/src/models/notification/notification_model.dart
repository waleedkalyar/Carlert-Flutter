import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NotificationModel extends Equatable{
  @JsonKey(name: 'uid')
  String uid;
  @JsonKey(name: 'remainderDetail')
  String remainderDetail;
  @JsonKey(name: 'vehicleID')
  int vehicleID;
  @JsonKey(name: 'remainderKM')
  String remainderKM;
  @JsonKey(name: 'cusMessage')
  String cusMessage;
  @JsonKey(name: 'subRemDetail')
  String subRemDetail;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'remStatus')
  int remStatus;
  @JsonKey(name: 'bookStatus')
  String bookStatus;

  NotificationModel({required this.uid, required this.remainderDetail, required this.vehicleID, required this.remainderKM, required this.cusMessage, required this.subRemDetail, required this.status, required this.remStatus, required this.bookStatus});

   factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

   Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override

  List<Object?> get props => [uid,remainderDetail,remainderKM,remStatus,status,bookStatus,remStatus,subRemDetail,remainderKM,vehicleID];
}


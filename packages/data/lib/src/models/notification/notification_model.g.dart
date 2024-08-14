// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      uid: json['uid'] as String,
      remainderDetail: json['remainderDetail'] as String,
      vehicleID: (json['vehicleID'] as num).toInt(),
      remainderKM: json['remainderKM'] as String,
      cusMessage: json['cusMessage'] as String,
      subRemDetail: json['subRemDetail'] as String,
      status: json['status'] as String,
      remStatus: (json['remStatus'] as num).toInt(),
      bookStatus: json['bookStatus'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'remainderDetail': instance.remainderDetail,
      'vehicleID': instance.vehicleID,
      'remainderKM': instance.remainderKM,
      'cusMessage': instance.cusMessage,
      'subRemDetail': instance.subRemDetail,
      'status': instance.status,
      'remStatus': instance.remStatus,
      'bookStatus': instance.bookStatus,
    };

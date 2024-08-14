// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceLocation _$ServiceLocationFromJson(Map<String, dynamic> json) =>
    ServiceLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ServiceLocationToJson(ServiceLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
    };

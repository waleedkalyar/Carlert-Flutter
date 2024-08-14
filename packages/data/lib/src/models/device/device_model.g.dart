// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      uuid: json['uuid'] as String,
      vehicleId: (json['vehicleId'] as num).toInt(),
      deviceId: (json['deviceId'] as num).toInt(),
      driverId: (json['driverId'] as num).toInt(),
      chasisNumber: json['chasisNumber'] as String,
      plateCode: json['plateCode'] as String,
      plateNumber: json['plateNumber'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      engineSize: json['engineSize'] as String,
      year: json['year'] as String,
      color: json['color'] as String,
      kilometers: json['kilometers'] as String,
      batteryCurrent: json['batteryCurrent'] as String,
      batteryVoltage: json['batteryVoltage'] as String,
      ignitionStatus: (json['ignitionStatus'] as num).toInt(),
      powerSourceVolt: json['powerSourceVolt'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      speed: json['speed'] as String,
      dtcScan: json['dtcScan'] as String,
      temperature: json['temperature'] as String,
      allowTracking: json['allowTracking'] as String,
      totalCapacity: (json['totalCapacity'] as num).toInt(),
      fuelLevel: (json['fuelLevel'] as num).toInt(),
      remKm: (json['remKm'] as num).toInt(),
      lastMonth: (json['lastMonth'] as num).toInt(),
      thisMonth: (json['thisMonth'] as num).toInt(),
      totalPercentage: (json['totalPercentage'] as num).toInt(),
      batteryPercentage: (json['batteryPercentage'] as num).toInt(),
      logo: json['logo'] as String,
      carImage: json['carImage'] as String,
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'vehicleId': instance.vehicleId,
      'deviceId': instance.deviceId,
      'driverId': instance.driverId,
      'chasisNumber': instance.chasisNumber,
      'plateCode': instance.plateCode,
      'plateNumber': instance.plateNumber,
      'make': instance.make,
      'model': instance.model,
      'engineSize': instance.engineSize,
      'year': instance.year,
      'color': instance.color,
      'kilometers': instance.kilometers,
      'batteryCurrent': instance.batteryCurrent,
      'batteryVoltage': instance.batteryVoltage,
      'ignitionStatus': instance.ignitionStatus,
      'powerSourceVolt': instance.powerSourceVolt,
      'location': instance.location,
      'speed': instance.speed,
      'dtcScan': instance.dtcScan,
      'temperature': instance.temperature,
      'allowTracking': instance.allowTracking,
      'totalCapacity': instance.totalCapacity,
      'fuelLevel': instance.fuelLevel,
      'remKm': instance.remKm,
      'lastMonth': instance.lastMonth,
      'thisMonth': instance.thisMonth,
      'totalPercentage': instance.totalPercentage,
      'batteryPercentage': instance.batteryPercentage,
      'logo': instance.logo,
      'carImage': instance.carImage,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: json['lat'] as String,
      long: json['long'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

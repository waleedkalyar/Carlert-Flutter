import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_model.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DeviceModel extends Equatable{
  @JsonKey(name: 'uuid')
  String uuid;
  @JsonKey(name: 'vehicleId')
  int vehicleId;
  @JsonKey(name: 'deviceId')
  int deviceId;
  @JsonKey(name: 'driverId')
  String? driverId;
  @JsonKey(name: 'chasisNumber')
  String chasisNumber;
  @JsonKey(name: 'plateCode')
  String? plateCode;
  @JsonKey(name: 'plateNumber')
  String plateNumber;
  @JsonKey(name: 'make')
  String make;
  @JsonKey(name: 'model')
  String model;
  @JsonKey(name: 'engineSize')
  String? engineSize;
  @JsonKey(name: 'year')
  String year;
  @JsonKey(name: 'color')
  String? color;
  @JsonKey(name: 'kilometers')
  int kilometers;
  @JsonKey(name: 'batteryCurrent')
  String batteryCurrent;
  @JsonKey(name: 'batteryVoltage')
  String batteryVoltage;
  @JsonKey(name: 'ignitionStatus')
  int ignitionStatus;
  @JsonKey(name: 'powerSourceVolt')
  String powerSourceVolt;
  @JsonKey(name: 'location')
  Location location;
  @JsonKey(name: 'speed')
  String speed;
  @JsonKey(name: 'dtcScan')
  String dtcScan;
  @JsonKey(name: 'temperature')
  String temperature;
  @JsonKey(name: 'allowTracking')
  String allowTracking;
  @JsonKey(name: 'totalCapacity')
  int totalCapacity;
  @JsonKey(name: 'fuelLevel')
  int fuelLevel;
  @JsonKey(name: 'remKm')
  int remKm;
  @JsonKey(name: 'lastMonth')
  int lastMonth;
  @JsonKey(name: 'thisMonth')
  int thisMonth;
  @JsonKey(name: 'totalPercentage')
  int totalPercentage;
  @JsonKey(name: 'batteryPercentage')
  int batteryPercentage;
  @JsonKey(name: 'logo')
  String logo;
  @JsonKey(name: 'carImage')
  String carImage;

  DeviceModel({required this.uuid, required this.vehicleId, required this.deviceId, required this.driverId, required this.chasisNumber, required this.plateCode, required this.plateNumber, required this.make, required this.model, required this.engineSize, required this.year, required this.color, required this.kilometers, required this.batteryCurrent, required this.batteryVoltage, required this.ignitionStatus, required this.powerSourceVolt, required this.location, required this.speed, required this.dtcScan, required this.temperature, required this.allowTracking, required this.totalCapacity, required this.fuelLevel, required this.remKm, required this.lastMonth, required this.thisMonth, required this.totalPercentage, required this.batteryPercentage, required this.logo, required this.carImage});

   factory DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

   Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  @override
  List<Object?> get props => [uuid,vehicleId,driverId,deviceId,chasisNumber,plateCode,plateNumber,make,model,engineSize,color,year,location];

  @override
  String toString() {
    return "$make $model $year";
  }

}


@JsonSerializable(ignoreUnannotated: false)
class Location extends Equatable{
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'long')
  String long;

  Location({required this.lat, required this.long});

   factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

   Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [lat,long];




}


import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class DeviceModel extends Equatable {
  @JsonKey(name: 'uuid')
  String uuid;
  @JsonKey(name: 'vehicleId')
  int vehicleId;
  @JsonKey(name: 'deviceId')
  int deviceId;
  @JsonKey(name: 'driverId')
  String? driverId;
  @JsonKey(name: 'driverInfo')
  DriverInfo? driverInfo;
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

  @JsonKey(name: "Fleet_No")
  String? fleetNo;

  @JsonKey(name: "A_Status")
  String? aStatus; //MV,ST,ID

  @JsonKey(name: 'doorStatus')
  int? doorStatus;

  DeviceModel(
      {required this.uuid,
      required this.vehicleId,
      required this.deviceId,
      required this.driverId,
      required this.chasisNumber,
      required this.plateCode,
      required this.plateNumber,
      required this.make,
      required this.model,
      required this.engineSize,
      required this.year,
      required this.color,
      required this.kilometers,
      required this.batteryCurrent,
      required this.batteryVoltage,
      required this.ignitionStatus,
      required this.powerSourceVolt,
      required this.location,
      required this.speed,
      required this.dtcScan,
      required this.temperature,
      required this.allowTracking,
      required this.totalCapacity,
      required this.fuelLevel,
      required this.remKm,
      required this.lastMonth,
      required this.thisMonth,
      required this.totalPercentage,
      required this.batteryPercentage,
      required this.logo,
      required this.carImage,
      this.driverInfo,
      this.fleetNo,
      this.aStatus,
      this.doorStatus});

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  MovementState movementStatus() {
    switch (aStatus) {
      case "MV":
        return MovementState.active;
      case "ST":
        return MovementState.stopped;
      case "ID":
        return MovementState.idle;
    }

    return MovementState.grounded;
  }

  String displayableStatus(){
    switch(movementStatus()){
      case MovementState.active:
        return "Moving";
      case MovementState.stopped:
        return "Stopped";
      case MovementState.idle:
        return "Idle";
      case MovementState.grounded:
        return "Grounded";
    }
  }


  @override
  List<Object?> get props => [
        uuid,
        vehicleId,
        driverId,
        deviceId,
        chasisNumber,
        plateCode,
        plateNumber,
        make,
        model,
        engineSize,
        color,
        year,
        location
      ];

  @override
  String toString() {
    return "$make $model $year";
  }
}

@JsonSerializable(ignoreUnannotated: false)
class Location extends Equatable {
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'long')
  String long;

  Location({required this.lat, required this.long});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [lat, long];
}

@JsonSerializable(ignoreUnannotated: false)
class DriverInfo extends Equatable {
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'uuid')
  String? uuid;

  DriverInfo(
      this.address, this.code, this.email, this.name, this.mobile, this.uuid);

  factory DriverInfo.fromJson(Map<String, dynamic> json) =>
      _$DriverInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DriverInfoToJson(this);

  @override
  List<Object?> get props => [address, code, email, mobile, name, uuid];
}

enum MovementState {
  active,
  stopped,
  idle,
  grounded,
}

import 'package:data/src/models/socket/device_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'socket_chip_model.g.dart';

@JsonSerializable()
class SocketChipModel {
  @JsonKey(name: 'A_Status')
  String? aStatus; //MV,ST,ID

  @JsonKey(name: 'allowTraking')
  String? allowTraking;

  @JsonKey(name: 'Auto_Man')
  String? autoMan;

  @JsonKey(name: 'batteryCurrent')
  String? batteryCurrent;

  @JsonKey(name: 'batteryLevel')
  String? batteryLevel;

  @JsonKey(name: 'batteryVoltage')
  String? batteryVoltage;

  @JsonKey(name: 'Category_ID')
  double? categoryID;

  @JsonKey(name: 'Chassis_Number')
  String? chassisNumber;

  @JsonKey(name: 'chip_ID')
  double? chipID;

  @JsonKey(name: 'Colour')
  String? colour;

  @JsonKey(name: 'CompString_ID')
  double? compStringID;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'created_by')
  int? createdBy;

  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  @JsonKey(name: 'deleted_by')
  String? deletedBy;

  @JsonKey(name: 'dept_id')
  double? deptId;

  @JsonKey(name: 'device_code')
  String? deviceCode;

  @JsonKey(name: 'Device_ID')
  int? deviceID;

  @JsonKey(name: 'device_info')
  DeviceInfo? deviceInfo;

  @JsonKey(name: 'doorStatus')
  double? doorStatus;

  @JsonKey(name: 'Driver_ID')
  String? driverID;

  @JsonKey(name: 'dtcScan')
  String? dtcScan;

  @JsonKey(name: 'Engine_No')
  String? engineNo;

  @JsonKey(name: 'engineRpm')
  double? engineRpm;

  @JsonKey(name: 'Engine_Size')
  String? engineSize;

  @JsonKey(name: 'Expiry_Age')
  String? expiryAge;

  @JsonKey(name: 'Expiry_Date')
  String? expiryDate;

  @JsonKey(name: 'Fleet_No')
  String? fleetNo;

  @JsonKey(name: 'fuelLevel')
  double? fuelLevel;

  @JsonKey(name: 'fuelVolume')
  double? fuelVolume;

  @JsonKey(name: 'group_id')
  int? groupId;

  @JsonKey(name: 'htstatus')
  String? htstatus;

  @JsonKey(name: 'id')
  double? id;

  @JsonKey(name: 'ignitionStatus')
  double? ignitionStatus;

  @JsonKey(name: 'IsActive')
  double? isActive;

  @JsonKey(name: 'IsSalik')
  String? isSalik;

  @JsonKey(name: 'Is_Sent')
  String? isSent;

  @JsonKey(name: 'KM_Updated')
  String? kMUpdated;

  @JsonKey(name: 'Kilometers')
  double? kilometers;

  @JsonKey(name: 'lat')
  String? lat;

  @JsonKey(name: 'Lock_Unlock')
  String? lockUnlock;

  @JsonKey(name: 'Lock_Unlock_Date')
  String? lockUnlockDate;

  @JsonKey(name: 'Lock_Unlock_Remarks')
  String? lockUnlockRemarks;

  @JsonKey(name: 'longi')
  String? longi;

  @JsonKey(name: 'Make')
  String? make;

  @JsonKey(name: 'Model')
  String? model;

  @JsonKey(name: 'movementStatus')
  int? movementStatus;

  @JsonKey(name: 'Passenger_Insurance_Covered')
  String? passengerInsuranceCovered;

  @JsonKey(name: 'Plate_Code')
  String? plateCode;

  @JsonKey(name: 'Plate_Number')
  String? plateNumber;

  @JsonKey(name: 'powerSourceVolt')
  String? powerSourceVolt;

  @JsonKey(name: 'Purchase_Date')
  String? purchaseDate;

  @JsonKey(name: 'qr_code')
  String? qrCode;

  @JsonKey(name: 'Reg_Date')
  String? regDate;

  @JsonKey(name: 'Salik_No')
  String? salikNo;

  @JsonKey(name: 'Seat_Capacity')
  String? seatCapacity;

  @JsonKey(name: 'Sent_Date')
  String? sentDate;

  @JsonKey(name: 'signalStrength')
  int? signalStrength;

  SocketChipModel({
    this.aStatus,
    this.allowTraking,
    this.autoMan,
    this.batteryCurrent,
    this.batteryLevel,
    this.batteryVoltage,
    this.categoryID,
    this.chassisNumber,
    this.chipID,
    this.colour,
    this.compStringID,
    this.createdAt,
    this.createdBy,
    this.deletedAt,
    this.deletedBy,
    this.deptId,
    this.deviceCode,
    this.deviceID,
    this.deviceInfo,
    this.doorStatus,
    this.driverID,
    this.dtcScan,
    this.engineNo,
    this.engineRpm,
    this.engineSize,
    this.expiryAge,
    this.expiryDate,
    this.fleetNo,
    this.fuelLevel,
    this.fuelVolume,
    this.groupId,
    this.htstatus,
    this.id,
    this.ignitionStatus,
    this.isActive,
    this.isSalik,
    this.isSent,
    this.kMUpdated,
    this.kilometers,
    this.lat,
    this.lockUnlock,
    this.lockUnlockDate,
    this.lockUnlockRemarks,
    this.longi,
    this.make,
    this.model,
    this.movementStatus,
    this.passengerInsuranceCovered,
    this.plateCode,
    this.plateNumber,
    this.powerSourceVolt,
    this.purchaseDate,
    this.qrCode,
    this.regDate,
    this.salikNo,
    this.seatCapacity,
    this.sentDate,
    this.signalStrength,
  });

  factory SocketChipModel.fromJson(Map<String, dynamic> json) => _$SocketChipModelFromJson(json);
  Map<String, dynamic> toJson() => _$SocketChipModelToJson(this);
}

// Note: You'll need to create a separate file for the DeviceInfo class
// and generate the corresponding JSON serialization code for it as well.


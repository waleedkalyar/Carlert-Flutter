import 'package:json_annotation/json_annotation.dart';

part 'device_info.g.dart';

@JsonSerializable()
class DeviceInfo {
  @JsonKey(name: "ain.1")
  double? ain1;
  @JsonKey(name: "ain.2")
  double? ain2;
  @JsonKey(name: "battery.current")
  double? batteryCurrent;
  @JsonKey(name: "battery.level")
  double? batteryLevel;
  @JsonKey(name: "battery.temperature")
  double? batteryTemperature;
  @JsonKey(name: "battery.voltage")
  double? batteryVoltage;
  @JsonKey(name: "button.pressed.status")
  bool? buttonPressedStatus;
  @JsonKey(name: "cable.connected.status")
  bool? cableConnectedStatus;
  @JsonKey(name: "can.abs.failure.indicator.status")
  bool? canAbsFailureIndicatorStatus;
  @JsonKey(name: "can.air.condition.status")
  bool? canAirConditionStatus;
  @JsonKey(name: "can.airbag.indicator.status")
  bool? canAirbagIndicatorStatus;
  @JsonKey(name: "can.automatic.retarder.status")
  bool? canAutomaticRetarderStatus;
  @JsonKey(name: "can.battery.indicator.status")
  bool? canBatteryIndicatorStatus;
  @JsonKey(name: "can.battery.voltage")
  double? canBatteryVoltage;
  @JsonKey(name: "can.car.closed.remote.status")
  bool? canCarClosedRemoteStatus;
  @JsonKey(name: "can.car.closed.status")
  bool? canCarClosedStatus;
  @JsonKey(name: "can.check.engine.indicator.status")
  bool? canCheckEngineIndicatorStatus;
  @JsonKey(name: "can.connection.state.1")
  double? canConnectionState1;
  @JsonKey(name: "can.connection.state.2")
  double? canConnectionState2;
  @JsonKey(name: "can.connection.state.3")
  double? canConnectionState3;
  @JsonKey(name: "can.coolant.level.low.indicator.status")
  bool? canCoolantLevelLowIndicatorStatus;
  @JsonKey(name: "can.cruise.status")
  bool? canCruiseStatus;
  @JsonKey(name: "can.driver.seatbelt.indicator.status")
  bool? canDriverSeatbeltIndicatorStatus;
  @JsonKey(name: "can.dynamic.ignition.status")
  bool? canDynamicIgnitionStatus;
  @JsonKey(name: "can.electronic.power.control.status")
  bool? canElectronicPowerControlStatus;
  @JsonKey(name: "can.engine.ignition.status")
  bool? canEngineIgnitionStatus;
  @JsonKey(name: "can.engine.rpm")
  double? canEngineRpm;
  @JsonKey(name: "can.engine.temperature")
  double? canEngineTemperature;
  @JsonKey(name: "can.engine.working.status")
  bool? canEngineWorkingStatus;
  @JsonKey(name: "can.eps.indicator.status")
  bool? canEpsIndicatorStatus;
  @JsonKey(name: "can.esp.indicator.status")
  bool? canEspIndicatorStatus;
  @JsonKey(name: "can.esp.status")
  bool? canEspStatus;
  @JsonKey(name: "can.factory.armed.status")
  bool? canFactoryArmedStatus;
  @JsonKey(name: "can.front.fog.lights.status")
  bool? canFrontFogLightsStatus;
  @JsonKey(name: "can.front.left.door.status")
  bool? canFrontLeftDoorStatus;
  @JsonKey(name: "can.front.right.door.status")
  bool? canFrontRightDoorStatus;
  @JsonKey(name: "can.fuel.consumed")
  double? canFuelConsumed;
  @JsonKey(name: "can.fuel.level")
  double? canFuelLevel;
  @JsonKey(name: "can.fuel.level.low.indicator.status")
  bool? canFuelLevelLowIndicatorStatus;
  @JsonKey(name: "can.fuel.volume")
  double? canFuelVolume;
  @JsonKey(name: "can.glow.plug.indicator.status")
  bool? canGlowPlugIndicatorStatus;
  @JsonKey(name: "can.handbrake.indicator.status")
  bool? canHandbrakeIndicatorStatus;
  @JsonKey(name: "can.handbrake.status")
  bool? canHandbrakeStatus;
  @JsonKey(name: "can.high.beam.status")
  bool? canHighBeamStatus;
  @JsonKey(name: "can.hood.status")
  bool? canHoodStatus;
  @JsonKey(name: "can.ignition.key.status")
  bool? canIgnitionKeyStatus;
  @JsonKey(name: "can.lights.failure.indicator.status")
  bool? canLightsFailureIndicatorStatus;
  @JsonKey(name: "can.lights.hazard.lights.status")
  bool? canLightsHazardLightsStatus;
  @JsonKey(name: "can.low.beam.status")
  bool? canLowBeamStatus;
  @JsonKey(name: "can.maDoubleenance.required.status")
  bool? canMaDoubleenanceRequiredStatus;
  @JsonKey(name: "can.manual.retarder.status")
  bool? canManualRetarderStatus;
  @JsonKey(name: "can.module.sleep.mode")
  bool? canModuleSleepMode;
  @JsonKey(name: "can.oil.pressure.indicator.status")
  bool? canOilPressureIndicatorStatus;
  @JsonKey(name: "can.parking.lights.status")
  bool? canParkingLightsStatus;
  @JsonKey(name: "can.parking.status")
  bool? canParkingStatus;
  @JsonKey(name: "can.passenger.seatbelt.indicator.status")
  bool? canPassengerSeatbeltIndicatorStatus;
  @JsonKey(name: "can.pedal.brake.status")
  bool? canPedalBrakeStatus;
  @JsonKey(name: "can.private.status")
  bool? canPrivateStatus;
  @JsonKey(name: "can.ready.to.drive.indicator.status")
  bool? canReadyToDriveIndicatorStatus;
  @JsonKey(name: "can.rear.fog.lights.status")
  bool? canRearFogLightsStatus;
  @JsonKey(name: "can.rear.left.door.status")
  bool? canRearLeftDoorStatus;
  @JsonKey(name: "can.rear.right.door.status")
  bool? canRearRightDoorStatus;
  @JsonKey(name: "can.reverse.gear.status")
  bool? canReverseGearStatus;
  @JsonKey(name: "can.soot.filter.indicator.status")
  bool? canSootFilterIndicatorStatus;
  @JsonKey(name: "can.stop.indicator.status")
  bool? canStopIndicatorStatus;
  @JsonKey(name: "can.throttle.pedal.level")
  double? canThrottlePedalLevel;
  @JsonKey(name: "can.tire.pressure.low.status")
  bool? canTirePressureLowStatus;
  @JsonKey(name: "can.tracker.counted.fuel.consumed")
  double? canTrackerCountedFuelConsumed;
  @JsonKey(name: "can.trip.fuel.consumed")
  double? canTripFuelConsumed;
  @JsonKey(name: "can.trunk.status")
  bool? canTrunkStatus;
  @JsonKey(name: "can.vehicle.battery.charging.status")
  bool? canVehicleBatteryChargingStatus;
  @JsonKey(name: "can.vehicle.battery.level")
  double? canVehicleBatteryLevel;
  @JsonKey(name: "can.vehicle.mileage")
  double? canVehicleMileage;
  @JsonKey(name: "can.vehicle.speed")
  double? canVehicleSpeed;
  @JsonKey(name: "can.warning.indicator.status")
  bool? canWarningIndicatorStatus;
  @JsonKey(name: "can.wear.brake.pads.indicator.status")
  bool? canWearBrakePadsIndicatorStatus;
  @JsonKey(name: "can.webasto.status")
  bool? canWebastoStatus;
  @JsonKey(name: "car.remote.control.state")
  double? carRemoteControlState;
  @JsonKey(name: "channel.id")
  double? channelId;
  @JsonKey(name: "codec.id")
  double? codecId;
  @JsonKey(name: "device.id")
  double? deviceId;
  @JsonKey(name: "device.name")
  String? deviceName;
  @JsonKey(name: "device.type.id")
  double? deviceTypeId;
  @JsonKey(name: "din")
  double? din;
  @JsonKey(name: "din.1")
  bool? din1;
  @JsonKey(name: "din.2")
  bool? din2;
  @JsonKey(name: "din.3")
  bool? din3;
  @JsonKey(name: "door.open.status")
  bool? doorOpenStatus;
  @JsonKey(name: "engine.ignition.status")
  bool? engineIgnitionStatus;
  @JsonKey(name: "event.priority.enum")
  double? eventPriorityEnum;
  @JsonKey(name: "external.powersource.voltage")
  double? externalPowersourceVoltage;
  @JsonKey(name: "factory.alarm.actuated.status")
  bool? factoryAlarmActuatedStatus;
  @JsonKey(name: "factory.alarm.emulated.status")
  bool? factoryAlarmEmulatedStatus;
  @JsonKey(name: "gnss.state.enum")
  double? gnssStateEnum;
  @JsonKey(name: "gnss.status")
  bool? gnssStatus;
  @JsonKey(name: "gps.fuel.rate")
  double? gpsFuelRate;
  @JsonKey(name: "gsm.mcc")
  double? gsmMcc;
  @JsonKey(name: "gsm.mnc")
  double? gsmMnc;
  @JsonKey(name: "gsm.operator.code")
  String? gsmOperatorCode;
  @JsonKey(name: "gsm.signal.level")
  double? gsmSignalLevel;
  @JsonKey(name: "gsm.sim.iccid")
  String? gsmSimIccid;
  @JsonKey(name: "ident")
  String? ident;
  @JsonKey(name: "immobilizer.keys.status")
  bool? immobilizerKeysStatus;
  @JsonKey(name: "immobilizer.service.status")
  bool? immobilizerServiceStatus;
  @JsonKey(name: "movement.status")
  bool? movementStatus;
  @JsonKey(name: "peer")
  String? peer;
  @JsonKey(name: "position.altitude")
  double? positionAltitude;
  @JsonKey(name: "position.direction")
  double? positionDirection;
  @JsonKey(name: "position.hdop")
  double? positionHdop;
  @JsonKey(name: "position.latitude")
  double? positionLatitude;
  @JsonKey(name: "position.longitude")
  double? positionLongitude;
  @JsonKey(name: "position.pdop")
  double? positionPdop;
  @JsonKey(name: "position.satellites")
  double? positionSatellites;
  @JsonKey(name: "position.speed")
  double? positionSpeed;
  @JsonKey(name: "position.valid")
  bool? positionValid;
  @JsonKey(name: "protocol.id")
  double? protocolId;
  @JsonKey(name: "segment.can.fuel.consumed")
  double? segmentCanFuelConsumed;
  @JsonKey(name: "segment.can.vehicle.mileage")
  double? segmentCanVehicleMileage;
  @JsonKey(name: "segment.vehicle.mileage")
  double? segmentVehicleMileage;
  @JsonKey(name: "server.timestamp")
  double? serverTimestamp;
  @JsonKey(name: "sleep.mode.enum")
  double? sleepModeEnum;
  @JsonKey(name: "timestamp")
  double? timestamp;
  @JsonKey(name: "total.trip.duration")
  double? totalTripDuration;
  @JsonKey(name: "trip.duration")
  double? tripDuration;
  @JsonKey(name: "trip.fuel.consumed")
  double? tripFuelConsumed;
  @JsonKey(name: "trip.harsh.acceleration.number")
  double? tripHarshAccelerationNumber;
  @JsonKey(name: "trip.harsh.braking.number")
  double? tripHarshBrakingNumber;
  @JsonKey(name: "trip.idle.fuel.consumed")
  double? tripIdleFuelConsumed;
  @JsonKey(name: "trip.max.rpm")
  double? tripMaxRpm;
  @JsonKey(name: "trip.max.speed")
  double? tripMaxSpeed;
  @JsonKey(name: "trip.mileage")
  double? tripMileage;
  @JsonKey(name: "trip.start.timestamp")
  double? tripStartTimestamp;
  @JsonKey(name: "trip.status")
  bool? tripStatus;
  @JsonKey(name: "vehicle.mileage")
  double? vehicleMileage;
  @JsonKey(name: "x.acceleration")
  double? xAcceleration;
  @JsonKey(name: "y.acceleration")
  double? yAcceleration;
  @JsonKey(name: "z.acceleration")
  double? zAcceleration;

  DeviceInfo({
    this.ain1,
    this.ain2,
    this.batteryCurrent,
    this.batteryLevel,
    this.batteryTemperature,
    this.batteryVoltage,
    this.buttonPressedStatus,
    this.cableConnectedStatus,
    this.canAbsFailureIndicatorStatus,
    this.canAirConditionStatus,
    this.canAirbagIndicatorStatus,
    this.canAutomaticRetarderStatus,
    this.canBatteryIndicatorStatus,
    this.canBatteryVoltage,
    this.canCarClosedRemoteStatus,
    this.canCarClosedStatus,
    this.canCheckEngineIndicatorStatus,
    this.canConnectionState1,
    this.canConnectionState2,
    this.canConnectionState3,
    this.canCoolantLevelLowIndicatorStatus,
    this.canCruiseStatus,
    this.canDriverSeatbeltIndicatorStatus,
    this.canDynamicIgnitionStatus,
    this.canElectronicPowerControlStatus,
    this.canEngineIgnitionStatus,
    this.canEngineRpm,
    this.canEngineTemperature,
    this.canEngineWorkingStatus,
    this.canEpsIndicatorStatus,
    this.canEspIndicatorStatus,
    this.canEspStatus,
    this.canFactoryArmedStatus,
    this.canFrontFogLightsStatus,
    this.canFrontLeftDoorStatus,
    this.canFrontRightDoorStatus,
    this.canFuelConsumed,
    this.canFuelLevel,
    this.canFuelLevelLowIndicatorStatus,
    this.canFuelVolume,
    this.canGlowPlugIndicatorStatus,
    this.canHandbrakeIndicatorStatus,
    this.canHandbrakeStatus,
    this.canHighBeamStatus,
    this.canHoodStatus,
    this.canIgnitionKeyStatus,
    this.canLightsFailureIndicatorStatus,
    this.canLightsHazardLightsStatus,
    this.canLowBeamStatus,
    this.canMaDoubleenanceRequiredStatus,
    this.canManualRetarderStatus,
    this.canModuleSleepMode,
    this.canOilPressureIndicatorStatus,
    this.canParkingLightsStatus,
    this.canParkingStatus,
    this.canPassengerSeatbeltIndicatorStatus,
    this.canPedalBrakeStatus,
    this.canPrivateStatus,
    this.canReadyToDriveIndicatorStatus,
    this.canRearFogLightsStatus,
    this.canRearLeftDoorStatus,
    this.canRearRightDoorStatus,
    this.canReverseGearStatus,
    this.canSootFilterIndicatorStatus,
    this.canStopIndicatorStatus,
    this.canThrottlePedalLevel,
    this.canTirePressureLowStatus,
    this.canTrackerCountedFuelConsumed,
    this.canTripFuelConsumed,
    this.canTrunkStatus,
    this.canVehicleBatteryChargingStatus,
    this.canVehicleBatteryLevel,
    this.canVehicleMileage,
    this.canVehicleSpeed,
    this.canWarningIndicatorStatus,
    this.canWearBrakePadsIndicatorStatus,
    this.canWebastoStatus,
    this.carRemoteControlState,
    this.channelId,
    this.codecId,
    this.deviceId,
    this.deviceName,
    this.deviceTypeId,
    this.din,
    this.din1,
    this.din2,
    this.din3,
    this.doorOpenStatus,
    this.engineIgnitionStatus,
    this.eventPriorityEnum,
    this.externalPowersourceVoltage,
    this.factoryAlarmActuatedStatus,
    this.factoryAlarmEmulatedStatus,
    this.gnssStateEnum,
    this.gnssStatus,
    this.gpsFuelRate,
    this.gsmMcc,
    this.gsmMnc,
    this.gsmOperatorCode,
    this.gsmSignalLevel,
    this.gsmSimIccid,
    this.ident,
    this.immobilizerKeysStatus,
    this.immobilizerServiceStatus,
    this.movementStatus,
    this.peer,
    this.positionAltitude,
    this.positionDirection,
    this.positionHdop,
    this.positionLatitude,
    this.positionLongitude,
    this.positionPdop,
    this.positionSatellites,
    this.positionSpeed,
    this.positionValid,
    this.protocolId,
    this.segmentCanFuelConsumed,
    this.segmentCanVehicleMileage,
    this.segmentVehicleMileage,
    this.serverTimestamp,
    this.sleepModeEnum,
    this.timestamp,
    this.totalTripDuration,
    this.tripDuration,
    this.tripFuelConsumed,
    this.tripHarshAccelerationNumber,
    this.tripHarshBrakingNumber,
    this.tripIdleFuelConsumed,
    this.tripMaxRpm,
    this.tripMaxSpeed,
    this.tripMileage,
    this.tripStartTimestamp,
    this.tripStatus,
    this.vehicleMileage,
    this.xAcceleration,
    this.yAcceleration,
    this.zAcceleration,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);
}


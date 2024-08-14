import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_slot_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class TimeSlotModel extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'created_at')
  String createdAt;

  TimeSlotModel(
      {required this.id, required this.name, required this.createdAt});

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt];
}

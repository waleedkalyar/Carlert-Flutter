import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_location.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ServiceLocation extends Equatable{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'created_at')
  String createdAt;

  ServiceLocation({required this.id, required this.name, required this.createdAt});

   factory ServiceLocation.fromJson(Map<String, dynamic> json) => _$ServiceLocationFromJson(json);

   Map<String, dynamic> toJson() => _$ServiceLocationToJson(this);

  @override

  List<Object?> get props =>  [id,name];
}


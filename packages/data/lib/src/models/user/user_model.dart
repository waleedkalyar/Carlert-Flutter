import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String token;
  final String name;
  final String phone;
  final String email;
  final String userGroup;
  final String country;

  const UserModel({required this.token,
    required this.name,
    required this.phone,
    required this.email,
    required this.userGroup,
    required this.country});

  static const empty = UserModel(
      token: "",
      name: "",
      phone: "",
      email: "",
      userGroup: "",
      country: "");

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [token, name, phone, email, userGroup, country];


  static const dummyUser = UserModel(
      token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YzMyZDMzOC0yM2I2LTRlOWYtYWMyZS1hZGQzYjY4MWE3NzciLCJqdGkiOiI5NWY0NWEzYWY4MDY5YTQ0NDI4ZGJjNjU1NmQwZGFjYzZhNDM4MTcyYzk5OWM5NzQ1MTNhOTBlYzg0YWJkOGM2MTdmNTQwYTRlNzJmNzc0OSIsImlhdCI6MTcyMTgxMDYxMi43NTA5NTMsIm5iZiI6MTcyMTgxMDYxMi43NTA5NTYsImV4cCI6MTc1MzM0NjYxMi43NDI2MDIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.QqrQUR4wzod0VNrM45ACjGVwAMijOhO7-QdJCXR9YvHDryInsF_wZzZUfU6OCjX13yxSLdqV9jJ6BgieOqBF25J_2qzJD07cSDeVTNhHSJIgXhTw9K7VddjeTq-plDVFx60Bm-zFbbVBFQ7RHIpT8yjgA6SIyzb1d6flhaZk7CgYfhDoSWOdXILMEKzhSav4omnZRsV-YSMnd57qnQJ-J8xcXsfdXUU5vteMf3ypPiZIaSZvq4JNXDF_s0uqosuhLa_jGMkcU-2YV8bNe3XfaWQ2o_9zsbJX8CFrNQ25-ermYWMw1yT9Q353nQKbjb0a4I-6nSMC47KDYjaZao0ePwlq5cpY1zSGJSWSBmfRga0SaAAahyAB78h7CXQIFOgTQx2hez49hzT6fPgNOU3PuzDH4n6x3mSCOhkwHyVyv-rIYr4isBajoDkZvpWzm3M9uTbmp1t2MTwD3uwyAr5wUbOSXAiiqMycElupZ2P68X6gAb1uyHbAXNJ-WW4sXMMUmvrgsK5OVMK07Q4bFf302futsC-1KxPysRrpBi78wHqdkvIPPoVXrNZPx8wjkRhIDGmH9n7e7AanOCZJj8s8RuyPqRiP7hnHSyeKzFUYRW52HiBu9XPodAYYbo0hiLSvb21xu9mfon6IFjvSZO30DdUrB35legvmZKJItXLDOGM",
      name: "Servicemycar",
      phone: "971581059810",
      email: "smcadmin@servicemycar.com",
      userGroup: "driver",
      country: "AE");

}

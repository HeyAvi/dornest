// To parse this JSON data, do
//
//     final userRoleType = userRoleTypeFromJson(jsonString);

import 'dart:convert';

UserRoleType userRoleTypeFromJson(String str) =>
    UserRoleType.fromJson(json.decode(str));

String userRoleTypeToJson(UserRoleType data) => json.encode(data.toJson());

class UserRoleType {
  UserRoleType({
    required this.id,
    required this.name,
    required this.role,
    required this.mobile,
    required this.email,
    required this.location,
    required this.city,
    required this.pincode,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  String id;
  String name;
  String role;
  String mobile;
  String email;
  String location;
  String city;
  String pincode;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  String isActive;

  factory UserRoleType.fromJson(Map<String, dynamic> json) => UserRoleType(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        mobile: json["mobile"],
        email: json["email"],
        location: json["location"],
        city: json["city"],
        pincode: json["pincode"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "mobile": mobile,
        "email": email,
        "location": location,
        "city": city,
        "pincode": pincode,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
      };
}

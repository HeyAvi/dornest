import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    required this.name,
    required this.role,
    required this.mobile,
    required this.email,
    required this.location,
    required this.city,
    required this.pincode,
    required this.password,
    required this.createdAt,
    this.updatedAt,
    this.isActive,
  });

  String? id;
  String name;
  String role;
  String mobile;
  String email;
  String location;
  String city;
  String pincode;
  String password;
  DateTime createdAt;
  DateTime? updatedAt;
  String? isActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
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

  Map<String, String?> toJson() => {
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
        "updated_at": updatedAt?.toIso8601String(),
        "is_active": isActive,
      };
}

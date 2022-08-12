
import 'dart:convert';

InquiryModel inquiryModelFromJson(String str) => InquiryModel.fromJson(json.decode(str));

String inquiryModelToJson(InquiryModel data) => json.encode(data.toJson());

class InquiryModel {
  InquiryModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.location,
    required this.message,
    required this.createdAt,
  });

  String name;
  String email;
  String mobile;
  String location;
  String message;
  DateTime createdAt;

  factory InquiryModel.fromJson(Map<String, dynamic> json) => InquiryModel(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    location: json["location"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "location": location,
    "message": message,
    "created_at": createdAt.toIso8601String(),
  };
}

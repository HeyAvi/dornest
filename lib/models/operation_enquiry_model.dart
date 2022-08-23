// To parse this JSON data, do
//
//     final operationEnquiry = operationEnquiryFromJson(jsonString);

import 'dart:convert';

OperationEnquiry operationEnquiryFromJson(String str) =>
    OperationEnquiry.fromJson(json.decode(str));

String operationEnquiryToJson(OperationEnquiry data) =>
    json.encode(data.toJson());

class OperationEnquiry {
  OperationEnquiry({
    required this.id,
    required this.pid,
    required this.name,
    required this.role,
    required this.email,
    required this.mobile,
    required this.location,
    required this.message,
    required this.isClosed,
    required this.acceptedQid,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String pid;
  String name;
  String role;
  String email;
  String mobile;
  String? location;
  String? message;
  String? isClosed;
  String? acceptedQid;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OperationEnquiry.fromJson(Map<String, dynamic> json) =>
      OperationEnquiry(
        id: json["id"],
        pid: json["pid"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        mobile: json["mobile"],
        location: json["location"],
        message: json["message"],
        isClosed: json["is_closed"],
        acceptedQid: json["accepted_qid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pid": pid,
        "name": name,
        "role": role,
        "email": email,
        "mobile": mobile,
        "location": location,
        "message": message,
        "is_closed": isClosed,
        "accepted_qid": acceptedQid,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

import 'dart:convert';

EnquiryUser enquiryUserFromJson(String str) =>
    EnquiryUser.fromJson(json.decode(str));

String enquiryUserToJson(EnquiryUser data) => json.encode(data.toJson());

class EnquiryUser {
  EnquiryUser({
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
  String location;
  dynamic message;
  String isClosed;
  String acceptedQid;
  DateTime createdAt;
  DateTime updatedAt;

  factory EnquiryUser.fromJson(Map<String, dynamic> json) => EnquiryUser(
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

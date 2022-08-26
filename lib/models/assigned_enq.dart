// To parse this JSON data, do
//
//     final assignedEnquiry = assignedEnquiryFromJson(jsonString);

import 'dart:convert';

AssignedEnquiry assignedEnquiryFromJson(String str) =>
    AssignedEnquiry.fromJson(json.decode(str));

String assignedEnquiryToJson(AssignedEnquiry data) =>
    json.encode(data.toJson());

class AssignedEnquiry {
  AssignedEnquiry({
    required this.id,
    required this.assignerId,
    required this.enquireId,
    required this.enquireReceiver,
    required this.quoteSend,
    required this.quotationId,
    required this.quoteAccepted,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String assignerId;
  String enquireId;
  String enquireReceiver;
  String quoteSend;
  dynamic quotationId;
  String quoteAccepted;
  DateTime createdAt;
  DateTime updatedAt;

  factory AssignedEnquiry.fromJson(Map<String, dynamic> json) =>
      AssignedEnquiry(
        id: json["id"],
        assignerId: json["assigner_id"],
        enquireId: json["enquire_id"],
        enquireReceiver: json["enquire_receiver"],
        quoteSend: json["quote_send"],
        quotationId: json["quotation_id"],
        quoteAccepted: json["quote_accepted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "assigner_id": assignerId,
        "enquire_id": enquireId,
        "enquire_receiver": enquireReceiver,
        "quote_send": quoteSend,
        "quotation_id": quotationId,
        "quote_accepted": quoteAccepted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

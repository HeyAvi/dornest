// To parse this JSON data, do
//
//     final quotationModel = quotationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuotationModel quotationModelFromJson(String str) => QuotationModel.fromJson(json.decode(str));

String quotationModelToJson(QuotationModel data) => json.encode(data.toJson());

class QuotationModel {
  QuotationModel({
    required this.id,
    required this.pid,
    required this.thikness,
    required this.width,
    required this.height,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.gst,
    required this.total,
    required this.eid,
    required this.qid,
    required this.userId,
    required this.productSelect,
    required this.specifiedDone,
    required this.priceDone,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String pid;
  String thikness;
  String width;
  String height;
  String quantity;
  String price;
  String discount;
  String gst;
  String total;
  String eid;
  String qid;
  String userId;
  String productSelect;
  String specifiedDone;
  String priceDone;
  dynamic createdAt;
  DateTime updatedAt;

  factory QuotationModel.fromJson(Map<String, dynamic> json) => QuotationModel(
    id: json["id"],
    pid: json["pid"],
    thikness: json["thikness"],
    width: json["width"],
    height: json["height"],
    quantity: json["quantity"],
    price: json["price"],
    discount: json["discount"],
    gst: json["gst"],
    total: json["total"],
    eid: json["eid"],
    qid: json["qid"],
    userId: json["user_id"],
    productSelect: json["product_select"],
    specifiedDone: json["specified_done"],
    priceDone: json["price_done"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pid": pid,
    "thikness": thikness,
    "width": width,
    "height": height,
    "quantity": quantity,
    "price": price,
    "discount": discount,
    "gst": gst,
    "total": total,
    "eid": eid,
    "qid": qid,
    "user_id": userId,
    "product_select": productSelect,
    "specified_done": specifiedDone,
    "price_done": priceDone,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}

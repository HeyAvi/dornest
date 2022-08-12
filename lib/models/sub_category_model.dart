// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  SubCategoryModel({
    required this.id,
    required this.cid,
    required this.subcategory,
    required this.createdAt,
    this.isActive,
  });

  String id;
  String cid;
  String subcategory;
  DateTime createdAt;
  bool? isActive;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json, {bool? isActive}) =>
      SubCategoryModel(
        id: json["id"],
        cid: json["cid"],
        subcategory: json["subcategory"],
        createdAt: DateTime.parse(json["created_at"]),
        isActive: isActive,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cid": cid,
        "subcategory": subcategory,
        "created_at": createdAt.toIso8601String(),
      };
}

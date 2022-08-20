// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.category,
    required this.curl,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String category;
  String curl;
  String image;
  dynamic createdAt;
  DateTime updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        category: json["category"],
        curl: json["curl"],
        image:  json["image"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "curl": curl,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}

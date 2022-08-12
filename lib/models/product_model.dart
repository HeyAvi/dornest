// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.productId,
    required this.category,
    required this.subcategory,
    required this.product,
    required this.purl,
    required this.mainPrice,
    required this.discount,
    required this.disPrice,
    required this.rating,
    required this.description,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String productId;
  String category;
  String subcategory;
  String product;
  String purl;
  String mainPrice;
  String discount;
  String disPrice;
  String rating;
  String description;
  String tags;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productId: json["product_id"],
    category: json["category"],
    subcategory: json["subcategory"],
    product: json["product"],
    purl: json["purl"],
    mainPrice: json["main_price"],
    discount: json["discount"],
    disPrice: json["dis_price"],
    rating: json["rating"],
    description: json["description"],
    tags: json["tags"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "category": category,
    "subcategory": subcategory,
    "product": product,
    "purl": purl,
    "main_price": mainPrice,
    "discount": discount,
    "dis_price": disPrice,
    "rating": rating,
    "description": description,
    "tags": tags,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

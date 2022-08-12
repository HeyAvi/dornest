import 'dart:convert';

import 'package:dornest/UI/DashBoard/Support/Inquiry.dart';
import 'package:dornest/models/InquiryModel.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl = 'https://dornest.doc24.care';
  static const String products = '/api/products';
  static const String categories = '/api/categories';
  static const String subcategories = '/api/get-subcategory/';
  static const String inquiryUrl = '/api/send-enquire';

  static Future<String?> getProducts() async {
    var request = http.Request('GET', Uri.parse(baseUrl + products));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }

  static Future<String?> getCategories() async {
    var request = http.Request('GET', Uri.parse(baseUrl + categories));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }

  static Future<String?> getSubcategories({required String categoryId}) async {
    var request =
        http.Request('GET', Uri.parse(baseUrl + subcategories + categoryId));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }

  static Future<bool> sendInquiry({required InquiryModel inquiry}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + inquiryUrl));
    try {
      request.fields.addAll({
        'name': inquiry.name,
        'email': inquiry.email,
        'mobile': inquiry.mobile,
        'location': inquiry.location,
        'message': inquiry.message,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      return false;
    }
    return false;
  }
}

import 'package:dornest/models/inquiry_model.dart';
import 'package:dornest/models/user_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl = 'https://dornest.doc24.care';
  static const String products = '/api/products';
  static const String categories = '/api/categories';
  static const String subcategories = '/api/get-subcategory/';
  static const String inquiryUrl = '/api/send-enquire';
  static const String selectProduct = '/api/select_product';
  static const String measurementCalc = '/api/update_specifications/';
  static const String signUpUrl = '/api/signup';
  static const String loginUrl = '/api/login';
  static const String getAssignedEnq = '/api/get_assigned_enquires/';
  static const String getEnqDetails = '/api/enquire_details_by_enquire_id/';
  static const String operatorEnquiries = '/api/enquires';

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

  static Future<String?> getAssignedEnquiries({required String userId}) async {
    var request =
        http.Request('GET', Uri.parse(baseUrl + getAssignedEnq + userId));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }

  static Future<String?> getEnquiriesDetails(
      {required String enquiryId}) async {
    var request =
        http.Request('GET', Uri.parse(baseUrl + getEnqDetails + enquiryId));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }

  static Future<bool> sendInquiry(
      {required InquiryModel inquiry, User? user}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + inquiryUrl));
    try {
      request.fields.addAll({
        'name': inquiry.name,
        'email': inquiry.email,
        'mobile': inquiry.mobile,
        'location': inquiry.location,
        'message': inquiry.message,
        'pid': inquiry.pid,
        'role': user?.role == null ? '5' : '1',
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

  static Future<String?> selectProductApi(
      {required String eid,
      required String userId,
      required String allProducts}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + selectProduct));
    try {
      print('$eid $userId $allProducts');

      request.fields.addAll({
        'allProducts': allProducts,
        'eid': eid,
        'user_id': userId,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      }
    } on Exception catch (e) {
      return null;
    }
    return null;
  }

  static Future<String?> submitMeasurementAndCalc(
      {required String qid, required Map<String, String> formData}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + measurementCalc + qid));
    request.fields.addAll(formData);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      }
    } on Exception catch (e) {
      return null;
    }
    return null;
  }

  static Future<String?> loginUser(
      {required String email, required String password}) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + loginUrl));
    try {
      request.fields.addAll({'username': email, 'password': password});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      }
    } on Exception catch (e) {
      return null;
    }
    return null;
  }

  static Future<String?> getAllOperatorEnquiries() async {
    var request =
        http.MultipartRequest('GET', Uri.parse(baseUrl + operatorEnquiries));
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return response.stream.bytesToString();
      }
    } on Exception catch (e) {
      return null;
    }
    return null;
  }

  static Future<String?> userSignUp({required User user}) async {
    var headers = {'Cookie': 'ci_session=bfd8c2bk5usjbjjvc7tnavvke9uique9'};
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + signUpUrl));
    Map a = user.toJson();
    String createdAt = a['created_at'].toString();
    request.fields.addAll({
      'name': user.name,
      'email': user.email,
      'role': user.role,
      'mobile': user.mobile,
      'city': user.city,
      'location': user.location,
      'pincode': user.pincode,
      'password': user.password,
      'created_at': createdAt
    });
    request.headers.addAll(headers);
    print(request.fields);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    }
    return null;
  }
}

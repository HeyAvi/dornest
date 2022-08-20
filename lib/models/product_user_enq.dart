import 'package:dornest/models/enq_user.dart';
import 'package:dornest/models/product_model.dart';

class ProductUserModel{
  EnquiryUser enquiryUser;
  List<Product> products;
  ProductUserModel({required this.products, required this.enquiryUser});
}
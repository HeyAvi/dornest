import 'package:dornest/models/enq_user.dart';

import 'product_measurement_calculation_model.dart';

class ProductUserModel {
  EnquiryUser enquiryUser;
  List<ProductMeasurementCalculation> productMeasurementCalculations;

  ProductUserModel(
      {required this.enquiryUser,
      required this.productMeasurementCalculations});
}

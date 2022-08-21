import 'calculation_model.dart';
import 'measurement_model.dart';
import 'product_model.dart';

class ProductMeasurementCalculation {
  Product product;
  Measurement measurement;
  Calculation calculation;

  ProductMeasurementCalculation(
      {required this.product,
      required this.measurement,
      required this.calculation});
}

class Calculation {
  String quantity;
  String? additionalDiscount;
  String? gst;
  String? total;

  Calculation({
     required this.quantity,
     this.additionalDiscount,
     this.gst,
    this.total,
  });
}

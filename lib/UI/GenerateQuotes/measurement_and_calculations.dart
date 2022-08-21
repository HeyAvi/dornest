import 'package:dornest/models/product_user_enq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/ColorConstants.dart';
import 'calculate_general_quote.dart';

class MeasurementAndCalculations extends StatefulWidget {
  final ProductUserModel productUserModel;

  const MeasurementAndCalculations({Key? key, required this.productUserModel})
      : super(key: key);

  @override
  State<MeasurementAndCalculations> createState() =>
      _MeasurementAndCalculationsState();
}

class _MeasurementAndCalculationsState
    extends State<MeasurementAndCalculations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.colorPrimary,
          elevation: 0,
          title: const Text('Measurement and Calculations'),
        ),
        body: ListView.builder(
          itemCount:
              widget.productUserModel.productMeasurementCalculations.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
                title: Text(widget.productUserModel
                    .productMeasurementCalculations[index].product.product),
                children: [
                  Container(
                    color: ColorConstants.colorWhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Measurement',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h),
                                  side: const BorderSide(
                                      color: ColorConstants.colorPrimary),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 300.w,
                                    padding:
                                        EdgeInsets.only(left: 10.h, right: 7.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Thickness : ",
                                          style: TextStyle(
                                              fontFamily: 'PoppinsMedium',
                                              color:
                                                  ColorConstants.colorPrimary,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        DropdownButton(
                                          iconEnabledColor:
                                              ColorConstants.colorPrimary,
                                          value: widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .thickness ??
                                              32,
                                          items: GeneralQuoteService.thicknesses
                                              .map((int item) {
                                            return DropdownMenuItem<int>(
                                              value: item,
                                              child: Text("$item mm",
                                                  style: TextStyle(
                                                    fontFamily: 'PoppinsMedium',
                                                    fontSize: 16.sp,
                                                  )),
                                            );
                                          }).toList(),
                                          onChanged: (int? value) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .thickness = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h),
                                  side: const BorderSide(
                                      color: ColorConstants.colorPrimary),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 10.h, right: 7.h),
                                        child: Text(
                                          "Height ",
                                          style: TextStyle(
                                              fontFamily: 'PoppinsMedium',
                                              color:
                                                  ColorConstants.colorPrimary,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 0.h, right: 7.h),
                                        child: Slider(
                                          value: widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .height ??
                                              0,
                                          min: 0,
                                          max: widget
                                                      .productUserModel
                                                      .productMeasurementCalculations[
                                                          index]
                                                      .measurement
                                                      .heightUnit ==
                                                  Unit.INCH
                                              ? 96
                                              : 2440,
                                          divisions: widget
                                                      .productUserModel
                                                      .productMeasurementCalculations[
                                                          index]
                                                      .measurement
                                                      .heightUnit ==
                                                  Unit.INCH
                                              ? 96
                                              : 2440,
                                          label:
                                              '${widget.productUserModel.productMeasurementCalculations[index].measurement.height?.round() ?? '0'} ${widget.productUserModel.productMeasurementCalculations[index].measurement.heightUnit?.name.toLowerCase() ?? 'mm'}',
                                          activeColor:
                                              ColorConstants.colorPrimary,
                                          inactiveColor:
                                              ColorConstants.colorBlack12,
                                          onChanged: (double value) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .height = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 7.h, right: 7.h),
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text(
                                                  "${widget.productUserModel.productMeasurementCalculations[index].measurement.height?.toStringAsFixed(0) ?? '0'}${widget.productUserModel.productMeasurementCalculations[index].measurement.heightUnit == Unit.INCH ? ' " ' : '.'}",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'PoppinsMedium',
                                                      color: ColorConstants
                                                          .colorPrimary,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Flexible(
                                                child: TextField(
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9]')),
                                                  ],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'PoppinsMedium',
                                                      color: ColorConstants
                                                          .colorPrimary,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstants
                                                              .colorPrimary,
                                                          width: 2.0),
                                                    ),
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    hintText: widget
                                                                .productUserModel
                                                                .productMeasurementCalculations[
                                                                    index]
                                                                .measurement
                                                                .heightUnit ==
                                                            Unit.INCH
                                                        ? '0'
                                                        : '00',
                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                            'PoppinsMedium',
                                                        color: ColorConstants
                                                            .colorPrimary,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                widget
                                                            .productUserModel
                                                            .productMeasurementCalculations[
                                                                index]
                                                            .measurement
                                                            .heightUnit ==
                                                        Unit.INCH
                                                    ? 'soot '
                                                    : '',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'PoppinsMedium',
                                                    color: ColorConstants
                                                        .colorPrimary,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Spacer()
                                            ],
                                          ),
                                          trailing: DropdownButton<Unit>(
                                            iconEnabledColor:
                                                ColorConstants.colorPrimary,
                                            value: widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .heightUnit ??
                                                Unit.MM,
                                            items: Unit.values.map(
                                              (Unit items) {
                                                return DropdownMenuItem<Unit>(
                                                  value: items,
                                                  child: Text(items.name,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'PoppinsMedium',
                                                        fontSize: 12.sp,
                                                      )),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (Unit? value) {
                                              setState(() {
                                                widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .height = 0;
                                                widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .heightUnit = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h),
                                  side: const BorderSide(
                                      color: ColorConstants.colorPrimary),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 10.h, right: 7.h),
                                        child: Text(
                                          "Width ",
                                          style: TextStyle(
                                              fontFamily: 'PoppinsMedium',
                                              color:
                                                  ColorConstants.colorPrimary,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 0.h, right: 7.h),
                                        child: Slider(
                                          value: widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .width ??
                                              0,
                                          min: 0,
                                          max: widget
                                                      .productUserModel
                                                      .productMeasurementCalculations[
                                                          index]
                                                      .measurement
                                                      .widthUnit ==
                                                  Unit.INCH
                                              ? 48
                                              : 1220,
                                          divisions: widget
                                                      .productUserModel
                                                      .productMeasurementCalculations[
                                                          index]
                                                      .measurement
                                                      .widthUnit ==
                                                  Unit.INCH
                                              ? 48
                                              : 1220,
                                          label:
                                              '${widget.productUserModel.productMeasurementCalculations[index].measurement.width?.round() ?? '0'} ${widget.productUserModel.productMeasurementCalculations[index].measurement.widthUnit?.name.toString().toLowerCase() ?? 'mm'}',
                                          activeColor:
                                              ColorConstants.colorPrimary,
                                          inactiveColor:
                                              ColorConstants.colorBlack12,
                                          onChanged: (double value) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .measurement
                                                  .width = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 300.w,
                                        padding: EdgeInsets.only(
                                            left: 7.h, right: 7.h),
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text(
                                                  "${widget.productUserModel.productMeasurementCalculations[index].measurement.width?.toStringAsFixed(0) ?? '0'}${widget.productUserModel.productMeasurementCalculations[index].measurement.widthUnit == Unit.INCH ? ' " ' : '.'}",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'PoppinsMedium',
                                                      color: ColorConstants
                                                          .colorPrimary,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Flexible(
                                                child: TextField(
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9]')),
                                                  ],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'PoppinsMedium',
                                                      color: ColorConstants
                                                          .colorPrimary,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstants
                                                              .colorPrimary,
                                                          width: 2.0),
                                                    ),
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    hintText: widget
                                                                .productUserModel
                                                                .productMeasurementCalculations[
                                                                    index]
                                                                .measurement
                                                                .widthUnit ==
                                                            Unit.INCH
                                                        ? '0'
                                                        : '00',
                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                            'PoppinsMedium',
                                                        color: ColorConstants
                                                            .colorPrimary,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                widget
                                                            .productUserModel
                                                            .productMeasurementCalculations[
                                                                index]
                                                            .measurement
                                                            .widthUnit ==
                                                        Unit.INCH
                                                    ? 'soot '
                                                    : '',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'PoppinsMedium',
                                                    color: ColorConstants
                                                        .colorPrimary,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Spacer()
                                            ],
                                          ),
                                          trailing: DropdownButton<Unit>(
                                            iconEnabledColor:
                                                ColorConstants.colorPrimary,
                                            value: widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .widthUnit ??
                                                Unit.MM,
                                            items: Unit.values.map(
                                              (Unit items) {
                                                return DropdownMenuItem<Unit>(
                                                  value: items,
                                                  child: Text(items.name,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'PoppinsMedium',
                                                        fontSize: 12.sp,
                                                      )),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (Unit? value) {
                                              setState(() {
                                                widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .width = 0;
                                                widget
                                                    .productUserModel
                                                    .productMeasurementCalculations[
                                                        index]
                                                    .measurement
                                                    .widthUnit = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Calculations',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 300.w,
                                    child: Text(
                                      "Enter Quantity",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          color: ColorConstants.colorPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: 300.w,
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 7.h),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                        ),
                                        child: TextFormField(
                                          initialValue: widget
                                              .productUserModel
                                              .productMeasurementCalculations[
                                                  index]
                                              .calculation
                                              .quantity,
                                          onChanged: (val) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .calculation
                                                  .quantity = val;
                                            });
                                          },
                                          autocorrect: true,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: '',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                  color: ColorConstants
                                                      .colorBlack12,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                color:
                                                    ColorConstants.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 300.w,
                                    padding:
                                        EdgeInsets.only(left: 10.h, right: 7.h),
                                    child: Text(
                                      "Price",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          color: ColorConstants.colorPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: 300.w,
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 7.h),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                        ),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          autocorrect: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            prefixText: "Rs.",
                                            hintText: widget
                                                .productUserModel
                                                .productMeasurementCalculations[
                                                    index]
                                                .product
                                                .mainPrice,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                  color: ColorConstants
                                                      .colorBlack12,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                color:
                                                    ColorConstants.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 300.w,
                                    padding:
                                        EdgeInsets.only(left: 10.h, right: 7.h),
                                    child: Text(
                                      "Additional Discount",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          color: ColorConstants.colorPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: 300.w,
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 7.h),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                        ),
                                        child: TextFormField(
                                          initialValue: widget
                                              .productUserModel
                                              .productMeasurementCalculations[
                                                  index]
                                              .calculation
                                              .additionalDiscount,
                                          keyboardType: TextInputType.number,
                                          autocorrect: true,
                                          onChanged: (val) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .calculation
                                                  .additionalDiscount = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: '',
                                            suffixText: "%",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                  color: ColorConstants
                                                      .colorBlack12,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                color:
                                                    ColorConstants.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 300.w,
                                    padding:
                                        EdgeInsets.only(left: 10.h, right: 7.h),
                                    child: Text(
                                      "18% GST",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          color: ColorConstants.colorPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: 300.w,
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 7.h),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                        ),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          autocorrect: true,
                                          onChanged: (val) {
                                            setState(() {
                                              widget
                                                  .productUserModel
                                                  .productMeasurementCalculations[
                                                      index]
                                                  .calculation
                                                  .gst = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            prefixText: "Rs.",
                                            hintText: '',
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                  color: ColorConstants
                                                      .colorBlack12,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                color:
                                                    ColorConstants.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 300.w,
                                    padding:
                                        EdgeInsets.only(left: 10.h, right: 7.h),
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          color: ColorConstants.colorPrimary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: 300.w,
                                      padding: EdgeInsets.only(
                                          left: 7.h, right: 7.h),
                                      child: Card(
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.h),
                                        ),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          autocorrect: true,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                '${int.parse(widget.productUserModel.productMeasurementCalculations[index].calculation.quantity.isEmpty ? '1' : widget.productUserModel.productMeasurementCalculations[index].calculation.quantity) * int.parse(widget.productUserModel.productMeasurementCalculations[index].product.mainPrice) + int.parse(widget.productUserModel.productMeasurementCalculations[index].calculation.additionalDiscount?.isEmpty ?? true ? '0' : widget.productUserModel.productMeasurementCalculations[index].calculation.additionalDiscount ?? '0') + int.parse(widget.productUserModel.productMeasurementCalculations[index].calculation.gst?.isEmpty ?? true ? '0' : widget.productUserModel.productMeasurementCalculations[index].calculation.gst ?? '0')}',
                                            prefixText: "Rs.",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                  color: ColorConstants
                                                      .colorBlack12,
                                                  width: 1),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.h)),
                                              borderSide: const BorderSide(
                                                color:
                                                    ColorConstants.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]);
          },
        ));
  }
}

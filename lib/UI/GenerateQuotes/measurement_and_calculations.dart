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
  Unit heightUnit = Unit.INCH;
  double sliderHeight = 0;
  double sliderWidth = 0;
  Unit widthUnit = Unit.INCH;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.colorPrimary,
          elevation: 0,
          title: const Text('Measurement and Calculations'),
        ),
        body: ListView.builder(
          itemCount: widget.productUserModel.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
                title: Text(widget.productUserModel.products[index].product),
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
                                        // DropdownButton(
                                        //   iconEnabledColor:
                                        //       ColorConstants.colorPrimary,
                                        //   value: thickness ?? 32,
                                        //   items: GeneralQuoteService.thicknesses
                                        //       .map((int item) {
                                        //     return DropdownMenuItem<int>(
                                        //       value: item,
                                        //       child: Text("$item mm",
                                        //           style: TextStyle(
                                        //             fontFamily: 'PoppinsMedium',
                                        //             fontSize: 16.sp,
                                        //           )),
                                        //     );
                                        //   }).toList(),
                                        //   onChanged: (int? value) {
                                        //     setState(() {
                                        //       thickness = value;
                                        //     });
                                        //   },
                                        // ),
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
                                          value: sliderHeight,
                                          min: 0,
                                          max: heightUnit == Unit.INCH
                                              ? 96
                                              : 2440,
                                          divisions: heightUnit == Unit.INCH
                                              ? 96
                                              : 2440,
                                          label:
                                              '${sliderHeight.round()} ${heightUnit.name.toString().toLowerCase()}',
                                          activeColor:
                                              ColorConstants.colorPrimary,
                                          inactiveColor:
                                              ColorConstants.colorBlack12,
                                          onChanged: (double value) {
                                            setState(() {
                                              sliderHeight = value;
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
                                                  "${sliderHeight.toStringAsFixed(0)}${heightUnit == Unit.INCH ? ' " ' : '.'}",
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
                                                    hintText:
                                                        heightUnit == Unit.INCH
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
                                                heightUnit == Unit.INCH
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
                                            value: heightUnit,
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
                                                sliderHeight = 0;
                                                heightUnit = value!;
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
                                          value: sliderWidth,
                                          min: 0,
                                          max: widthUnit == Unit.INCH
                                              ? 48
                                              : 1220,
                                          divisions: widthUnit == Unit.INCH
                                              ? 48
                                              : 1220,
                                          label:
                                              '${sliderWidth.round()} ${widthUnit.name.toString().toLowerCase()}',
                                          activeColor:
                                              ColorConstants.colorPrimary,
                                          inactiveColor:
                                              ColorConstants.colorBlack12,
                                          onChanged: (double value) {
                                            setState(() {
                                              sliderWidth = value;
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
                                                  "${sliderWidth.toStringAsFixed(0)}${widthUnit == Unit.INCH ? ' " ' : '.'}",
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
                                                    hintText:
                                                        widthUnit == Unit.INCH
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
                                                widthUnit == Unit.INCH
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
                                            value: widthUnit,
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
                                                sliderWidth = 0;
                                                widthUnit = value!;
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
                                  Container(
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
                                        child: TextField(
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
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          autocorrect: true,
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
                                            hintText: '',
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

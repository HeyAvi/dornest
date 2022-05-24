import 'dart:io';

import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/GenerateQuotes/calculate_general_quote.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GenerateQuote extends StatefulWidget {
  @override
  _GenerateQuoteState createState() => _GenerateQuoteState();
}

class _GenerateQuoteState extends State<GenerateQuote> {
  List<String> tagList = List.empty(growable: true);
  int _selectedIndex = 0;
  int designCode = 0;
  int thickness = 32;
  double height = 0;
  double width = 0;
  double sliderHeight = 0;
  double sliderWidth = 0;
  TextEditingController precisionHeightController = TextEditingController();
  TextEditingController precisionWidthController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController(text: "1");
  TextEditingController totalController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  Unit heightUnit = Unit.INCH;
  Unit widthUnit = Unit.INCH;
  int price = 404;

  @override
  void initState() {
    super.initState();
    tagList.add("Design Code");
    tagList.add("Measurement ");
    tagList.add("Calculations");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstants.colorWhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: Container(
            width: MediaQuery.of(context).size.width.w,
            height: 45.h,
            color: ColorConstants.colorPrimary,
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    width: 30.w,
                    height: 17.h,
                    color: ColorConstants.colorWhite,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Generate Quote',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.colorWhite,
                      fontSize: 17.sp),
                ),
              ],
            ),
          )),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 20.h, bottom: 10.h),
            child: Container(
                height: 23.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Container(
                          height: 23.h,
                          padding: EdgeInsets.only(
                              top: 3.h, bottom: 3.h, left: 10.w, right: 10.w),
                          decoration: BoxDecoration(
                              color: (_selectedIndex == index)
                                  ? ColorConstants.colorPrimary
                                  : ColorConstants.colorBlack,
                              borderRadius: BorderRadius.circular(5.h)),
                          child: Center(
                            child: Text(
                              tagList[index],
                              style: TextStyle(
                                  fontFamily: 'PoppinsMedium',
                                  color: Colors.white,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width.w,
            height: 1.h,
            color: ColorConstants.colorBlack12,
          ),
          Expanded(child: quotesView(context))
        ],
      )),
    ));
  }

  Widget quotesView(BuildContext context) {
    if (_selectedIndex == 0) {
      return designView(context);
    } else if (_selectedIndex == 1) {
      return measurementView(context);
    } else if (_selectedIndex == 2) {
      return calculation(context);
    } else {
      return Text("");
    }
  }

  Widget designView(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: GeneralQuoteService.designCodes.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<int> designCodes =
                GeneralQuoteService.designCodes.keys.toList();
            List<String> designCodeName =
                GeneralQuoteService.designCodes.values.toList();
            return InkWell(
              onTap: () {
                setState(() {
                  designCode = designCodes[index];
                  _selectedIndex = 1;
                });
              },
              child: Container(
                color: (index % 2 != 0)
                    ? ColorConstants.colorTile
                    : ColorConstants.colorWhite,
                padding: EdgeInsets.only(left: 50.h, top: 10.h, bottom: 10.h),
                child: Text(
                  designCodes[index].toString() + " - " + designCodeName[index],
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      color: ColorConstants.colorBlack,
                      fontSize: 15.sp),
                ),
              ),
            );
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          child: Container(
              width: MediaQuery.of(context).size.width.w,
              padding: EdgeInsets.all(7.h),
              child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                  child: TextField(
                    autocorrect: true,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'SPECIFICATION',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
                        ),
                      ),
                    ),
                  ))),
        ),
        Row(
          children: [
            SizedBox(
              width: 25.w,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    color: ColorConstants.colorPrimary,
                    borderRadius: BorderRadius.circular(5.h)),
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: Colors.white,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 25.w,
            ),
          ],
        ),
      ],
    );
  }

  Widget measurementView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          thicknessView(context),
          SizedBox(
            height: 20.h,
          ),
          heightView(context),
          SizedBox(
            height: 20.h,
          ),
          widthView(context),
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  int _h1 = sliderHeight.toInt();
                  int _w1 = sliderWidth.toInt();
                  int h2 = int.parse(
                      precisionHeightController.value.text.isEmpty
                          ? "0"
                          : precisionHeightController.value.text);
                  int w2 = int.parse(precisionWidthController.value.text.isEmpty
                      ? "0"
                      : precisionWidthController.value.text);
                  setState(() {
                    height =
                        GeneralQuoteService().calcQuantity(_h1, h2, heightUnit);
                    width =
                        GeneralQuoteService().calcQuantity(_w1, w2, widthUnit);
                    _selectedIndex = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      color: ColorConstants.colorPrimary,
                      borderRadius: BorderRadius.circular(5.h)),
                  child: Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          color: Colors.white,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
              )),
              SizedBox(
                width: 25.w,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget thicknessView(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h),
        side: BorderSide(color: ColorConstants.colorPrimary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300.w,
          padding: EdgeInsets.only(left: 10.h, right: 7.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Thickness : ",
                style: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    color: ColorConstants.colorPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                iconEnabledColor: ColorConstants.colorPrimary,
                value: thickness,
                items: GeneralQuoteService.thicknesses.map((int items) {
                  return DropdownMenuItem<int>(
                    value: items,
                    child: Text("${items} mm",
                        style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 16.sp,
                        )),
                  );
                }).toList(),
                onChanged: (int? value) {
                  setState(() {
                    thickness = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heightView(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h),
        side: BorderSide(color: ColorConstants.colorPrimary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
              child: Text(
                "Height ",
                style: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    color: ColorConstants.colorPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 0.h, right: 7.h),
              child: Slider(
                value: sliderHeight,
                min: 0,
                max: heightUnit == Unit.INCH ? 48 : 1220,
                divisions: heightUnit == Unit.INCH ? 48 : 1220,
                label:
                    '${sliderHeight.round()} ${heightUnit.name.toString().toLowerCase()}',
                activeColor: ColorConstants.colorPrimary,
                inactiveColor: ColorConstants.colorBlack12,
                onChanged: (double value) {
                  setState(() {
                    sliderHeight = value;
                  });
                },
              ),
            ),
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 7.h, right: 7.h),
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                        "${sliderHeight.toStringAsFixed(0)}${heightUnit == Unit.INCH ? ' " ' : '.'}",
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            color: ColorConstants.colorPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: TextField(
                        maxLines: 1,
                        controller: precisionHeightController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            color: ColorConstants.colorPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: heightUnit == Unit.INCH ? '0' : '00',
                          hintStyle: TextStyle(
                              fontFamily: 'PoppinsMedium',
                              color: ColorConstants.colorPrimary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      heightUnit == Unit.INCH ? 'soot ' : '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          color: ColorConstants.colorPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
                trailing: DropdownButton<Unit>(
                  iconEnabledColor: ColorConstants.colorPrimary,
                  value: heightUnit,
                  items: Unit.values.map(
                    (Unit items) {
                      return DropdownMenuItem<Unit>(
                        value: items,
                        child: Text(items.name,
                            style: TextStyle(
                              fontFamily: 'PoppinsMedium',
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
    );
  }

  Widget widthView(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.h),
        side: BorderSide(color: ColorConstants.colorPrimary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
              child: Text(
                "Width ",
                style: TextStyle(
                    fontFamily: 'PoppinsMedium',
                    color: ColorConstants.colorPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 0.h, right: 7.h),
              child: Slider(
                value: sliderWidth,
                min: 0,
                max: widthUnit == Unit.INCH ? 96 : 2440,
                divisions: widthUnit == Unit.INCH ? 96 : 2440,
                label:
                    '${sliderWidth.round()} ${widthUnit.name.toString().toLowerCase()}',
                activeColor: ColorConstants.colorPrimary,
                inactiveColor: ColorConstants.colorBlack12,
                onChanged: (double value) {
                  setState(() {
                    sliderWidth = value;
                  });
                },
              ),
            ),
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 7.h, right: 7.h),
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                        "${sliderWidth.toStringAsFixed(0)}${widthUnit == Unit.INCH ? ' " ' : '.'}",
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            color: ColorConstants.colorPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: TextField(
                        maxLines: 1,
                        controller: precisionWidthController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            color: ColorConstants.colorPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: widthUnit == Unit.INCH ? '0' : '00',
                          hintStyle: TextStyle(
                              fontFamily: 'PoppinsMedium',
                              color: ColorConstants.colorPrimary,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      widthUnit == Unit.INCH ? 'soot ' : '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          color: ColorConstants.colorPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
                trailing: DropdownButton<Unit>(
                  iconEnabledColor: ColorConstants.colorPrimary,
                  value: widthUnit,
                  items: Unit.values.map(
                    (Unit items) {
                      return DropdownMenuItem<Unit>(
                        value: items,
                        child: Text(items.name,
                            style: TextStyle(
                              fontFamily: 'PoppinsMedium',
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
    );
  }

  void calc() {
    price =
        GeneralQuoteService.calculate(designCode, thickness, height, width) ??
            404;
    priceController = TextEditingController(text: price.toString());
    int quantity = quantityController.text.isNotEmpty
        ? int.parse(quantityController.text)
        : 1;
    int tprice = price * quantity;
    double gstPrice = tprice * 0.18;
    double discount = discountController.text.isNotEmpty
        ? double.parse(discountController.text)
        : 0;
    double discountPrice = tprice * (discount / 100);
    double totalPrice = tprice - discountPrice + gstPrice;
    taxController = TextEditingController(text: gstPrice.toString());
    totalController = TextEditingController(text: totalPrice.toString());
  }

  Widget calculation(BuildContext context) {
    calc();
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 30.h,
            ),
            Container(
              width: 150.w,
              height: 30.h,
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                  color: ColorConstants.colorPrimary,
                  borderRadius: BorderRadius.circular(5.h)),
              child: Center(
                child: Text(
                  "Calculations",
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      color: Colors.white,
                      fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
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
                padding: EdgeInsets.only(left: 7.h, right: 7.h),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: TextField(
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    controller: quantityController,
                    onChanged: (String value) {
                      calc();
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
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
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
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
                padding: EdgeInsets.only(left: 7.h, right: 7.h),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    enabled: false,
                    controller: priceController,
                    onChanged: (String value) {
                      calc();
                    },
                    decoration: InputDecoration(
                      prefixText: "Rs.",
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
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
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
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
                padding: EdgeInsets.only(left: 7.h, right: 7.h),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: TextField(
                    controller: discountController,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    onChanged: (String value) {
                      calc();
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      suffixText: "%",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
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
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
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
                padding: EdgeInsets.only(left: 7.h, right: 7.h),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: TextField(
                    controller: taxController,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    onChanged: (String value) {
                      calc();
                    },
                    decoration: InputDecoration(
                      prefixText: "Rs.",
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
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
              padding: EdgeInsets.only(left: 10.h, right: 7.h),
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
                padding: EdgeInsets.only(left: 7.h, right: 7.h),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                  child: TextField(
                    controller: totalController,
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: '',
                      prefixText: "Rs.",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                            color: ColorConstants.colorBlack12, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        borderSide: BorderSide(
                          color: ColorConstants.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                        color: ColorConstants.colorPrimary,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            color: Colors.white,
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () async {
                File file = await createPdf(); // Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPageView(file: file),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    color: ColorConstants.colorPrimary,
                    borderRadius: BorderRadius.circular(5.h)),
                child: Center(
                  child: Text(
                    "Get PDF",
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: Colors.white,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 30.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }

  Future<File> createPdf() async {
    final PdfDocument document = PdfDocument();
    var bounds = Rect.fromLTWH(10, 10, 300, 50);
    document.pages.add();
    PdfPage page = document.pages[0];
    page.graphics.drawString('Invoice\n',
        PdfStandardFont(PdfFontFamily.helvetica, 30, style: PdfFontStyle.bold),
        brush: PdfBrushes.black, bounds: bounds);
    String heightText, widthText, discountText;
    if (heightUnit == Unit.INCH)
      heightText =
          "${sliderHeight.truncate()} inch ${precisionHeightController.text} soot";
    else
      heightText =
          "${sliderHeight.truncate()}.${precisionHeightController.text} mm";

    if (widthUnit == Unit.INCH)
      widthText =
          "${sliderWidth.truncate()} inch ${precisionWidthController.text} soot";
    else
      widthText =
          "${sliderWidth.truncate()}.${precisionWidthController.text} mm";

    if (discountController.text.isNotEmpty)
      discountText = "${discountController.text} %";
    else
      discountText = "";

    PdfUnorderedList(
            items: PdfListItemCollection(<String>[
              'Design Code\t:\t $designCode',
              'Design Name\t:\t ${GeneralQuoteService.designCodes[designCode]}',
              'Thickness\t:\t $thickness mm',
              'Height\t:\t $heightText',
              'Width\t:\t $widthText',
              'Quantity\t:\t ${quantityController.text}',
              'Price\t:\t Rs. ${priceController.text}',
              discountText.isNotEmpty
                  ? 'Discount\t:\t ${discountController.text} ${discountController.text.isEmpty ? "" : "%"}'
                  : '',
              'Tax\t:\t Rs. ${taxController.text}',
              'Total\t:\t Rs. ${totalController.text}',
            ]),
            marker: PdfUnorderedMarker(style: PdfUnorderedMarkerStyle.none),
            font: PdfStandardFont(
              PdfFontFamily.helvetica,
              20,
            ),
            indent: 20,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: page, bounds: Rect.fromLTWH(0, 80, 0, 0));
// Save the document.
    Directory temp = await getTemporaryDirectory();
    File f =
        await File(temp.path + "/invoice.pdf").writeAsBytes(document.save());

// Dispose the document.
    document.dispose();
    return f;
  }
}

class PdfPageView extends StatelessWidget {
  const PdfPageView({
    Key? key,
    required this.file,
  }) : super(key: key);

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: Container(
            width: MediaQuery.of(context).size.width.w,
            height: 45.h,
            color: ColorConstants.colorPrimary,
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    width: 30.w,
                    height: 17.h,
                    color: ColorConstants.colorWhite,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Invoice PDF',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.colorWhite,
                      fontSize: 17.sp),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SfPdfViewer.file(file)),
            MaterialButton(
              onPressed: () async {
                final params = SaveFileDialogParams(
                  sourceFilePath: file.path,
                  fileName: 'invoice.pdf',
                  mimeTypesFilter: [
                    'application/pdf',
                  ],
                );
                final filePath =
                    await FlutterFileDialog.saveFile(params: params);
                if (filePath != null) {
                  //show snackbar
                  final snackBar = SnackBar(
                    content: Text('File saved to $filePath'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => HomePage()));
                }
              },
              minWidth: double.infinity,
              padding: EdgeInsets.only(
                  top: 10.h, bottom: 20.h, left: 20.w, right: 20.w),
              child: Text("Save",
                  style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      color: Colors.white,
                      fontSize: 15.sp)),
              color: ColorConstants.colorPrimary,
            )
          ],
        ),
      ),
    );
  }
}

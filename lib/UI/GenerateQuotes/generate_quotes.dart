import 'dart:core';
import 'dart:core';

import 'package:dornest/UI/GenerateQuotes/measurement_and_calculations.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calculate_general_quote.dart';

class GeneratesQuotes extends StatefulWidget {
  const GeneratesQuotes({Key? key}) : super(key: key);

  @override
  State<GeneratesQuotes> createState() => _GeneratesQuotesState();
}

class _GeneratesQuotesState extends State<GeneratesQuotes> {

  List<String> _designCodes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.colorPrimary,
        elevation: 0,
        title: const Text('Generate Quotes'),
      ),
      body: ListView.builder(
        itemCount: GeneralQuoteService.designCodes.length,
        itemBuilder: (BuildContext context, int index) {
          List<int> designCodes = GeneralQuoteService.designCodes.keys.toList();
          List<String> designCodeName =
              GeneralQuoteService.designCodes.values.toList();
          bool isSelected = _designCodes.contains(designCodeName[index]);
          return InkWell(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _designCodes.remove(designCodeName[index]);
                } else {
                  _designCodes.add(designCodeName[index]);
                }
              });
            },
            child: Container(
              color: (index % 2 != 0)
                  ? ColorConstants.colorTile
                  : ColorConstants.colorWhite,
              padding: EdgeInsets.only(left: 10.h, top: 10.h, bottom: 10.h),
              child: Row(
                children: [
                  Checkbox(

                      activeColor: ColorConstants.colorPrimary,
                      value: isSelected, onChanged: (onChanged) {
                    setState(() {
                      if (isSelected) {
                        _designCodes.remove(designCodeName[index]);
                      } else {
                        _designCodes.add(designCodeName[index]);
                      }
                    });
                  }),
                  Text(
                    designCodes[index].toString() +
                        " - " +
                        designCodeName[index],
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: ColorConstants.colorBlack,
                        fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.colorPrimary,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            elevation: 0.0,
          ),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeasurementAndCalculations(
                    designCodes: _designCodes,
                  ),
                ),
              );
            });
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

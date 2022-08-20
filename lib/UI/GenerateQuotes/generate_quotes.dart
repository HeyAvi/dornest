import 'dart:convert';
import 'dart:core';

import 'package:dornest/UI/GenerateQuotes/measurement_and_calculations.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/models/enq_user.dart';
import 'package:dornest/models/product_user_enq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apis/api.dart';
import '../../models/product_model.dart';

class GeneratesQuotes extends StatefulWidget {
  final EnquiryUser enquiryUser;
  final List<String> productIds;

  const GeneratesQuotes(
      {Key? key, required this.enquiryUser, required this.productIds})
      : super(key: key);

  @override
  State<GeneratesQuotes> createState() => _GeneratesQuotesState();
}

class _GeneratesQuotesState extends State<GeneratesQuotes> {
  final List<Product> _designCodes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.colorPrimary,
        elevation: 0,
        title: const Text('Generate Quotes'),
      ),
      body: FutureBuilder(
          future: API.getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            Map mapData = jsonDecode(snapshot.data);
            List dataList = mapData['0'];
            List<Product> products = [];

            for (var data in dataList) {
              products.add(Product.fromJson(data));
            }
            products.sort((a, b) => a.productId.compareTo(b.productId));
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = false;
                for (var element in _designCodes) {
                  if (element.productId == products[index].productId) {
                    isSelected = true;
                    break;
                  }
                }
                return InkWell(
                  onTap: () {
                    if (isSelected) {
                      for (var element in _designCodes) {
                        if (element.productId == products[index].productId) {
                          setState(() {
                            _designCodes.remove(element);
                          });
                          break;
                        }
                      }
                    } else {
                      setState(() {
                        _designCodes.add(products[index]);
                      });
                    }
                  },
                  child: Container(
                    color: (index % 2 != 0)
                        ? ColorConstants.colorTile
                        : ColorConstants.colorWhite,
                    padding:
                        EdgeInsets.only(left: 10.h, top: 10.h, bottom: 10.h),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: ColorConstants.colorPrimary,
                            value: isSelected,
                            onChanged: (onChanged) {
                              if (isSelected) {
                                for (var element in _designCodes) {
                                  if (element.productId ==
                                      products[index].productId) {
                                    setState(() {
                                      _designCodes.remove(element);
                                    });
                                    break;
                                  }
                                }
                              } else {
                                setState(() {
                                  _designCodes.add(products[index]);
                                });
                              }
                            }),
                        Text(
                          products[index].productId +
                              " - " +
                              products[index].product,
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
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.colorPrimary,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            elevation: 0.0,
          ),
          onPressed: () {
            ProductUserModel productUserModel = ProductUserModel(
              enquiryUser: widget.enquiryUser,
              products: _designCodes,
            );
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeasurementAndCalculations(
                    productUserModel: productUserModel,
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

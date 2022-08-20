import 'dart:convert';
import 'dart:core';

import 'package:dornest/UI/GenerateQuotes/generate_quotes.dart';
import 'package:dornest/UI/GenerateQuotes/measurement_and_calculations.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/assigned_enq.dart';
import 'package:dornest/models/enq_user.dart';
import 'package:dornest/models/product_user_enq.dart';
import 'package:dornest/models/user_model.dart';
import 'package:dornest/shared_prefs_enum/shared_pref_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/product_model.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  void initState() {
    super.initState();
    _getSharedPrefs();
  }

  _getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? userData = prefs.getString(SharedPrefEnum.userData.name);
      if (userData != null) {
        User userA = User.fromJson(jsonDecode(userData));
        user = userA;
      }
    });
  }

  User? user;

  @override
  Widget build(BuildContext context) {
    return user == null ? const GuestUsers() : const AllEnquiries();
  }
}

class AllEnquiries extends StatefulWidget {
  const AllEnquiries({Key? key}) : super(key: key);

  @override
  State<AllEnquiries> createState() => _GeneratesQuotesState();
}

class _GeneratesQuotesState extends State<AllEnquiries> {
  final List<Product> enquiriesProduct = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.colorPrimary,
        elevation: 0,
        title: const Text('Assigned Enquiries'),
      ),
      body: FutureBuilder(
          future: API.getAssignedEnquiries(userId: '1'),
          // todo user id default here
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            Map data = jsonDecode(snapshot.data);
            List dataList = data['0'];
            if (dataList.isEmpty) {
              return const Center(
                child: Text('No Enquires'),
              );
            }
            List<AssignedEnquiry> assignedEnq = [];
            for (var enqData in dataList) {
              assignedEnq.add(AssignedEnquiry.fromJson(enqData));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: assignedEnq.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: API.getEnquiriesDetails(
                      enquiryId: assignedEnq[index].enquireId),
                  // todo enquiry id default here
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    Map map = jsonDecode(snapshot.data);
                    EnquiryUser enquiryUser = EnquiryUser.fromJson(map['0']);
                    List<String> productIds = enquiryUser.pid.split(',');
                    return ExpansionTile(
                      title: Text(
                        'Quotation ${index + 1}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.colorPrimary),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name- ' + enquiryUser.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Email- ' + enquiryUser.email,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Mobile- ' + enquiryUser.mobile,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  ),
                                  Text(
                                    'Location- ' + enquiryUser.location,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GeneratesQuotes(
                                        enquiryUser: enquiryUser,
                                        productIds: productIds,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Get Quotation'),
                                style: ElevatedButton.styleFrom(
                                    primary: ColorConstants.colorPrimary,
                                    elevation: 0),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productIds.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FutureBuilder(
                              future: API.getProducts(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.data == null) {
                                  return const SizedBox.shrink();
                                }
                                Map mapData = jsonDecode(snapshot.data);
                                List dataList = mapData['0'];
                                List<Product> products = [];
                                for (var data in dataList) {
                                  if (data['product_id'] == productIds[index]) {
                                    products.add(Product.fromJson(data));
                                  }
                                }
                                enquiriesProduct.addAll(products);
                                if (products.isEmpty) {
                                  return const Center(
                                    child: Text('No Products Found'),
                                  );
                                }
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      color: (index % 2 != 0)
                                          ? ColorConstants.colorTile
                                          : ColorConstants.colorWhite,
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      padding: EdgeInsets.only(
                                          left: 10.h, top: 10.h, bottom: 10.h),
                                      child: Text(
                                        products[index].productId +
                                            ' - ' +
                                            products[index].product,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'PoppinsMedium',
                                            color: ColorConstants.colorBlack,
                                            fontSize: 15.sp),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        )
                      ],
                    );
                  },
                );
              },
            );
          }),
    );
  }
}

class GuestUsers extends StatefulWidget {
  const GuestUsers({Key? key}) : super(key: key);

  @override
  _GuestUsersState createState() => _GuestUsersState();
}

class _GuestUsersState extends State<GuestUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.colorWhite,
        body: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h, right: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back_arrow.png',
                      width: 30.w,
                      height: 17.h,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: buttonStyleOne("Customer Services", context),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Text(
                      "Quick Help/Support Systems",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'RoMedium',
                          color: ColorConstants.colorBlack87,
                          fontSize: 15.sp),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Container(
                      height: MediaQuery.of(context).size.height.h / 2.5.h,
                      width: MediaQuery.of(context).size.width.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.colorGrey,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_email,
                                  size: 25.sp,
                                  color: ColorConstants.colorPrimary,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Email/Call",
                                  style: TextStyle(
                                      color: ColorConstants.colorPrimary,
                                      fontFamily: 'RoMedium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "In case of any query,",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Please contact us to below details",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Email will be sent to:",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Customer_Dornest@.com",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "OR",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "18001003070",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "(9 AM TO 9 PM)",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                )),
              )
            ],
          ),
        )));
  }
}

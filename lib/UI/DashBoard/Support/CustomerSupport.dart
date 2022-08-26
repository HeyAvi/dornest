import 'dart:convert';
import 'dart:core';

import 'package:dornest/UI/DashBoard/Support/customer_support_tab/my_enquiries_tab.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/models/user_model.dart';
import 'package:dornest/shared_prefs_enum/shared_pref_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_support_tab/assigned_enquiries.dart';

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
      mobile = prefs.getString(SharedPrefEnum.guestMobile.name);
    });
  }

  User? user;
  String? mobile;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.colorPrimary,
          elevation: 0,
          title: const Text('Enquiries'),
          bottom: TabBar(indicatorColor: ColorConstants.colorBackground, tabs: [
            Tab(
              text: user == null ? 'Customer Support' : 'Assigned Enquiries',
            ),
            const Tab(
              text: 'My Enquiries',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            user == null
                ? const GuestUsers()
                : AllEnquiries(
                    user: user!,
                  ),
            MyEnquiriesTab(
              user: user,
              mobile: mobile,
            )
          ],
        ),
      ),
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

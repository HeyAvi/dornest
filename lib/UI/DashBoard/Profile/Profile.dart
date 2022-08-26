import 'dart:convert';

import 'package:dornest/UI/Authentication/ChangePassword.dart';
import 'package:dornest/UI/DashBoard/AboutUs/AboutUs.dart';
import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/DashBoard/Orders/MyOrder.dart';
import 'package:dornest/UI/DashBoard/Profile/EditProfile.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/models/user_model.dart';
import 'package:dornest/shared_prefs_enum/shared_pref_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.colorWhite,
        body: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.only(left: 0.w, top: 5.h, bottom: 0.h, right: 0.h),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, top: 5.h, bottom: 20.h, right: 15.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 2.w,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/back_arrow.png',
                                          width: 30.w,
                                          height: 17.h,
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CircleAvatar(
                                  radius: (25),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                        "assets/images/profileuser.png"),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${user?.name ?? "Guest"}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'RoMedium',
                                            color: ColorConstants.colorPrimary,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${user?.mobile ?? mobile ?? "Guest"}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'RoMedium',
                                            color: ColorConstants.colorBlack45,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // todo send user data to edit profile
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfile()));
                                    },
                                    child: Text(
                                      " EDIT ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorRed,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                " ${user?.email ?? "Guest"} ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'RoMedium',
                                    color: ColorConstants.colorGrey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40.w,
                              ),
                              Text(
                                // 'Show Dealer', // 1
                                // 'Operation Manager', //3
                                // 'Sales Person', // 6
                                "${user?.role == '1' ? 'Dealer' : user?.role == '3' ? 'Operation Manager' : user?.role == '6' ? 'Sales' : ''} ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'RoMedium',
                                    color: ColorConstants.colorPrimary,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40.w,
                              ),
                              Text(
                                "Promotion Details , About Us , Orders",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'RoMedium',
                                    color: ColorConstants.colorBlack12,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 1.h,
                        width: MediaQuery.of(context).size.width.w,
                        color: ColorConstants.colorGrey,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (Context) => AboutUs()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 20.h,
                                      bottom: 5.h,
                                      right: 20.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/aboutus.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            "About Us",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: 'RoMedium',
                                              color:
                                                  ColorConstants.colorBlack87,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      )),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.colorBlack87,
                                        size: 17.sp,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 20.h,
                                  bottom: 5.h,
                                  right: 20.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/refund_policy.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 17.w,
                                      ),
                                      Text(
                                        "Refund Policy",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorBlack87,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorConstants.colorBlack87,
                                    size: 17.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (Context) => MyOrder()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 20.h,
                                      bottom: 5.h,
                                      right: 20.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/myorders.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            "My Orders",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: 'RoMedium',
                                              color:
                                                  ColorConstants.colorBlack87,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      )),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.colorBlack87,
                                        size: 17.sp,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 20.h,
                                  bottom: 5.h,
                                  right: 20.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/promotion_details.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Promotion Details",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorBlack87,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorConstants.colorBlack87,
                                    size: 17.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (Context) =>
                                              ChangePassword()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 20.h,
                                      bottom: 5.h,
                                      right: 20.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/change_password.png',
                                            width: 25.w,
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            "Change Password",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: 'RoMedium',
                                              color:
                                                  ColorConstants.colorBlack87,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      )),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorConstants.colorBlack87,
                                        size: 17.sp,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 20.h,
                                  bottom: 5.h,
                                  right: 20.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/terms_and_conditions.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Terms And Conditions",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorBlack87,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorConstants.colorBlack87,
                                    size: 17.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 20.h,
                                  bottom: 5.h,
                                  right: 20.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/privacy_policy.png',
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        "Privacy Policy",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorBlack87,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorConstants.colorBlack87,
                                    size: 17.sp,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 0.w, top: 20.h, bottom: 0.h, right: 0.h),
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: Container(
                      height: 70.h,
                      color: ColorConstants.colorPrimary,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                        child: Container(
                          color: ColorConstants.colorWhite,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.w,
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Text(
                                    "LOG OUT",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'RoMedium',
                                        color: ColorConstants.colorBlack87,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                              Icon(
                                Icons.logout,
                                color: ColorConstants.colorBlack87,
                                size: 25.sp,
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        )));
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  User? user;
  String? mobile;

  void getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString(SharedPrefEnum.guestMobile.name);
    if (prefs.getString(SharedPrefEnum.userData.name) == null) {
      setState(() {});
      return;
    }
    if (mounted) {
      setState(() {
        user = User.fromJson(
            jsonDecode(prefs.getString(SharedPrefEnum.userData.name)!));

        print('here ${user?.name}');
      });
    }
  }
}

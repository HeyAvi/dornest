import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/DashBoard/Orders/Orders.dart';
import 'package:dornest/UI/DashBoard/Profile/Profile.dart';
import 'package:dornest/UI/DashBoard/Support/CustomerSupport.dart';
import 'package:dornest/UI/GenerateQuotes/GenerateQuote.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
          color: ColorConstants.colorPrimaryDark,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100.w),
              topRight: Radius.circular(100.w)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 40.w, top: 20.h, right: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/profileuser.png",
                    height: 60.h,
                    width: 60.w,
                  )
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Sales",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => HomePage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/images/home.png",
                      height: 25.h,
                      width: 25.w,
                      color: ColorConstants.colorWhite,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Image.asset(
                    "assets/images/customers.png",
                    height: 25.h,
                    width: 25.w,
                    color: ColorConstants.colorWhite,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Customers",
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => Orders()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/images/orders.png",
                      height: 25.h,
                      width: 25.w,
                      color: ColorConstants.colorWhite,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => Profile()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/images/profile.png",
                      height: 25.h,
                      width: 25.w,
                      color: ColorConstants.colorWhite,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => GenerateQuote()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/images/generatedquotes.png",
                      height: 25.h,
                      width: 25.w,
                      color: ColorConstants.colorWhite,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "Generate Quote",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                color: ColorConstants.colorWhite,
                height: 2.h,
                width: MediaQuery.of(context).size.width.w,
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => CustomerSupport()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Support",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "FAQ",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Image.asset('assets/images/applogo.png', width: 175.w)
                ],
              )
            ],
          ),
        ));
  }
}

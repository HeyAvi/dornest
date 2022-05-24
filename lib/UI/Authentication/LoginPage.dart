import 'package:dornest/UI/Authentication/Registration.dart';
import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.colorWhite,
        body: SafeArea(
            child:Padding(
                padding: EdgeInsets.only(left: 20.w,top: 20.h,bottom: 20.h,right: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.w,),
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.colorPrimary,
                                fontSize: 17.sp
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Image.asset('assets/images/applogo.png', width: 250.w),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w,),
                          Expanded(
                            child: TextField(
                            keyboardType: TextInputType.number,
                            //controller:phoneController,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RoBold",
                                  color: ColorConstants.colorBlack26,
                                  fontSize: 16.sp
                              ),
                              contentPadding: EdgeInsets.only(left: 10.w),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RoBold",
                                  color: ColorConstants.colorBlack26,
                                  fontSize: 16.sp
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: ColorConstants.colorBlack45, width: 0.5.h),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                              errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
                            ),
                            onChanged: (value) {

                            },
                          ),
                          ),
                          SizedBox(width: 20.w,),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20.w,),
                          Expanded(child: TextField(
                            keyboardType: TextInputType.number,
                            //controller:phoneController,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RoBold",
                                  color: ColorConstants.colorBlack26,
                                  fontSize: 16.sp
                              ),
                              contentPadding: EdgeInsets.only(left: 10.w),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "RoBold",
                                  color: ColorConstants.colorBlack26,
                                  fontSize: 16.sp
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: ColorConstants.colorBlack45, width: 0.5.h),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                              errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
                            ),
                            onChanged: (value) {

                            },
                          ),),
                          SizedBox(width: 20.w,),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (Context) => HomePage()));
                              },
                              child: buttonStyleOne("Login",context),
                            )
                          ),
                          SizedBox(width: 15.w,),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have open account ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "RoMedium",
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.colorBlack45,
                                fontSize: 14.sp
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (Context) => Registration()));
                            },
                            child: Text(
                              ' Signup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "RoMedium",
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorPrimary,
                                  fontSize: 15.sp
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}














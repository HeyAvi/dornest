import 'dart:convert';

import 'package:dornest/UI/Authentication/Registration.dart';
import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../shared_prefs_enum/shared_pref_enum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailMessage;
  String? _passwordMessage;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.colorWhite,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(
                    left: 20.w, top: 20.h, bottom: 20.h, right: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.colorPrimary,
                                fontSize: 17.sp),
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
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                errorText: _emailMessage,
                                hintText: "Enter Email",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "RoBold",
                                    color: ColorConstants.colorBlack26,
                                    fontSize: 16.sp),
                                contentPadding: EdgeInsets.only(left: 10.w),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "RoBold",
                                    color: ColorConstants.colorBlack26,
                                    fontSize: 16.sp),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstants.colorBlack45,
                                      width: 0.5.h),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                ),
                                //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 12.sp),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                errorText: _passwordMessage,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "RoBold",
                                    color: ColorConstants.colorBlack26,
                                    fontSize: 16.sp),
                                contentPadding: EdgeInsets.only(left: 10.w),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "RoBold",
                                    color: ColorConstants.colorBlack26,
                                    fontSize: 16.sp),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstants.colorBlack45,
                                      width: 0.5.h),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.cyan),
                                ),
                                //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 12.sp),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorConstants.colorPrimary,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          _emailMessage = null;
                                          _passwordMessage = null;
                                        });
                                        if (_emailController.text.isEmpty) {
                                          setState(() {
                                            _emailMessage = "Email is required";
                                          });
                                          return;
                                        } else if (_passwordController
                                            .text.isEmpty) {
                                          setState(() {
                                            _passwordMessage =
                                                "Password is required";
                                          });
                                          return;
                                        }
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        String? response = await API.loginUser(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        Map responseMap = jsonDecode(response ??
                                            '{"status": "error", "message": "Something went wrong", "response" "500"}');
                                        print(responseMap);

                                        if (responseMap["response"] == '404') {
                                          setState(() {
                                            _emailMessage =
                                                "Email or Password doesn't match";
                                          });
                                          return;
                                        } else if (responseMap["response"] ==
                                            '500') {
                                          setState(() {
                                            _emailMessage =
                                                "Something went wrong";
                                          });
                                          return;
                                        }
                                        User b =
                                            User.fromJson(responseMap["0"]);
                                        var prefs = await SharedPreferences
                                            .getInstance();
                                        await prefs.setString(
                                            SharedPrefEnum.userData.name,
                                            jsonEncode(b.toJson()));
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const HomePage()),
                                            (route) => false);
                                      },
                                      child: buttonStyleOne("Login", context),
                                    )),
                          SizedBox(
                            width: 15.w,
                          ),
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
                                fontSize: 14.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Registration()));
                            },
                            child: Text(
                              ' Signup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "RoMedium",
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.colorPrimary,
                                  fontSize: 15.sp),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

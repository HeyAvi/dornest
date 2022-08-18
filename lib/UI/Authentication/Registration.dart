import 'dart:convert';

import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/user_model.dart';
import 'package:dornest/shared_prefs_enum/shared_pref_enum.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? selectedValue;
  List<String> items = [
    'Show Dealer', // 1
    'Operation Manager', //3
    'Sales Person', // 6
  ];

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController pinCodeEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  String? nameError;
  String? emailError;
  String? mobileError;
  String? locationError;
  String? cityError;
  String? pinCodeError;
  String? passwordError;
  String? selectOptionError;
  bool showCompany = false;

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
                          Text(
                            'Registration',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.colorPrimary,
                                fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width.w,
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                              color: ColorConstants.colorWhite,
                              borderRadius: BorderRadius.circular(5.h)),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Text(
                                      selectOptionError ?? 'Select Item',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: selectOptionError == null
                                            ? Colors.white
                                            : Colors.red,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: ColorConstants.colorWhite,
                                      size: 20.sp,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 50,
                                    buttonWidth: 160,
                                    buttonPadding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: ColorConstants.colorPrimary,
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 200,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: ColorConstants.colorPrimary,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: Radius.circular(5.w),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(-20, 0),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CircleAvatar(
                                radius: (52),
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                      "assets/images/profileuser.png"),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              TextField(
                                controller: nameEditingController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  errorText: nameError,
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
                              SizedBox(
                                height: 5.h,
                              ),
                              // company name
                              if (showCompany)
                                TextField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  //controller:phoneController,
                                  decoration: InputDecoration(
                                    hintText: "Company Name",
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
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 12.sp),
                                  ),
                                  onChanged: (value) {},
                                ),
                            ],
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              controller: mobileEditingController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "Phone",
                                errorText: mobileError,

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
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: emailEditingController,
                              decoration: InputDecoration(
                                errorText: emailError,
                                hintText: "Email",
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
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: locationEditingController,
                              decoration: InputDecoration(
                                hintText: "Location",
                                errorText: locationError,
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
                                  borderSide:
                                      const BorderSide(color: Colors.cyan),
                                ),
                                //errorText:  (state.mobileNumber != null && state.mobileNumber.valid) ? null : "Invalid Mobile Number.",
                                errorStyle: TextStyle(
                                    color: Colors.red, fontSize: 12.sp),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: cityEditingController,
                              decoration: InputDecoration(
                                hintText: "City",
                                errorText: cityError,
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
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: pinCodeEditingController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "Pincode",
                                errorText: pinCodeError,
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
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: passwordEditingController,
                              onSubmitted: (v) {
                                submit();
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                errorText: passwordError,
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
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              submit();
                            },
                            child: buttonStyleOne("Submit", context),
                          )),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ))));
  }

  Future<void> submit() async {
    setState(() {
      selectOptionError = null;
      nameError = null;
      mobileError = null;
      emailError = null;
      locationError = null;
      cityError = null;
      pinCodeError = null;
      passwordError = null;
    });
    if (selectedValue == null) {
      setState(() {
        selectOptionError = "*Please select an option";
      });
      return;
    } else if (nameEditingController.text.isEmpty) {
      setState(() {
        nameError = "Name is required";
      });
      return;
    } else if (mobileEditingController.text.isEmpty) {
      setState(() {
        mobileError = "Mobile Number is required";
      });
      return;
    } else if (emailEditingController.text.isEmpty) {
      setState(() {
        emailError = "Email is required";
      });
      return;
    } else if (locationEditingController.text.isEmpty) {
      setState(() {
        locationError = "Address is required";
      });
      return;
    } else if (cityEditingController.text.isEmpty) {
      setState(() {
        cityError = "City is required";
      });
      return;
    } else if (pinCodeEditingController.text.isEmpty) {
      setState(() {
        pinCodeError = "Pincode is required";
      });
      return;
    } else if (passwordEditingController.text.isEmpty) {
      setState(() {
        passwordError = "Password is required";
      });
      return;
    }
    // 'Show Dealer', // 1
    // 'Operation Manager', //3
    // 'Sales Person', // 6

    String role = selectedValue == 'Show Dealer'
        ? '1'
        : selectedValue == 'Operation Manager'
            ? '3'
            : '6';

    User user = User(
        name: nameEditingController.text,
        mobile: mobileEditingController.text,
        email: emailEditingController.text,
        location: locationEditingController.text,
        city: cityEditingController.text,
        pincode: pinCodeEditingController.text,
        createdAt: DateTime.now(),
        password: passwordEditingController.text,
        role: role);
    print('please wait');
    Map dataMap = jsonDecode(await API.userSignUp(user: user) ??
        '{"response":"500","error":"Something went wrong 😖","status":"failure"}');
    print('done---> $dataMap');

    if (dataMap['response'] == '404') {
      setState(() {
        emailError = 'Account already exists';
      });
      return;
    } else if (dataMap['response'] == '500') {
      setState(() {
        emailError = dataMap['error'];
      });
      return;
    }
    // try {
      Map<String, dynamic> userMap = dataMap['0'];
      User b = User.fromJson(userMap);
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          SharedPrefEnum.userData.name, jsonEncode(b.toJson()));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false);
    // } catch (e) {
    //   print(e);
    // }
    print('done---> $dataMap');
  }
}

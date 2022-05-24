import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}


class _RegistrationState extends State<Registration> {


  String? selectedValue = "Show Dealer";
  List<String> items = [
    'Show Dealer',
    'Operation Manager',
    'Sales Person',
  ];


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
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_arrow.png', width: 30.w,height: 17.h,),
                          ),
                          SizedBox(width: 5.w,),
                          Text(
                            'Registration',
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
                        height: 20.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width.w,
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            color: ColorConstants.colorWhite,
                            borderRadius: BorderRadius.circular(5.h)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children:  [
                                      Icon(
                                        Icons.list,
                                        size: 16.sp,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Item',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style:  TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  icon:  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorConstants.colorWhite,
                                    size: 20.sp,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.yellow,
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding:  EdgeInsets.only(left: 10.w, right: 10.w),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: ColorConstants.colorPrimary,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding:  EdgeInsets.only(left: 10.w, right: 10.w),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: ColorConstants.colorPrimary,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius:  Radius.circular(5.w),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CircleAvatar(radius: (52),
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(50),
                                  child: Image.asset("assets/images/profileuser.png"),
                                )
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Expanded(
                              child: Column(
                              children: [
                                 TextField(
                                keyboardType: TextInputType.number,
                                //controller:phoneController,
                                decoration: InputDecoration(
                                  hintText: "Name",
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
                                 SizedBox(
                                   height: 5.h,
                                 ),
                                 TextField(
                                  keyboardType: TextInputType.number,
                                  //controller:phoneController,
                                  decoration: InputDecoration(
                                    hintText: "Company Name",
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
                              ],
                           )),
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "Phone",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "Email",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "Location",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "City",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "Pincode",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              //controller:phoneController,
                              decoration: InputDecoration(
                                hintText: "Password",
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
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (Context) => HomePage()));
                              },
                              child: buttonStyleOne("Submit",context),
                            )
                          ),
                          SizedBox(width: 5.w,),
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














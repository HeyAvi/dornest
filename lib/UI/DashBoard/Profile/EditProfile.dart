import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfile> {


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
                            'Profile',
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
                              color: ColorConstants.colorPrimary,
                              borderRadius: BorderRadius.circular(5.h)
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text(" Sales Person ",textAlign:TextAlign.center,style: TextStyle(
                                  fontFamily: 'RoMedium',
                                  color: Colors.white,
                                  fontSize: 15.sp
                              ),),),
                              Icon(Icons.keyboard_arrow_down_outlined,color: ColorConstants.colorWhite,)
                            ],
                          )
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
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
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(child: TextField(
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
                          ),),
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10.w,),
                          Expanded(child: TextField(
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
                          ),),
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
                                child: buttonStyleOne("SAVE",context),
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














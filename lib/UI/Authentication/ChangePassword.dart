import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChangePassword extends StatefulWidget {


  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}


class _ChangePasswordState extends State<ChangePassword> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.colorWhite,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(120.h),
              child: Container(
                width: MediaQuery.of(context).size.width.w,
                height: 45.h,
                color: ColorConstants.colorPrimary,
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/back_arrow.png', width: 30.w,height: 17.h,color: ColorConstants.colorWhite,),
                    ),
                    SizedBox(width: 5.w,),
                    Text(
                      'Change Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.colorWhite,
                          fontSize: 17.sp
                      ),
                    ),
                  ],
                ),
              )
          ),
          body: SafeArea(
              child:Container(
                color: ColorConstants.colorPrimary,
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height.h,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width.w,
                            color: ColorConstants.colorPrimary,
                            padding: EdgeInsets.all(7.h),
                            child: Card(
                                color: ColorConstants.colorPrimary,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                child:TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: 'Old Password',
                                    hintStyle: TextStyle(color: ColorConstants.colorWhite),
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock_outline,color: ColorConstants.colorWhite,),
                                    fillColor: ColorConstants.colorPrimary,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen,),
                                    ),
                                  ),))
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width.w,
                            color: ColorConstants.colorPrimary,
                            padding: EdgeInsets.all(7.h),
                            child: Card(
                                color: ColorConstants.colorPrimary,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                child:TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: 'New Password',
                                    hintStyle: TextStyle(color: ColorConstants.colorWhite),
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock_outline,color: ColorConstants.colorWhite,),
                                    suffixIcon: Icon(Icons.remove_red_eye_outlined,color: ColorConstants.colorWhite,),
                                    fillColor: ColorConstants.colorPrimary,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen,),
                                    ),
                                  ),))
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width.w,
                            color: ColorConstants.colorPrimary,
                            padding: EdgeInsets.all(7.h),
                            child: Card(
                                color: ColorConstants.colorPrimary,
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                child:TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(color: ColorConstants.colorWhite),
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock_outline,color: ColorConstants.colorWhite,),
                                    suffixIcon: Icon(Icons.remove_red_eye_outlined,color: ColorConstants.colorWhite,),
                                    fillColor: ColorConstants.colorPrimary,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorGreen,),
                                    ),
                                  ),))
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("")),
                            Container(
                              width: 150.w,
                              height: 40.h,
                              padding: EdgeInsets.all(10.h),
                              decoration: BoxDecoration(
                                  color: ColorConstants.colorWhite,
                                  borderRadius: BorderRadius.circular(30.h)
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 20.w,),
                                    Text("DONE",style: TextStyle(
                                        fontFamily: 'RoMedium',
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.colorPrimary,
                                        fontSize: 15.sp
                                    ),),
                                    Container(
                                      width: 50.w,
                                      height: 50.w,
                                      child: Icon(Icons.check, size: 15.sp,),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorConstants.colorGreen,
                                          border: Border.all(width: 2.w, color: ColorConstants.colorPrimary,)
                                      ),
                                    )
                                  ],
                                )
                              ),
                            ),
                            SizedBox(width: 15.w,)
                          ],
                        )
                      ],
                    )
                ),
              )
          ),
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}













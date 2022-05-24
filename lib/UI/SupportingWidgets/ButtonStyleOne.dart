import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget buttonStyleOne(String btnName,BuildContext context){

  return Container(
    padding: EdgeInsets.all(10.h),
    decoration: BoxDecoration(
        color: ColorConstants.colorPrimary,
        borderRadius: BorderRadius.circular(30.h)
    ),
    child: Center(
      child: Text(btnName,style: TextStyle(
          fontFamily: 'PoppinsMedium',
          color: Colors.white,
          fontSize: 15.sp
      ),),
    ),
  );

}
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Notifications extends StatefulWidget {


  @override
  _NotificationsState createState() => _NotificationsState();
}


class _NotificationsState extends State<Notifications> {


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
                      'Notification',
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
              child:Padding(
                padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 10.h),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                              height: 75.h,
                              width: MediaQuery.of(context).size.width.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.colorPrimary ,
                                  width: 1.w ,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Order #",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorGrey,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                    Text("00000030 ",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorPrimary,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                    Text("status has been ",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorGrey,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("changed to",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorGrey,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                    Text(" completed.",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorBlack87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("46 second ago",textAlign:TextAlign.start,style: TextStyle(
                                                        fontFamily: 'RoMedium',
                                                        color: ColorConstants.colorGrey,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15.sp
                                                    ),),
                                                  ],
                                                ),
                                              ],
                                            )
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Icon(Icons.arrow_forward_ios_sharp , color: ColorConstants.colorPrimary, size: 20.sp,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                      );
                    }
                )
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













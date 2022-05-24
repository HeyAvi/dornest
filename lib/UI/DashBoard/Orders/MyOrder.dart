import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyOrder extends StatefulWidget {


  @override
  _MyOrderState createState() => _MyOrderState();
}


class _MyOrderState extends State<MyOrder> {


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
                      'My Order',
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
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Container(
                            height: 130.h,
                            width: MediaQuery.of(context).size.width.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstants.colorBlack12 ,
                                width: 2.w ,
                              ),
                              borderRadius: BorderRadius.circular(15.h),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 5.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Image.asset("assets/images/profileuser.png",height: 35.h,width: 35.w,),
                                               SizedBox(width: 10.w,),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Mohit",textAlign:TextAlign.start,style: TextStyle(
                                                            fontFamily: 'RoMedium',
                                                            color: ColorConstants.colorBlack87,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15.sp
                                                        ),),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Thu,2nd Jul, 12:35 PM",textAlign:TextAlign.start,style: TextStyle(
                                                            fontFamily: 'RoMedium',
                                                            color: ColorConstants.colorBlack87,
                                                            fontSize: 13.sp
                                                        ),),
                                                      ],
                                                    )
                                                  ],
                                                )
                                             ],
                                           ),
                                           SizedBox(
                                             height: 5.h,
                                           ),
                                           Row(
                                             children: [
                                               Expanded(
                                                   child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Text("Order ID",textAlign:TextAlign.start,style: TextStyle(
                                                       fontFamily: 'RoMedium',
                                                       color: ColorConstants.colorBlack87,
                                                       fontSize: 12.sp
                                                   ),),
                                                 ],
                                                )
                                               ),
                                               Text("98765432111111",textAlign:TextAlign.start,style: TextStyle(
                                                   fontFamily: 'RoMedium',
                                                   color: ColorConstants.colorBlack87,
                                                   fontSize: 12.sp
                                               ),),
                                             ],
                                           ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                           Row(
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Qty",textAlign:TextAlign.start,style: TextStyle(
                                                          fontFamily: 'RoMedium',
                                                          color: ColorConstants.colorBlack87,
                                                          fontSize: 12.sp
                                                      ),),
                                                    ],
                                                  )
                                              ),
                                              Text("7",textAlign:TextAlign.start,style: TextStyle(
                                                  fontFamily: 'RoMedium',
                                                  color: ColorConstants.colorBlack87,
                                                  fontSize: 12.sp
                                              ),),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                           Row(
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Order Amount",textAlign:TextAlign.start,style: TextStyle(
                                                          fontFamily: 'RoMedium',
                                                          color: ColorConstants.colorBlack87,
                                                          fontSize: 12.sp
                                                      ),),
                                                    ],
                                                  )
                                              ),
                                              Image.asset("assets/images/rupee.png",height: 10.h,width: 10.w,),
                                              Text("1,060",textAlign:TextAlign.start,style: TextStyle(
                                                  fontFamily: 'RoMedium',
                                                  color: ColorConstants.colorBlack87,
                                                  fontSize: 12.sp
                                              ),),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                           Row(
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Status",textAlign:TextAlign.start,style: TextStyle(
                                                          fontFamily: 'RoMedium',
                                                          color: ColorConstants.colorBlack87,
                                                          fontSize: 12.sp
                                                      ),),
                                                    ],
                                                  )
                                              ),
                                              Text("New",textAlign:TextAlign.start,style: TextStyle(
                                                  fontFamily: 'RoMedium',
                                                  color: ColorConstants.colorGreen,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp
                                              ),),
                                            ],
                                          )
                                        ],
                                      )
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width.w,
                                  height: 2.h,
                                  color: ColorConstants.colorPrimary,
                                ),
                                Container(
                                  height: 20.h,
                                  width: MediaQuery.of(context).size.width.w,
                                  decoration: BoxDecoration(
                                    color: ColorConstants.colorPrimary,
                                    border: Border.all(
                                      color: ColorConstants.colorPrimary ,
                                      width: 2.w ,
                                    ),
                                    borderRadius:  BorderRadius.only(
                                      bottomLeft: Radius.circular(15.h),
                                      bottomRight: Radius.circular(15.h),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("")),
                                      Text("Process Delivered",textAlign:TextAlign.center,style: TextStyle(
                                          fontFamily: 'RoMedium',
                                          color: ColorConstants.colorWhite,
                                          fontSize: 13.sp
                                      ),),
                                      SizedBox(width: 20.w,)
                                    ],
                                  ),
                                )
                              ],
                            ),
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







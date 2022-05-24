import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NearByDealer extends StatefulWidget {


  @override
  _NearByDealerState createState() => _NearByDealerState();
}


class _NearByDealerState extends State<NearByDealer> {


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
                color: ColorConstants.colorWhite,
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/back_arrow.png', width: 30.w,height: 17.h,color: ColorConstants.colorBlack87,),
                    ),
                    SizedBox(width: 5.w,),
                    Text(
                      'Near By Dealer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.colorBlack87,
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
                              height: 100.h,
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
                                      padding: EdgeInsets.only(left: 15.w,right: 15.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset("assets/images/profileuser.png",height: 55.h,width: 55.w,)
                                            ],
                                          ),
                                          SizedBox(width: 10.w,),
                                          Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Yasmin",textAlign:TextAlign.start,style: TextStyle(
                                                          fontFamily: 'RoMedium',
                                                          color: ColorConstants.colorBlack87,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18.sp
                                                      ),),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.location_on,color: Colors.redAccent,size: 22.sp,),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Expanded(child: Text("Address : 409/410, Ashoka Estate Building, Cannaught Palace , New Delhi 110001",textAlign:TextAlign.start,style: TextStyle(
                                                          fontFamily: 'RoMedium',
                                                          color: ColorConstants.colorBlack87,
                                                          fontSize: 12.sp
                                                      ),),)
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ),

                                        ],
                                      ),
                                    )
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width.w,
                                    height: 2.h,
                                    color: ColorConstants.colorBlack12,
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: MediaQuery.of(context).size.width.w,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.colorBackground,
                                      border: Border.all(
                                        color: ColorConstants.colorBackground ,
                                        width: 2.w ,
                                      ),
                                      borderRadius:  BorderRadius.only(
                                        bottomLeft: Radius.circular(15.h),
                                        bottomRight: Radius.circular(15.h),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/company.png",height: 17.h,width: 17.w,),
                                            Text(" STAR MEGA COMPANY",textAlign:TextAlign.center,style: TextStyle(
                                                fontFamily: 'RoMedium',
                                                color: ColorConstants.colorBlack87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp
                                            ),),
                                          ],
                                        ),
                                        Expanded(
                                            flex:1,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/telephone.png",height: 17.h,width: 17.w,),
                                                Text(" +91 9876543210",textAlign:TextAlign.center,style: TextStyle(
                                                    fontFamily: 'RoMedium',
                                                    color: ColorConstants.colorBlack87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp
                                                ),),
                                              ],
                                            )
                                        ),
                                        Expanded(
                                            flex:1,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/images/letters.png",height: 17.h,width: 17.w,),
                                                Text(" yash@gmail.com",textAlign:TextAlign.center,style: TextStyle(
                                                    fontFamily: 'RoMedium',
                                                    color: ColorConstants.colorBlack87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.sp
                                                ),),
                                              ],
                                            )
                                        ),
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













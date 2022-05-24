import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Calculations extends StatefulWidget {
  const Calculations({Key? key}) : super(key: key);

  @override
  _CalculationsState createState() => _CalculationsState();
}


class _CalculationsState extends State<Calculations> {


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
                      'Calculations',
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
                  padding: EdgeInsets.only(left: 20.w,top: 5.h,bottom: 30.h,right: 20.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 150.w,
                            height: 30.h,
                            padding: EdgeInsets.all(5.h),
                            decoration: BoxDecoration(
                                color: ColorConstants.colorPrimary,
                                borderRadius: BorderRadius.circular(5.h)
                            ),
                            child: Center(
                              child: Text("Calculations",style: TextStyle(
                                  fontFamily: 'PoppinsMedium',
                                  color: Colors.white,
                                  fontSize: 12.sp
                              ),),
                            ),
                          ),
                          SizedBox(width: 30.w,),
                        ],
                      ),
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300.w,
                            padding: EdgeInsets.only(left: 10.h,right: 7.h),
                            child: Text("Enter Quantity",style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.only(left: 7.h,right: 7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 300.w,
                            padding: EdgeInsets.only(left: 10.h,right: 7.h),
                            child: Text("Price",style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.only(left: 7.h,right: 7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 300.w,
                            padding: EdgeInsets.only(left: 10.h,right: 7.h),
                            child: Text("Additional Discount",style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.only(left: 7.h,right: 7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 300.w,
                            padding: EdgeInsets.only(left: 10.h,right: 7.h),
                            child: Text("18% GST",style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.only(left: 7.h,right: 7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 300.w,
                            padding: EdgeInsets.only(left: 10.h,right: 7.h),
                            child: Text("Total",style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.only(left: 7.h,right: 7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30.w,),
                              Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (Context) => HomePage()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                          color: ColorConstants.colorPrimary,
                                          borderRadius: BorderRadius.circular(5.h)
                                      ),
                                      child: Center(
                                        child: Text("Submit",style: TextStyle(
                                            fontFamily: 'PoppinsMedium',
                                            color: Colors.white,
                                            fontSize: 15.sp
                                        ),),
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(width: 30.w,),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),)
                    ],
                  )
              )
          ),
          bottomNavigationBar: BottomNavigationBarWidget(),
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}














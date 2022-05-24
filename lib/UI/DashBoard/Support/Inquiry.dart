import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Inquiry extends StatefulWidget {
  const Inquiry({Key? key}) : super(key: key);

  @override
  _InquiryState createState() => _InquiryState();
}


class _InquiryState extends State<Inquiry> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstants.colorWhite,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(120.h),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/back_arrow.png', width: 30.w,height: 17.h,),
                      ),
                      SizedBox(width: 5.w,),
                      Text("Inquiry",textAlign:TextAlign.center,style: TextStyle(
                          fontFamily: 'RoMedium',
                          color: ColorConstants.colorPrimary,
                          fontSize: 15.sp
                      ),)
                    ],
                  ),
                )
            ),
            body: SafeArea(
                child:Padding(
                  padding: EdgeInsets.only(left: 20.w,top: 30.h,bottom: 30.h,right: 20.h),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height.h,
                      width: MediaQuery.of(context).size.width.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.all(7.h),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.h),
                                ),
                                child: TextField(
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                      borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                    ),
                                  ),),
                              )
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.all(7.h),
                              child:Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h),
                                  ),
                                  child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                  ),
                                ),))
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.all(7.h),
                              child:Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h),
                                  ),
                                  child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Mobile No.',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                  ),
                                ),))
                          ),
                          Container(
                              width: 300.w,
                              padding: EdgeInsets.all(7.h),
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h),
                                  ),
                                  child:TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: 'Location',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  suffixIcon: Icon(Icons.location_on_outlined,color: ColorConstants.colorPrimary,),
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                  ),
                                ),))
                          ),
                          Container(
                              width: 300.w,
                              height: 150.h,
                              padding: EdgeInsets.all(7.h),
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h),
                                  ),
                                  child:TextField(
                                autocorrect: true,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  hintText: 'Enter message*',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.h)),
                                    borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                                  ),
                                ),))
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Expanded(child: buttonStyleOne("SEND",context),),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    )
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














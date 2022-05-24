import 'package:carousel_slider/carousel_slider.dart';
import 'package:dornest/UI/DashBoard/Support/Inquiry.dart';
import 'package:dornest/UI/SupportingWidgets/AppDrawer.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SinglePanel extends StatefulWidget {
  const SinglePanel({Key? key}) : super(key: key);

  @override
  _SinglePanelState createState() => _SinglePanelState();
}


class _SinglePanelState extends State<SinglePanel> {


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
                    Text("Single Panel",textAlign:TextAlign.center,style: TextStyle(
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
                padding: EdgeInsets.only(left: 20.w,top: 10.h,bottom: 10.h,right: 20.h),
                child:  ListView(
                  physics: ClampingScrollPhysics(),
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 0.w,top: 0.h,bottom: 10.h,right: 0.h),
                        child: Container(
                            height: 115.h,
                            width: MediaQuery.of(context).size.width.w,
                            padding: EdgeInsets.all(0.h),
                            decoration: BoxDecoration(
                              color: ColorConstants.colorGrey,
                              borderRadius: BorderRadius.circular(5.h),
                              image: DecorationImage(
                                image: AssetImage("assets/images/banner.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child:Text("")
                        )
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                              color: ColorConstants.colorPrimaryDark,
                              borderRadius: BorderRadius.circular(5.h)
                          ),
                          child: Center(
                            child: Text("ALPHA",style: TextStyle(
                                fontFamily: 'RoMedium',
                                color: Colors.white,
                                fontSize: 12.sp
                            ),),
                          ),
                        )),
                        SizedBox(width: 5.w,),
                        Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(3.h),
                              decoration: BoxDecoration(
                                  color: ColorConstants.colorGrey,
                                  borderRadius: BorderRadius.circular(5.h)
                              ),
                              child: Center(
                                child: Text("BETA",style: TextStyle(
                                    fontFamily: 'RoMedium',
                                    color: Colors.white,
                                    fontSize: 12.sp
                                ),),
                              ),
                            )
                        ),
                        SizedBox(width: 5.w,),
                        Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(3.h),
                              decoration: BoxDecoration(
                                  color: ColorConstants.colorGrey,
                                  borderRadius: BorderRadius.circular(5.h)
                              ),
                              child: Center(
                                child: Text("GAMAA",style: TextStyle(
                                    fontFamily: 'RoMedium',
                                    color: Colors.white,
                                    fontSize: 12.sp
                                ),),
                              ),
                            )
                        ),
                        SizedBox(width: 5.w,),
                        Expanded(
                            flex: 1,
                            child: Text("")
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('The lorem ipsum gets its name from the Latin phrase Neque porro quisquam est qui dolorem ipsum quia dolor sit amet. which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.”',textAlign:TextAlign.start,style: TextStyle(
                            color: ColorConstants.colorBlack87,
                            fontSize: 12.sp
                        ),),)
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(left: 0.w,right: 0.w,top: 10.w),
                            child: Container(
                                height: 150.h,
                                width: MediaQuery.of(context).size.width.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorConstants.colorGrey ,
                                    width: 0.3.w ,
                                  ),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 5.h,bottom: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(width: 8.w,),
                                                  Text("Door XYZ",style: TextStyle(
                                                      color: ColorConstants.colorBlack87,
                                                      fontFamily: 'RoMedium',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13.sp
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 5.w,),
                                                  RatingBar.builder(
                                                    initialRating: 3,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 13.sp,
                                                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                                    itemBuilder: (context, _) => Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 5.sp,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 8.w,),
                                                  Text("Price:",style: TextStyle(
                                                      color: ColorConstants.colorBlack45,
                                                      fontFamily: 'RoMedium',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp
                                                  ),),
                                                  SizedBox(width: 7.w,),
                                                  Image.asset("assets/images/rupee.png",height: 12.h,width: 12.w,),
                                                  Text("799",style: TextStyle(
                                                      color: ColorConstants.colorBlack45,
                                                      fontFamily: 'RoMedium',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 8.w,),
                                                  Text("BUT NOW",style: TextStyle(
                                                      color: ColorConstants.colorPrimary,
                                                      fontFamily: 'RoMedium',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp
                                                  ),),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Card(
                                                elevation: 2,
                                                color: ColorConstants.colorWhite,
                                                child:Padding(
                                                  padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 5.h,right: 5.h),
                                                  child: SizedBox(
                                                    width: 70.w,
                                                    height: 80.h,
                                                    child: Column(
                                                      children: [
                                                        Image.asset("assets/images/door.png",height: 70.h,width: 70.w,),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Inquiry()));
                                                  },
                                                  child: Image.asset("assets/images/customer_service.png",height: 30.h,width: 30.w,),
                                                ),
                                                SizedBox(width: 12.w,)
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                )
                            ),
                          );
                        }
                    )
                  ],
                ),
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













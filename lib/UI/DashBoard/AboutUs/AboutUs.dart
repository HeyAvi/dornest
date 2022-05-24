import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}


class _AboutUsState extends State<AboutUs> {


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
                    'About Us',
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
              padding: EdgeInsets.only(left: 20.w,top: 20.h,bottom: 20.h,right: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 15.w,),
                      Container(
                          height: 30.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstants.colorPrimary ,
                              width: 1.w ,
                            ),
                            borderRadius: BorderRadius.circular(30.h),
                          ),
                          child: Center(
                            child: Text("WHO WE ARE",style: TextStyle(
                                color: ColorConstants.colorPrimary,
                                fontFamily: 'RoMedium',
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp
                            ),),
                          )
                      ),
                      SizedBox(width: 15.w,),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.w),
                    child: Container(
                      //height: 450.h,
                        width: MediaQuery.of(context).size.width.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorConstants.colorPrimary ,
                            width: 2.w ,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 15.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('The lorem ipsum gets its name from the Latin phrase Neque porro quisquam est qui dolorem ipsum quia dolor sit amet. which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.”',textAlign:TextAlign.start,style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontSize: 15.sp
                                  ),),)
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('The lorem ipsum gets its name from the Latin phrase Neque porro quisquam est qui dolorem ipsum quia dolor sit amet. which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.”',textAlign:TextAlign.start,style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontSize: 15.sp
                                  ),),)
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text('The lorem ipsum gets its name from the Latin phrase Neque porro quisquam est qui dolorem ipsum quia dolor sit amet. which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.”',textAlign:TextAlign.start,style: TextStyle(
                                      fontFamily: 'RoMedium',
                                      color: ColorConstants.colorBlack87,
                                      fontSize: 15.sp
                                  ),),)
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
                  )
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














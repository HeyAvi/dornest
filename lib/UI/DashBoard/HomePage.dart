import 'package:carousel_slider/carousel_slider.dart';
import 'package:dornest/UI/Authentication/LoginPage.dart';
import 'package:dornest/UI/DashBoard/Panels/SinglePanel.dart';
import 'package:dornest/UI/SupportingWidgets/AppDrawer.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/UI/DashBoard/Notification/Notification.dart';
import 'package:dornest/Utils/Clippers/CurvedBottomClipper.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  int _current = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBody: true,
          key: _scaffoldKey,
        backgroundColor: ColorConstants.colorWhite,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h,left: 15.w),
                  child: GestureDetector(
                    onTap: (){
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      width: 22.h,
                      height: 22.h,
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                          color: ColorConstants.colorPrimary,
                          borderRadius: BorderRadius.circular(3.h)
                      ),
                      child: Center(
                        child: Image.asset('assets/images/dashboard.png', width: 17.w,height: 17.h,color: ColorConstants.colorWhite,),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Container(
                    //width: MediaQuery.of(context).size.width.w/1.4.w,
                    color: ColorConstants.colorPrimary,
                    height: 80.0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Image.asset('assets/images/applogo.png', width: 150.w),
                      )
                    ),
                  ),
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (Context) => Notifications()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h,right: 15.w),
                    child: Image.asset('assets/images/notification.png', width: 25.w,height: 25.h,color: ColorConstants.colorPrimary,),
                  ),
                )
              ],
            )
        ),
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: AppDrawer(),
        ),
        body: SafeArea(
            child:Padding(
                padding: EdgeInsets.only(left: 20.w,top: 10.h,bottom: 10.h,right: 20.h),
                child:  Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: 4,
                        options: CarouselOptions(
                            height: 120.h,
                            aspectRatio: 16/9,
                            viewportFraction: 1.0,
                            onPageChanged: (index,reason){
                              setState(() {
                                _current = index+1;
                              });
                            }
                        ),
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          return Container(
                            width: MediaQuery.of(context).size.width.w,
                            padding: EdgeInsets.all(10.h),
                            margin: EdgeInsets.only(left: 2.w,right: 2.w),
                            decoration: BoxDecoration(
                                //color: ColorConstants.colorPrimary,
                                borderRadius: BorderRadius.circular(5.h),
                              image: DecorationImage(
                                image: AssetImage("assets/images/banner.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child:Row(
                              children: [
                                Expanded(child: Text("")),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context) => LoginPage()));
                                      },
                                      child: Container(
                                        height:24.h,
                                        width:90.w,
                                        padding: EdgeInsets.only(left:7.w,right: 7.w,top: 0.h,bottom: 0.h),
                                        decoration: BoxDecoration(
                                            color: ColorConstants.colorPrimary,
                                            borderRadius: BorderRadius.circular(30.h)
                                        ),
                                        child: Center(
                                          child: Text("Login",style: TextStyle(
                                              fontFamily: 'PoppinsMedium',
                                              color: ColorConstants.colorWhite,
                                              fontSize: 15.sp
                                          ),),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          );
                        }
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [1,2,3,4].map((i) {
                        int index =  i; //are changed
                        return Container(
                          width: 6.h,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.h),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? ColorConstants.colorPrimary
                                  : Color.fromRGBO(0, 0, 0, 0.4)),
                        );
                      }).toList(),
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (Context) => SinglePanel()));
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 0.w,top: 10.h,bottom: 0.h,right: 0.h),
                              child: Container(
                                  height: 115.h,
                                  width: MediaQuery.of(context).size.width.w,
                                  padding: EdgeInsets.all(0.h),
                                  decoration: BoxDecoration(
                                    color: ColorConstants.colorGrey,
                                    borderRadius: BorderRadius.circular(5.h),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/singlepannel.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                       Row(
                                       children: [
                                         SizedBox(width: 25.w,),
                                         SizedBox(
                                           height: 110.h,
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Expanded(
                                                   flex: 1,
                                                   child: Text("")
                                               ),
                                               Text("SINGLE PANEL ",style: TextStyle(
                                                   color: ColorConstants.colortextColor,
                                                   fontFamily: 'RoMedium',
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 16.sp
                                               ),
                                                 textAlign: TextAlign.center,
                                               ),
                                               Text(" DOOR",style: TextStyle(
                                                   color: ColorConstants.colortextColor,
                                                   fontFamily: 'PoppinsMedium',
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 16.sp
                                               ),
                                                 textAlign: TextAlign.center,
                                               ),
                                               Expanded(
                                                   flex: 1,
                                                   child: Text("")
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                      )
                                    ],
                                  )
                              )
                          ),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: 0.w,top: 10.h,bottom: 0.h,right: 0.h),
                            child: Container(
                                height: 115.h,
                                width: MediaQuery.of(context).size.width.w,
                                padding: EdgeInsets.all(0.h),
                                decoration: BoxDecoration(
                                  color: ColorConstants.colorGrey,
                                  borderRadius: BorderRadius.circular(5.h),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/doublepannel.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 25.w,),
                                        SizedBox(
                                          height: 110.h,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text("")
                                              ),
                                              Text("DOUBLE PANEL ",style: TextStyle(
                                                  color: ColorConstants.colortextColor,
                                                  fontFamily: 'PoppinsMedium',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp
                                              ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(" DOOR",style: TextStyle(
                                                  color: ColorConstants.colortextColor,
                                                  fontFamily: 'PoppinsMedium',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp
                                              ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text("")
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            )
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: 0.w,top: 10.h,bottom: 0.h,right: 0.h),
                            child: Container(
                                height: 115.h,
                                width: MediaQuery.of(context).size.width.w,
                                padding: EdgeInsets.all(0.h),
                                decoration: BoxDecoration(
                                  color: ColorConstants.colorGrey,
                                  borderRadius: BorderRadius.circular(5.h),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/doubledoor.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5.w,),
                                        SizedBox(
                                          height: 110.h,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text("")
                                              ),
                                              Text("DOUBLE PANEL ",style: TextStyle(
                                                  color: ColorConstants.colortextColor,
                                                  fontFamily: 'PoppinsMedium',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp
                                              ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text("DOUBLE LEAF DOOR",style: TextStyle(
                                                  color: ColorConstants.colortextColor,
                                                  fontFamily: 'PoppinsMedium',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp
                                              ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text("")
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                            )
                        )
                    ),
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













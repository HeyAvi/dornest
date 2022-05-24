import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Orders extends StatefulWidget {


  @override
  _OrdersState createState() => _OrdersState();
}


class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin{

  late TabController _controller;
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.colorWhite,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(120.h),
              child: Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: 90.h,
                  color: ColorConstants.colorWhite,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15.w,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back_arrow.png', width: 30.w,height: 17.h,color: ColorConstants.colorBlack87,),
                          ),
                          Expanded(child: Image.asset('assets/images/applogo.png', width: 100.w,height: 50.h))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w,right: 5.w),
                        child: TabBar(
                          controller: _controller,
                          indicatorColor: ColorConstants.colorPrimary,
                          indicatorWeight: 3,
                          tabs: [
                            Tab(
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/process.png', width: 20.w,height: 20.h.h,color: (_selectedIndex == 0) ? ColorConstants.colorPrimary : ColorConstants.colorBlack87,),
                                    SizedBox(width: 5.w,),
                                    Text("ONGOING ORDERS",  textAlign:TextAlign.center,style: TextStyle(color: (_selectedIndex == 0) ? ColorConstants.colorPrimary : ColorConstants.colorBlack87,fontSize: 12.sp,fontWeight: FontWeight.bold),),
                                  ],
                                )
                            ),
                            Tab(
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/add_to_cart.png', width: 20.w,height: 20.h.h,color: (_selectedIndex == 1) ? ColorConstants.colorPrimary : ColorConstants.colorBlack87,),
                                    SizedBox(width: 5.w,),
                                    Text("COMPLETE ORDERS",  textAlign:TextAlign.center,style: TextStyle(color: (_selectedIndex == 1) ? ColorConstants.colorPrimary : ColorConstants.colorBlack87,fontSize: 12.sp,fontWeight: FontWeight.bold),),
                                  ],
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              )
          ),
          body: SafeArea(
              child:Padding(
                  padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 5.h,right: 10.h),
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialog();
                                    });
                                ;
                              },
                              child: Padding(
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
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 5.h,top: 5.h,left: 10.w,right: 5.w),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/profile.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                        SizedBox(width: 5.w,),
                                                        Text("Yash Mehrotra",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/email.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                        SizedBox(width: 5.w,),
                                                        Text("Yash@gmail.com",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/location.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                        SizedBox(width: 5.w,),
                                                        Text("Sector 63H , Noida",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/telephone_call.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                        SizedBox(width: 5.w,),
                                                        Text("9876543210",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                      ],
                                                    ),

                                                  ],
                                                )
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Order id:",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                        SizedBox(width: 5.w,),
                                                        Text("#2345678",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/images/money.png', width: 20.w,height: 20.h),
                                                        SizedBox(width: 5.w,),
                                                        Text(" 1655",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Text(""),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("QTY : ",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                        SizedBox(width: 5.w,),
                                                        Text("2",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        )
                                    )
                                ),
                              ),
                            );
                          }
                      ),
                      ListView.builder(
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
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.h,top: 5.h,left: 10.w,right: 5.w),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/profile.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                      SizedBox(width: 5.w,),
                                                      Text("Yash Mehrotra",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/email.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                      SizedBox(width: 5.w,),
                                                      Text("Yash@gmail.com",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/location.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                      SizedBox(width: 5.w,),
                                                      Text("Sector 63H , Noida",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/telephone_call.png', width: 16.w,height: 16.h,color: ColorConstants.colorPrimary),
                                                      SizedBox(width: 5.w,),
                                                      Text("9876543210",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp),),
                                                    ],
                                                  ),

                                                ],
                                              )
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Order id:",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                      SizedBox(width: 5.w,),
                                                      Text("#2345678",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset('assets/images/money.png', width: 20.w,height: 20.h),
                                                      SizedBox(width: 5.w,),
                                                      Text(" 1655",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(""),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("QTY : ",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                      SizedBox(width: 5.w,),
                                                      Text("2",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            );
                          }
                      ),
                    ],
                  )
              )
          ),
        )
    );
  }



}


class CustomDialog extends StatefulWidget {


  @override
  _CustomDialogState createState() => _CustomDialogState();
}


class _CustomDialogState extends State<CustomDialog> {

  bool isNotConfirm = false;

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(25.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h,bottom: 20.h,left: 10.w,right: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: [
                Text("ORDER ID",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorGrey,fontSize: 13.sp,fontFamily: "RoBold"),),
                SizedBox(height: 2.h,),
                Text("#2345678",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorBlack87,fontSize: 15.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20.w,),
            Column(
              children: [
                Text("Design Numbers",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorGrey,fontSize: 13.sp,fontFamily: "RoBold"),),
                SizedBox(height: 2.w,),
                Text("\$7755",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 15.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20.w,),
            Column(
              children: [
                Text("User Name",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorGrey,fontSize: 13.sp,fontFamily: "RoBold"),),
                SizedBox(height: 2.w,),
                Text("Yash Mehrotra",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 15.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20.w,),
            Column(
              children: [
                Text("Price",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorGrey,fontSize: 13.sp,fontFamily: "RoBold"),),
                SizedBox(height: 2.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/money.png', width: 25.w,height: 25.h),
                    SizedBox(width: 5.w,),
                    Text("1655",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.w,),
            Column(
              children: [
                Text("QTY : ",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorGrey,fontSize: 13.sp,fontFamily: "RoBold"),),
                SizedBox(height: 2.w,),
                Text("2",  textAlign:TextAlign.center,style: TextStyle(color: ColorConstants.colorPrimary,fontSize: 15.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20.w,),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.h),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                              color: ColorConstants.colorWhite,
                              borderRadius: BorderRadius.circular(30.h)
                          ),
                          child: Center(
                            child: Text("Confirm",style: TextStyle(
                                fontFamily: 'RoMedium',
                                color: ColorConstants.colorPrimary,
                                fontSize: 15.sp
                            ),),
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(width: 5.w,),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isNotConfirm = true;
                        });
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.h),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                              color: isNotConfirm ? ColorConstants.colorPrimary : ColorConstants.colorWhite,
                              borderRadius: BorderRadius.circular(30.h)
                          ),
                          child: Center(
                            child: Text("Not Confirm",style: TextStyle(
                                fontFamily: 'RoMedium',
                                color: isNotConfirm ? ColorConstants.colorWhite : ColorConstants.colorPrimary,
                                fontSize: 15.sp
                            ),),
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
            isNotConfirm ? Column(
              children: [
                SizedBox(height: 10.w,),
                Container(
                    width: MediaQuery.of(context).size.width.w,
                    height: 120.h,
                    padding: EdgeInsets.all(0.h),
                    child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                        ),
                        child:TextField(
                          autocorrect: true,
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.h)),
                              borderSide: BorderSide(color: ColorConstants.colorBlack12, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.h)),
                              borderSide: BorderSide(color: ColorConstants.colorPrimary,),
                            ),
                          ),))
                ),
                SizedBox(height: 10.w,),
                Row(
                  children: [
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            color: ColorConstants.colorPrimary,
                            borderRadius: BorderRadius.circular(30.h)
                        ),
                        child: Center(
                          child: Text("Submit",style: TextStyle(
                              fontFamily: 'RoMedium',
                              color: Colors.white,
                              fontSize: 18.sp
                          ),),
                        ),
                      ),),
                    SizedBox(width: 10.w,),
                  ],
                )
              ],
            ):Text("")
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}





import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dornest/UI/Authentication/LoginPage.dart';
import 'package:dornest/UI/DashBoard/Notification/Notification.dart';
import 'package:dornest/UI/DashBoard/widgets/home_category_card.dart';
import 'package:dornest/UI/SupportingWidgets/AppDrawer.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/Utils/Clippers/CurvedBottomClipper.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/category_model.dart';
import 'package:dornest/models/operation_enquiry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../shared_prefs_enum/shared_pref_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

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
                  padding: EdgeInsets.only(top: 10.h, left: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      width: 22.h,
                      height: 22.h,
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                          color: ColorConstants.colorPrimary,
                          borderRadius: BorderRadius.circular(3.h)),
                      child: Center(
                        child: Image.asset(
                          'assets/images/dashboard.png',
                          width: 17.w,
                          height: 17.h,
                          color: ColorConstants.colorWhite,
                        ),
                      ),
                    ),
                  )),
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
                      child: Image.asset('assets/images/applogo.png',
                          width: 150.w),
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 15.w),
                  child: Image.asset(
                    'assets/images/notification.png',
                    width: 25.w,
                    height: 25.h,
                    color: ColorConstants.colorPrimary,
                  ),
                ),
              )
            ],
          )),
      drawer: const Drawer(
        backgroundColor: Colors.transparent,
        child: AppDrawer(),
      ),
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h, right: 20.h),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.colorPrimary,
                ),
              )
            : user != null
                ? user!.role == '3'
                    ? FutureBuilder(
                        future: API.getAllOperatorEnquiries(),
                        builder: (context, AsyncSnapshot snapshot) {
                          print(snapshot.data);
                          if (snapshot.data == null) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorConstants.colorPrimary,
                              ),
                            );
                          }
                          Map mapData = jsonDecode(snapshot.data);
                          List dataList = mapData['0'];
                          if (dataList.isEmpty) {
                            return const Center(
                              child: Text('No Enquiries'),
                            );
                          }
                          List<OperationEnquiry> operationEnquiries = [];

                          for (var data in dataList) {
                            operationEnquiries
                                .add(OperationEnquiry.fromJson(data));
                          }
                          return ListView.builder(
                            itemCount: operationEnquiries.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return Card(
                                  elevation: 3,
                                  child: ListTile(
                                    title: Text(operationEnquiries[index].name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'type:${operationEnquiries[index].role == '1' ? 'Dealer' : operationEnquiries[index].role == '5' ? 'Guest' : 'Sales'}'),
                                        Text(operationEnquiries[index].email),
                                        Text(operationEnquiries[index].mobile),
                                        Text(operationEnquiries[index]
                                                .location ??
                                            ''),
                                        Text(
                                            operationEnquiries[index].message ??
                                                ''),
                                      ],
                                    ),
                                    trailing: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: ColorConstants.colorPrimary,
                                        elevation: 0,
                                        padding: const EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text(
                                                'Choose the type of user to assign this Enquiry?'),
                                            actions: [
                                              operationEnquiries[index].role ==
                                                      '1'
                                                  ? Container()
                                                  : TextButton(
                                                      child:
                                                          const Text('Dealer'),
                                                      onPressed: () {
                                                        // todo from here
                                                        //open bottom sheet
                                                      },
                                                    ),
                                              TextButton(
                                                  child: const Text('Sales'),
                                                  // todo from here
                                                  //open bottom sheet
                                                  onPressed: () {})
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text('Assign'),
                                    ),
                                  ));
                            },
                          );
                        })
                    : Column(
                        children: [
                          CarouselSlider.builder(
                              itemCount: 4,
                              options: CarouselOptions(
                                  height: 120.h,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index + 1;
                                    });
                                  }),
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                return Container(
                                    width: MediaQuery.of(context).size.width.w,
                                    padding: EdgeInsets.all(10.h),
                                    margin:
                                        EdgeInsets.only(left: 2.w, right: 2.w),
                                    decoration: BoxDecoration(
                                      //color: ColorConstants.colorPrimary,
                                      borderRadius: BorderRadius.circular(5.h),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/banner.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: user == null
                                        ? Row(
                                            children: [
                                              const Expanded(child: Text("")),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const LoginPage()));
                                                    },
                                                    child: Container(
                                                      height: 24.h,
                                                      width: 90.w,
                                                      padding: EdgeInsets.only(
                                                          left: 7.w,
                                                          right: 7.w,
                                                          top: 0.h,
                                                          bottom: 0.h),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstants
                                                              .colorPrimary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.h)),
                                                      child: Center(
                                                        child: Text(
                                                          "Login",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'PoppinsMedium',
                                                              color:
                                                                  ColorConstants
                                                                      .colorWhite,
                                                              fontSize: 15.sp),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        : null);
                              }),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [1, 2, 3, 4].map((i) {
                              int index = i; //are changed
                              return Container(
                                width: 6.h,
                                height: 6.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 2.h),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? ColorConstants.colorPrimary
                                        : const Color.fromRGBO(0, 0, 0, 0.4)),
                              );
                            }).toList(),
                          ),
                          Expanded(
                              flex: 1,
                              child: FutureBuilder(
                                  future: API.getCategories(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.data == null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    Map data = jsonDecode(snapshot.data);
                                    List dataList = data['0'];
                                    if (dataList.isEmpty) {
                                      return const Center(
                                        child: Text('No Categories'),
                                      );
                                    }
                                    List<CategoryModel> categoryList = [];
                                    for (var data in dataList) {
                                      categoryList
                                          .add(CategoryModel.fromJson(data));
                                    }
                                    return ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: categoryList.length,
                                        itemBuilder: (context, index) {
                                          return CategoryCard(
                                            categoryModel: categoryList[index],
                                          );
                                        });
                                  })),
                        ],
                      )
                : Column(
                    children: [
                      CarouselSlider.builder(
                          itemCount: 4,
                          options: CarouselOptions(
                              height: 120.h,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index + 1;
                                });
                              }),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Container(
                                width: MediaQuery.of(context).size.width.w,
                                padding: EdgeInsets.all(10.h),
                                margin: EdgeInsets.only(left: 2.w, right: 2.w),
                                decoration: BoxDecoration(
                                  //color: ColorConstants.colorPrimary,
                                  borderRadius: BorderRadius.circular(5.h),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/banner.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: user == null
                                    ? Row(
                                        children: [
                                          const Expanded(child: Text("")),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LoginPage()));
                                                },
                                                child: Container(
                                                  height: 24.h,
                                                  width: 90.w,
                                                  padding: EdgeInsets.only(
                                                      left: 7.w,
                                                      right: 7.w,
                                                      top: 0.h,
                                                      bottom: 0.h),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstants
                                                          .colorPrimary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.h)),
                                                  child: Center(
                                                    child: Text(
                                                      "Login",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'PoppinsMedium',
                                                          color: ColorConstants
                                                              .colorWhite,
                                                          fontSize: 15.sp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    : null);
                          }),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3, 4].map((i) {
                          int index = i; //are changed
                          return Container(
                            width: 6.h,
                            height: 6.h,
                            margin: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 2.h),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? ColorConstants.colorPrimary
                                    : const Color.fromRGBO(0, 0, 0, 0.4)),
                          );
                        }).toList(),
                      ),
                      Expanded(
                          flex: 1,
                          child: FutureBuilder(
                              future: API.getCategories(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                Map data = jsonDecode(snapshot.data);
                                List dataList = data['0'];
                                if (dataList.isEmpty) {
                                  return const Center(
                                    child: Text('No Categories'),
                                  );
                                }
                                List<CategoryModel> categoryList = [];
                                for (var data in dataList) {
                                  categoryList
                                      .add(CategoryModel.fromJson(data));
                                }
                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: categoryList.length,
                                    itemBuilder: (context, index) {
                                      return CategoryCard(
                                        categoryModel: categoryList[index],
                                      );
                                    });
                              })),
                    ],
                  ),
      )),
      bottomNavigationBar: BottomNavigationBarWidget(),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  User? user;

  void getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(SharedPrefEnum.userData.name));
    if (mounted) {
      setState(() {
        user = User.fromJson(
            jsonDecode(prefs.getString(SharedPrefEnum.userData.name) ?? '{}'));
        isLoading = false;
        print('here ${user?.name}');
      });
    }
  }
}

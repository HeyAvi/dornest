import 'dart:convert';

import 'package:dornest/UI/DashBoard/Support/Inquiry.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/product_model.dart';
import 'package:dornest/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String categoryId;

  const SubCategoriesScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: API.getSubcategories(categoryId: categoryId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          Map data = jsonDecode(snapshot.data);
          List? dataList = data['0'];
          if (dataList == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nothing to explore here, please come back later',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          List<SubCategoryModel> subCategories = [];
          for (var data in dataList) {
            subCategories.add(
              SubCategoryModel.fromJson(data,
                  isActive: dataList.first == data ? true : false),
            );
          }
          if (subCategories.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nothing to explore here, please come back later',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return SinglePanel(subCategories: subCategories);
        },
      ),
    );
  }
}

class SinglePanel extends StatefulWidget {
  final List<SubCategoryModel> subCategories;

  const SinglePanel({
    Key? key,
    required this.subCategories,
  }) : super(key: key);

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
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    width: 30.w,
                    height: 17.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Single Panel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'RoMedium',
                      color: ColorConstants.colorPrimary,
                      fontSize: 15.sp),
                )
              ],
            ),
          )),
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h, right: 20.h),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: 0.w, top: 0.h, bottom: 10.h, right: 0.h),
                child: Container(
                  height: 115.h,
                  width: MediaQuery.of(context).size.width.w,
                  padding: EdgeInsets.all(0.h),
                  decoration: BoxDecoration(
                    color: ColorConstants.colorGrey,
                    borderRadius: BorderRadius.circular(5.h),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/banner.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: widget.subCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4),
                    child: InkWell(
                      onTap: () {
                        for (int i = 0; i < widget.subCategories.length; i++) {
                          if (i != index) {
                            widget.subCategories[i].isActive = false;
                          }
                        }

                        setState(() {
                          widget.subCategories[index].isActive = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: widget.subCategories[index].isActive ?? false
                                ? ColorConstants.colorPrimaryDark
                                : ColorConstants.colorGrey,
                            borderRadius: BorderRadius.circular(5.h)),
                        child: Center(
                          child: Text(
                            widget.subCategories[index].subcategory
                                .toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'RoMedium',
                                color: Colors.white,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            // Row(
            //   children: [
            //     Expanded(
            //         flex: 1,
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {
            //               widget.subCategories[0].isActive = true;
            //               widget.subCategories[1].isActive = false;
            //               widget.subCategories[2].isActive = false;
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(3.h),
            //             decoration: BoxDecoration(
            //                 color: widget.subCategories[0].isActive ?? false
            //                     ? ColorConstants.colorPrimaryDark
            //                     : ColorConstants.colorGrey,
            //                 borderRadius: BorderRadius.circular(5.h)),
            //             child: Center(
            //               child: Text(
            //                 widget.subCategories[0].subcategory.toUpperCase(),
            //                 style: TextStyle(
            //                     fontFamily: 'RoMedium',
            //                     color: Colors.white,
            //                     fontSize: 12.sp),
            //               ),
            //             ),
            //           ),
            //         )),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Expanded(
            //         flex: 1,
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {
            //               widget.subCategories[0].isActive = false;
            //               widget.subCategories[1].isActive = true;
            //               widget.subCategories[2].isActive = false;
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(3.h),
            //             decoration: BoxDecoration(
            //                 color: widget.subCategories[1].isActive ?? false
            //                     ? ColorConstants.colorPrimaryDark
            //                     : ColorConstants.colorGrey,
            //                 borderRadius: BorderRadius.circular(5.h)),
            //             child: Center(
            //               child: Text(
            //                 widget.subCategories[1].subcategory.toUpperCase(),
            //                 style: TextStyle(
            //                     fontFamily: 'RoMedium',
            //                     color: Colors.white,
            //                     fontSize: 12.sp),
            //               ),
            //             ),
            //           ),
            //         )),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     Expanded(
            //         flex: 1,
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {
            //               widget.subCategories[0].isActive = false;
            //               widget.subCategories[1].isActive = false;
            //               widget.subCategories[2].isActive = true;
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(3.h),
            //             decoration: BoxDecoration(
            //                 color: widget.subCategories[2].isActive ?? false
            //                     ? ColorConstants.colorPrimaryDark
            //                     : ColorConstants.colorGrey,
            //                 borderRadius: BorderRadius.circular(5.h)),
            //             child: Center(
            //               child: Text(
            //                 widget.subCategories[2].subcategory.toUpperCase(),
            //                 style: TextStyle(
            //                     fontFamily: 'RoMedium',
            //                     color: Colors.white,
            //                     fontSize: 12.sp),
            //               ),
            //             ),
            //           ),
            //         )),
            //     SizedBox(
            //       width: 5.w,
            //     ),
            //     const Expanded(flex: 1, child: Text("")),
            //   ],
            // ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'The lorem ipsum gets its name from the Latin phrase Neque porro quisquam est qui dolorem ipsum quia dolor sit amet. which translates to “Nor is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.”',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: ColorConstants.colorBlack87, fontSize: 12.sp),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            FutureBuilder(
                future: API.getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  Map mapData = jsonDecode(snapshot.data);
                  List dataList = mapData['0'];
                  List<Product> products = [];
                  String categoryId = getCategoryId();
                  String subCatId = getSubCategoryId();
                  print(categoryId);
                  print(subCatId);
                  for (var data in dataList) {
                    if (data['category'] == categoryId &&
                        data['subcategory'] == subCatId) {
                      products.add(Product.fromJson(data));
                    }
                  }
                  if (products.isEmpty) {
                    return const Center(
                      child: Text('No Products Found'),
                    );
                  }
                  return ListView.builder(
                      itemCount: products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // todo separate it
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 0.w, right: 0.w, top: 10.w),
                          child: Container(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorConstants.colorGrey,
                                  width: 0.3.w,
                                ),
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.w,
                                      right: 10.w,
                                      top: 5.h,
                                      bottom: 5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                products[index].product,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .colorBlack87,
                                                    fontFamily: 'RoMedium',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              RatingBar.builder(
                                                initialRating: double.parse(
                                                    products[index].rating),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 13.sp,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                "Price:",
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .colorBlack45,
                                                    fontFamily: 'RoMedium',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Image.asset(
                                                "assets/images/rupee.png",
                                                height: 12.h,
                                                width: 12.w,
                                              ),
                                              Text(
                                                products[index].mainPrice,
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .colorBlack45,
                                                    fontFamily: 'RoMedium',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                "BUY NOW",
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .colorPrimary,
                                                    fontFamily: 'RoMedium',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                      SizedBox(
                                        width: 100.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Card(
                                                elevation: 2,
                                                color:
                                                    ColorConstants.colorWhite,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.h,
                                                      bottom: 10.h,
                                                      left: 5.h,
                                                      right: 5.h),
                                                  child: SizedBox(
                                                    width: 70.w,
                                                    height: 80.h,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/door.png",
                                                          height: 70.h,
                                                          width: 70.w,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Inquiry(
                                                                      product:
                                                                          products[
                                                                              index],
                                                                    )));
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/customer_service.png",
                                                    height: 30.h,
                                                    width: 30.w,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ))),
                        );
                      });
                })
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBarWidget(),
    ));
  }

  String getCategoryId() {
    for (var element in widget.subCategories) {
      if (element.isActive ?? false) {
        return element.cid;
      }
    }
    return '';
  }

  String getSubCategoryId() {
    for (var element in widget.subCategories) {
      if (element.isActive ?? false) {
        return element.id;
      }
    }
    return '';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

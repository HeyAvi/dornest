import 'dart:convert';

import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/inquiry_model.dart';
import 'package:dornest/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_model.dart';
import '../../../shared_prefs_enum/shared_pref_enum.dart';

class Inquiry extends StatefulWidget {
  final List<Product> products;
  final User? user;
  final String? mobile;

  const Inquiry(
      {Key? key,
      required this.products,
      required this.user,
      required this.mobile})
      : super(key: key);

  @override
  _InquiryState createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
  String? nameError;
  String? emailError;
  String? messageError;
  bool isLoading = false;
  String? mobileError;
  String? locationError;
  User? user;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (mounted && widget.user != null) {
      setState(() {
        user = widget.user;
        nameController.text = user?.name ?? '';
        emailController.text = user?.email ?? '';
        mobileController.text = user?.mobile ?? '';
        locationController.text = user?.location ?? '';
      });
    }
    if (widget.mobile != null && mounted) {
      setState(() {
        mobileController.text = widget.mobile ?? '';
      });
    }
  }

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
                  "Inquiry",
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
          child: GestureDetector(
        onTap: () {
          setState(() {
            FocusScope.of(context).unfocus();
          });
        },
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, top: 30.h, bottom: 30.h, right: 20.h),
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height.h,
                      width: MediaQuery.of(context).size.width.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                              itemCount: widget.products.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                    height: 150.h,
                                    width: MediaQuery.of(context).size.width.w,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 5.h,
                                            bottom: 5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                      widget.products[index]
                                                          .product,
                                                      style: TextStyle(
                                                          color: ColorConstants
                                                              .colorBlack87,
                                                          fontFamily:
                                                              'RoMedium',
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      initialRating:
                                                          double.parse(widget
                                                              .products[index]
                                                              .rating),
                                                      minRating: 1,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 13.sp,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 0.0),
                                                      itemBuilder:
                                                          (context, _) => Icon(
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
                                                          fontFamily:
                                                              'RoMedium',
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      widget.products[index]
                                                          .mainPrice,
                                                      style: TextStyle(
                                                          color: ColorConstants
                                                              .colorBlack45,
                                                          fontFamily:
                                                              'RoMedium',
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                      color: ColorConstants
                                                          .colorWhite,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
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
                                                ],
                                              ),
                                            )
                                          ],
                                        )));
                              }),
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
                                  readOnly: user?.mobile != null ? true : false,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    errorText: nameError,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white70,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.h)),
                                      borderSide: const BorderSide(
                                          color: ColorConstants.colorBlack12,
                                          width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.h)),
                                      borderSide: const BorderSide(
                                        color: ColorConstants.colorPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
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
                                    readOnly:
                                        user?.email != null ? true : false,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      errorText: emailError,
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                            color: ColorConstants.colorBlack12,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                          color: ColorConstants.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ))),
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
                                    readOnly: widget.mobile != null
                                        ? true
                                        : user?.mobile != null
                                            ? true
                                            : false,
                                    controller: mobileController,
                                    decoration: InputDecoration(
                                      hintText: 'Mobile No.',
                                      errorText: mobileError,
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                            color: ColorConstants.colorBlack12,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                          color: ColorConstants.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ))),
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
                                    controller: locationController,
                                    decoration: InputDecoration(
                                      hintText: 'Location',
                                      errorText: locationError,
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      filled: true,
                                      suffixIcon: const Icon(
                                        Icons.location_on_outlined,
                                        color: ColorConstants.colorPrimary,
                                      ),
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                            color: ColorConstants.colorBlack12,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                          color: ColorConstants.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ))),
                          Container(
                              width: 300.w,
                              height: 150.h,
                              padding: EdgeInsets.all(7.h),
                              child: Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h),
                                  ),
                                  child: TextField(
                                    autocorrect: true,
                                    controller: messageController,
                                    maxLines: 8,
                                    decoration: InputDecoration(
                                      hintText: 'Enter message*',
                                      errorText: messageError,
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                            color: ColorConstants.colorBlack12,
                                            width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.h)),
                                        borderSide: const BorderSide(
                                          color: ColorConstants.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ))),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.h),
                            child: SizedBox(
                              width: 300.w,
                              height: 40.h,
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorConstants.colorPrimary,
                                      ),
                                    )
                                  : isSuccess
                                      ? const CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 40,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          ),
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                ColorConstants.colorPrimary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.h),
                                            ),
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              nameError = null;
                                              emailError = null;
                                              mobileError = null;
                                              locationError = null;
                                              messageError = null;
                                            });
                                            if (nameController.text.isEmpty) {
                                              setState(() {
                                                nameError = 'Name is required';
                                              });
                                              return;
                                            } else if (emailController
                                                .text.isEmpty) {
                                              setState(() {
                                                emailError =
                                                    'Email is required';
                                              });
                                              return;
                                            } else if (mobileController
                                                .text.isEmpty) {
                                              setState(() {
                                                mobileError =
                                                    'Mobile is required';
                                              });
                                              return;
                                            } else if (locationController
                                                .text.isEmpty) {
                                              setState(() {
                                                locationError =
                                                    'Location is required';
                                              });
                                              return;
                                            } else if (messageController
                                                .text.isEmpty) {
                                              setState(() {
                                                messageError =
                                                    'Message is required';
                                              });
                                              return;
                                            }
                                            String productIds = ' ';
                                            for (var product
                                                in widget.products) {
                                              productIds +=
                                                  product.productId.toString() + ',';
                                            }
                                            productIds = productIds.substring(
                                                0, productIds.length - 1);
                                            InquiryModel inquiryModel =
                                                InquiryModel(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    mobile:
                                                        mobileController.text,
                                                    location:
                                                        locationController.text,
                                                    message:
                                                        messageController.text,
                                                    pid: productIds,
                                                    createdAt: DateTime.now());
                                            setState(() {
                                              isLoading = true;
                                            });
                                            isSuccess = await submitData(
                                                inquiryModel: inquiryModel);
                                            setState(() {
                                              isLoading = false;
                                            });
                                            if (isSuccess) {
                                              if (user == null) {
                                                var prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                await prefs.clear();
                                                await prefs.setString(
                                                    SharedPrefEnum
                                                        .guestMobile.name,
                                                    mobileController.text);
                                                print(
                                                    'saved to shared prefs ${mobileController.text}');
                                                print(prefs.getString(
                                                    SharedPrefEnum
                                                        .guestMobile.name));
                                              }
                                              await ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Inquiry submitted successfully'),
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                  ))
                                                  .closed
                                                  .then((reason) {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            const HomePage()),
                                                    (route) => false);
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Something went wrong'),
                                                duration: Duration(seconds: 2),
                                              ));
                                            }
                                          },
                                          child: Text(
                                            'Submit',
                                            style: TextStyle(
                                                fontFamily: 'PoppinsMedium',
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                  ))),
        ),
      )),
      bottomNavigationBar: BottomNavigationBarWidget(),
    ));
  }

  bool isSuccess = false;

  Future<bool> submitData({
    required InquiryModel inquiryModel,
  }) async {
    return await API.sendInquiry(inquiry: inquiryModel, user: user);
  }
}

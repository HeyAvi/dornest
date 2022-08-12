import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/UI/SupportingWidgets/BottomNavigationBar.dart';
import 'package:dornest/UI/SupportingWidgets/ButtonStyleOne.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:dornest/apis/api.dart';
import 'package:dornest/models/InquiryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Inquiry extends StatefulWidget {
  const Inquiry({Key? key}) : super(key: key);

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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
                                          backgroundColor:
                                           Colors.green,
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
                                            } else if (emailController
                                                .text.isEmpty) {
                                              setState(() {
                                                emailError =
                                                    'Email is required';
                                              });
                                            } else if (mobileController
                                                .text.isEmpty) {
                                              setState(() {
                                                mobileError =
                                                    'Mobile is required';
                                              });
                                            } else if (locationController
                                                .text.isEmpty) {
                                              setState(() {
                                                locationError =
                                                    'Location is required';
                                              });
                                            } else if (messageController
                                                .text.isEmpty) {
                                              setState(() {
                                                messageError =
                                                    'Message is required';
                                              });
                                            }
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
                                              await ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Inquiry submitted successfully'),
                                                    duration:
                                                        Duration(seconds: 1),
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

  Future<bool> submitData({required InquiryModel inquiryModel}) async {
    return await API.sendInquiry(inquiry: inquiryModel);
  }
}

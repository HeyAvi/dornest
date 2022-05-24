import 'package:dornest/UI/Authentication/LoginPage.dart';
import 'package:dornest/UI/DashBoard/HomePage.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/applogo.png', width: 250.w),
        ),
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startHome();
  }

  Future<void> startHome() async {
    await Future.delayed(Duration( milliseconds: 3000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context) => HomePage()));
  }
}














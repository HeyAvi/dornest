import 'package:dornest/UI/DashBoard/NearByDealer/NearByDealer.dart';
import 'package:dornest/UI/DashBoard/Profile/Profile.dart';
import 'package:dornest/UI/DashBoard/Support/CustomerSupport.dart';
import 'package:dornest/Utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CustomerSupport()));
      } else if (_selectedIndex == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => NearByDealer()));
      } else if (_selectedIndex == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const Profile()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.h,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: BottomNavigationBar(
        selectedItemColor: ColorConstants.colorPrimary,
        unselectedItemColor: ColorConstants.colorBlack,
        backgroundColor: ColorConstants.colorWhite,
        unselectedFontSize: 8.sp,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          color: ColorConstants.colorPrimary,
          fontFamily: 'PoppinsMedium',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
          color: ColorConstants.colorPrimary,
          fontFamily: 'PoppinsMedium',
        ),
        // currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              height: 20.h,
              width: 20.w,
              color: ColorConstants.colorPrimary,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/enquiry.png',
                height: 20.h, width: 20.w, color: ColorConstants.colorBlack),
            label: 'ENQUIRY',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/near_by_dealer.png',
                height: 20.h, width: 20.w, color: ColorConstants.colorBlack),
            label: 'NEAR BY DEALER',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile.png',
                height: 20.h, width: 20.w, color: ColorConstants.colorBlack),
            label: 'PROFILE',
          )
        ],
      ),
    );
  }
}

/*
BottomNavigationBarItem(
icon: Image.asset('assets/images/home.png',height: 20.h,width: 20.w,color: (_selectedIndex == 0) ? ColorConstants.colorPrimary : ColorConstants.colorGrey,),
label: 'HOME',
),
BottomNavigationBarItem(
icon: Image.asset('assets/images/enquiry.png',height: 20.h,width: 20.w,color: (_selectedIndex == 1) ? ColorConstants.colorPrimary : ColorConstants.colorGrey),
label: 'ENQUIRY',
),
BottomNavigationBarItem(
icon: Image.asset('assets/images/near_by_dealer.png',height: 20.h,width: 20.w,color: (_selectedIndex == 2) ? ColorConstants.colorPrimary : ColorConstants.colorGrey),
label: 'NEAR BY DEALER',
),
BottomNavigationBarItem(
icon: Image.asset('assets/images/profile.png',height: 20.h,width: 20.w,color: (_selectedIndex == 3) ? ColorConstants.colorPrimary : ColorConstants.colorGrey),
label: 'PROFILE',
),*/

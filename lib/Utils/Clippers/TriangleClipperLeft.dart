import 'package:flutter/material.dart';

class TriangleClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    /*path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 2.5, size.height /10, size.width*2.0 /5, size.height );
    path.lineTo(size.width, size.height);*/
    path.lineTo(size.width*2, 0);
    path.lineTo(size.width/2.5 , size.height*2/2);
    path.lineTo(size.width*0.05, 0);
    path.lineTo(size.width, 0);
    path.close();

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
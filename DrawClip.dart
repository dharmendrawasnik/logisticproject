import 'package:flutter/material.dart';

class DrawClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.lineTo(0, size.height*0.80);
    path.cubicTo(size.width/4, size.height, 3*size.width/4, size.height/2, size.width, size.width*0.6);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
class DrawClip2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.lineTo(0, size.height*0.80);
    path.cubicTo(size.width/4, size.height, 3*size.width/4, size.height/2, size.width, size.width*0.6);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
import 'package:flutter/material.dart';

class MinPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    Path path = Path();
    path = Path();
    path.lineTo( 0, size.height * 0.12 );
    path.cubicTo(             -0.02,   size.height * 0.16, /* - */             -0.02,  size.height * 0.05, /* - */ size.width * 0.06,  size.height * 0.02 );
    path.cubicTo( size.width * 0.07,   size.height * 0.01, /* - */ size.width * 0.11,                   0, /* - */ size.width * 0.12,                   0 );
    path.cubicTo( size.width * 0.12,                    0, /* - */ size.width * 0.88,                   0, /* - */ size.width * 0.88,                   0 );
    path.cubicTo( size.width * 0.94,                    0, /* - */        size.width,  size.height * 0.05, /* - */        size.width,  size.height * 0.13 );
    path.cubicTo( size.width,          size.height * 0.15, /* - */        size.width,  size.height * 0.16, /* - */        size.width,  size.height * 0.16 );
    path.cubicTo( size.width,          size.height * 0.18, /* - */ size.width * 0.78,  size.height * 0.78, /* - */ size.width * 0.78,  size.height * 0.78 );
    path.cubicTo( size.width * 0.76,   size.height * 0.85, /* - */ size.width * 0.73,  size.height * 0.91, /* - */ size.width * 0.67,  size.height * 0.93 );
    path.cubicTo( size.width * 0.67,   size.height * 0.93, /* - */ size.width * 0.14,         size.height, /* - */ size.width * 0.14,         size.height );
    path.cubicTo( size.width * 0.13,          size.height, /* - */ size.width * 0.12,         size.height, /* - */ size.width * 0.11,         size.height );
    path.cubicTo( size.width * 0.05,          size.height, /* - */                 0,  size.height * 0.95, /* - */                 0,  size.height * 0.89 );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MaxPath extends CustomClipper<Path> {
  @override
    Path getClip(Size size) {
      Path path = Path();
      path = Path();
      path.lineTo(0, size.height * 0.12);
      path.cubicTo(             -0.01,  size.height * 0.16, /* - */             -0.01,  size.height * 0.05, /* - */ size.width * 0.03,  size.height * 0.02 );
      path.cubicTo( size.width * 0.04,  size.height * 0.01, /* - */ size.width * 0.06,                   0, /* - */ size.width * 0.06,                   0 );
      path.cubicTo( size.width * 0.06,                   0, /* - */ size.width * 0.47,  size.height * 0.08, /* - */ size.width * 0.47,  size.height * 0.08 );
      path.cubicTo( size.width * 0.48,  size.height * 0.08, /* - */ size.width * 0.49,  size.height * 0.08, /* - */    size.width / 2,  size.height * 0.08 );
      path.cubicTo( size.width * 0.51,  size.height * 0.08, /* - */ size.width * 0.52,  size.height * 0.08, /* - */ size.width * 0.53,  size.height * 0.08 );
      path.cubicTo( size.width * 0.53,  size.height * 0.08, /* - */ size.width * 0.94,                   0, /* - */ size.width * 0.94,                   0 );
      path.cubicTo( size.width * 0.97,               -0.01, /* - */        size.width,  size.height * 0.05, /* - */        size.width,  size.height * 0.12 );
      path.cubicTo(        size.width,  size.height * 0.12, /* - */        size.width,  size.height * 0.88, /* - */        size.width,  size.height * 0.88 );
      path.cubicTo(        size.width,  size.height * 0.95, /* - */ size.width * 0.97,         size.height, /* - */ size.width * 0.94,         size.height );
      path.cubicTo( size.width * 0.94,         size.height, /* - */ size.width * 0.53,  size.height * 0.92, /* - */ size.width * 0.53,  size.height * 0.92 );
      path.cubicTo( size.width * 0.52,  size.height * 0.92, /* - */ size.width * 0.51,  size.height * 0.92, /* - */    size.width / 2,  size.height * 0.92 );
      path.cubicTo( size.width * 0.49,  size.height * 0.92, /* - */ size.width * 0.48,  size.height * 0.92, /* - */ size.width * 0.47,  size.height * 0.92 );
      path.cubicTo( size.width * 0.47,  size.height * 0.92, /* - */ size.width * 0.06,         size.height, /* - */ size.width * 0.06,         size.height );
      path.cubicTo( size.width * 0.03,         size.height, /* - */                 0,  size.height * 0.95, /* - */                 0,  size.height * 0.88 );
      return path;
    }
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  }
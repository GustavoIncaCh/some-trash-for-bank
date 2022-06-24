import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

/// Display One Message Toast
///--------------------------
/// Pre edited general toast message widget
///----------------------------------------
///* Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///- email: 9780desarrollador09@gmail.com
///- Date : 20/11/2021
showToastWidget (
  BuildContext context, {
    required String text,
    bool? bottom = true
  }
) =>
showToast(           text,
  context          : context,
  backgroundColor  : Colors.blue.shade800,
  animation        : StyledToastAnimation.slideFromTopFade,
  reverseAnimation : StyledToastAnimation.slideToTopFade,
  animDuration     : const Duration(seconds: 1),
  duration         : const Duration(seconds: 4),
  curve            : Curves.elasticOut,
  reverseCurve     : Curves.elasticIn,
  position         : bottom!
  ? StyledToastPosition.bottom
  : StyledToastPosition.top,
);
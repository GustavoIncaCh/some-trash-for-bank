import 'package:flutter/material.dart';

///  Color information
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 15/12/2021
class Tint{

  /// Gray colors
  ///----------------------
  ///- [accent1] hex #E5E5E5
  ///- [accent2] hex #838383
  ///- [accent3] hex #000000 opacity 0.51
  ///- [accent4] hex #5E9CAA
  static _Gray gray = _Gray(
    accent1 : const Color(0xffE5E5E5),
    accent2 : const Color(0xff838383),
    accent3 : const Color(0xff000000).withOpacity(0.51),
    accent4 : const Color(0xff5E9CAA)
  );


  /// Blue accent colors
  ///--------------------------------
  ///- [accent1]  hex #B2E5FB maindrop
  ///- [accent2]  hex #6BAFC6
  ///- [accent3]  hex #0A557A
  ///- [accent4]  hex #0A5F93
  ///- [accent5]  hex #0C4F83 dropdown button
  ///- [accent6]  hex #1B487D header
  ///- [accent7]  hex #154579 footer
  ///- [accent8]  hex #396F98 borders
  ///- [accent9]  hex #396F98
  ///- [accent10] hex #97C7D7
  static _Blue blue = _Blue(
    accent1  : const Color(0xffB2E5FB),
    accent2  : const Color(0xff6BAFC6),
    accent3  : const Color(0xff0A557A),
    accent4  : const Color(0xff0A5F93),
    accent5  : const Color(0xff0C4F83),
    accent6  : const Color(0xff1B487D),
    accent7  : const Color(0xff154579),
    accent8  : const Color(0xff396F98),
    accent9  : const Color(0xff2DD8E3),
    accent10 : const Color(0xff97C7D7),
  );


  // Gradient colors
  ///----------------------------------------------
  ///- [mainTop]    #1A477C main container gradient
  ///- [mainBottom] #0A557A main container gradient
  ///----------------------------------------------
  ///- [button1] #0C4F83 tap button gradient
  ///- [button2] #1B8DAF tap button gradient
  ///- [button3] #22ABC3 tap button gradient
  ///- [button4] #28C2D4 tap button gradient
  ///- [button5] #2DD8E3 tap button gradient
  static _Gradient gradient = _Gradient(
    mainTop    : const Color(0xff1A477C),
    mainBottom : const Color(0xff33639C),
    //-------------------------------------
    button1    : const Color(0xff0C4F83),
    button2    : const Color(0xff1B8DAF),
    button3    : const Color(0xff22ABC3),
    button4    : const Color(0xff28C2D4),
    button5    : const Color(0xff2DD8E3),
  );

}


///  Skin decoration
///-----------------------------------------------------
///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
///  - email: 9780desarrollador09@gmail.com
///  - Date : 02/12/2021
class Skin{

  static flagSwitchDecoration({
    required bool peru,
    required bool active,
  }) =>
  BoxDecoration(
    border: Border.all(
      width: 1,
      color: active
      ? peru ? Colors.red.withOpacity(0.4) : Colors.green.withOpacity(0.4)
      : Colors.transparent
    ),
    color: !active
    ? null
    : const Color(0xFF1A477C).withOpacity(0.5),
    borderRadius: BorderRadius.only(
      topLeft     : peru? const Radius.circular(30) : Radius.zero,
      bottomLeft  : peru? const Radius.circular(30) : Radius.zero,
      topRight    : peru? Radius.zero : const Radius.circular(30),
      bottomRight : peru? Radius.zero : const Radius.circular(30),
    )
  );

  //----------------------------------------------------- GRADIENT DECORATION


  static BoxDecoration gradientDecoration({
    bool? bannerSmall = false,
    bool? bannerBig = false,
    bool? shadow = false
  }) =>
  BoxDecoration(
    gradient: LinearGradient(
      colors:
        bannerSmall! ? [Tint.gradient.button2, Tint.gradient.button1, Tint.gradient.button1]:
        bannerBig! ? [Colors.white, Tint.blue.accent10, Tint.blue.accent9]:
        shadow! ? [Tint.gradient.button2, Colors.white]:
                  [Tint.gradient.mainTop, Tint.gradient.mainBottom],
      stops : bannerSmall || bannerBig!? null : const [0.349, 0.8281],
      begin : bannerSmall? Alignment.topLeft     : bannerBig!? Alignment.bottomRight : Alignment.topCenter,
      end   : bannerSmall? Alignment.bottomRight : bannerBig!? Alignment.topLeft     : Alignment.bottomCenter,
    ),
  );

  static BoxDecoration backgroundGradientDecoration({
    bool? bannerSmall = false,
    bool? bannerBig = false,
    bool? shadow = false
  }) =>
  const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff000428),
        Color(0xff004E92),
      ]),

  );

  


  //----------------------------------------------------- GRADIENT DECORATION


  static BoxDecoration floatingContainerDecoration() =>
  BoxDecoration(
    color : Colors.white,
    border: Border.all(
      color: Tint.blue.accent9,
      width: 2
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [BoxShadow(
      color     : Colors.black.withOpacity(0.6),
      blurRadius: 5
    )]
  );


  //--------------------------------------------------------- TEXT DECORATION


  /// Navigators [TextStyle]
  ///----------------------------------
  ///- [amount] : fontSize 22, [FontWeight.normal]
  ///- [comission] : fontSize 12, [FontWeight.w400]
  ///- [pin] : fontSize 24, [FontWeight.normal]
  ///- [qrName] : fontSize 20, [FontWeight.normal]
  ///- [qrDocument] : fontSize 15, [FontWeight.normal]
  ///- [backNumber] : fontSize 15, [FontWeight.normal]
  ///- [bankSymbol] : fontSize 18, [FontWeight.normal]
  ///- [bankName]   : fontSize 15, [FontWeight.w300]
  ///----------------------------------
  ///- DEFAULT : fontSize 24, [FontWeight.normal]
  static TextStyle blackTextStyle({
    bool? amount     = false,
    bool? comission  = false,
    bool? pin        = false,
    bool? qrName     = false,
    bool? qrDocument = false,
    bool? backNumber = false,
    bool? bankSymbol = false,
    bool? bankName   = false,
    bool? title      = false,
    bool? payAmount  = false,
  }) =>
  TextStyle(
    fontSize  :
      title!      ? 14:
      qrName!     ? 20:
      bankSymbol! ? 18:
      qrDocument! || backNumber! || bankName!? 15:
      pin!        ? 24:
      amount! || payAmount! ? 22:
                    12,
    color     : qrDocument!? Colors.black.withOpacity(0.51) : Colors.black,
    fontWeight:
      title?      FontWeight.w900:
      qrName! ||  qrDocument || payAmount!? FontWeight.w500:
      comission!? FontWeight.w400:
      bankName!?  FontWeight.w300:
                  FontWeight.normal
  );

  /// Navigators [TextStyle]
  ///----------------------------------
  ///- [title] : fontSize 22, [FontWeight.normal]
  ///----------------------------------
  ///- DEFAULT : fontSize 24, [FontWeight.normal]
  static TextStyle blueTextStyle({
    bool? title = false,
  }) =>
  TextStyle(
    fontSize  : title!? 20: 12,
    color     : title? Tint.blue.accent2 : Tint.blue.accent4,
  );

  //--------------------------------------------------- NAVIGATORS DECORATION


  /// Navigator Counter [BoxDecoration]
  static BoxDecoration navigatorCounterDecoration() =>
  BoxDecoration(
    shape : BoxShape.circle,
    color : Tint.blue.accent5,
    border: Border.all(width: 1, color: Colors.white)
  );


  /// Navigators [BoxDecoration]
  ///----------------------------------
  ///- [header] : shadow
  ///----------------------------------
  ///- DEFAULT : without shadow
  static BoxDecoration navigatorDecoration({bool? header = false}) =>
  BoxDecoration(
    color     : header!? Tint.blue.accent6 : null,
    gradient  : !header? LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Tint.blue.accent8,
        Tint.blue.accent5,
      ],
      stops: const [0.01, 1]
    ) : null,
    boxShadow : [BoxShadow(
      color       : Colors.black.withOpacity(0.8),
      blurRadius  : 10,
    )]
  );


  /// Navigators [TextStyle]
  ///----------------------------------
  ///- [footer] : fontSize 10, [FontWeight.w900]
  ///- [home] : fontSize 10, [FontWeight.w900]
  ///----------------------------------
  ///- DEFAULT : fontSize 24, [FontWeight.normal]
  static TextStyle navigatorTextStyle({
    bool? footer = false,
    bool? home   = false
  }) =>
  TextStyle(
    fontSize  : footer!? 10 : home!? 14 :24,
    color     : Colors.white,
    fontWeight: footer || home!? FontWeight.w900: FontWeight.normal,
  );


  //-------------------------------------------------------- MENUS DECORATION


  /// Navigators [BoxDecoration]
  ///----------------------------------
  ///- [submenu] : blue background
  ///----------------------------------
  ///- DEFAULT : without shadow
  static BoxDecoration menuDecoration({bool? submenu = false}) =>
  BoxDecoration(
    borderRadius : submenu!
      ? const BorderRadius.all(Radius.circular(5))
      : const BorderRadius.only(
        topLeft     : Radius.circular(20),
        topRight    : Radius.circular(20),
        bottomLeft  : Radius.circular(20),
        bottomRight : Radius.circular(20),
      )
      ,
    border       : !submenu? Border.all(width: 2, color: Tint.blue.accent1) : null,
    color        : submenu? Tint.blue.accent5.withOpacity(0.9) : Colors.white.withOpacity(0.5),
    // boxShadow    : !submenu? [BoxShadow(
    //   color       : Colors.black.withOpacity(0.8),
    //   blurRadius  : 10,
    // )] : null
  );


  /// Navigators [BoxDecoration]
  ///----------------------------------
  ///- [active] : clear blue background
  ///----------------------------------
  ///- DEFAULT : without shadow
  static BoxDecoration menuItemDecoration({bool? active = false}) =>
  BoxDecoration(
    borderRadius : const BorderRadius.all(Radius.circular(10)),
    color        : active!? Tint.blue.accent1 : Tint.blue.accent5,
    boxShadow    : active? [BoxShadow(
      color       : Colors.black.withOpacity(0.2),
      blurRadius  : 4,
    )] : null
  );


  /// Navigators User Name [TextStyle]
  ///----------------------------------
  ///- [subname] : italic low color
  ///----------------------------------
  static TextStyle menuNameTextStyle({bool? subname = false}) =>
  TextStyle(
    fontSize  : !subname!? 16 : 12,
    color     : !subname? Colors.black:  Colors.black.withOpacity(0.8),
    fontWeight: !subname? FontWeight.w500 : FontWeight.normal,
    fontStyle : !subname? FontStyle.normal : FontStyle.italic
  );


  /// Navigators [TextStyle]
  ///----------------------------------
  ///- [active] : turns text to black
  ///- [submenu] : fontSize 15, [FontWeight.w900]
  ///----------------------------------
  ///- DEFAULT : fontSize 14, [FontWeight.w500]
  static TextStyle menuTextStyle({
    bool? active = false,
    bool? submenu   = false
  }) =>
  TextStyle(
    fontSize  : submenu!? 15 : 14,
    color     : active!? Colors.black.withOpacity(0.8) : Colors.white,
    fontWeight: submenu? FontWeight.w900 : FontWeight.w500,
  );


  //------------------------------------------------------- BANNER DECORATION


  /// Banner [BoxDecoration]
  static BoxDecoration bannerDecoration() =>
  BoxDecoration(
    color        : Colors.white,
    borderRadius : const BorderRadius.all(Radius.circular(8)),
    border       : Border.all(
      width: 1,
      color: Tint.gray.accent4
    )
  );

  /// Banner [TextStyle]
  ///----------------------------------

  ///----------------------------------
  ///- DEFAULT : fontSize 25, [FontWeight.w500]
  static TextStyle bannerTargetTextStyle({
    bool? amount  = false,
    bool? symbol  = false,
    bool? balance = false,
    bool? name    = false,
    bool? usdAmount = false,
    bool? usdTitle = false,
  }) =>
  TextStyle(
    color    : amount! || symbol! || balance!? Colors.white : Colors.black,
    fontSize : amount? 20 : balance!? 16 : usdAmount!? 18: symbol! || name!? 26 : 12,
    fontWeight: amount || symbol! || name!? FontWeight.bold : usdTitle!? FontWeight.w300: FontWeight.normal,
    fontStyle: name! || usdTitle!? FontStyle.italic : FontStyle.normal
  );

  // /// Banner [TextStyle]
  // ///----------------------------------
  // ///- [small] : fontSize 15, [FontWeight.bold]
  // ///- [big] : fontSize 35, [FontWeight.w500]
  // ///----------------------------------
  // ///- [short] : true (size -2)
  // ///----------------------------------
  // ///- [title] : [s15] + clear blue accent
  // ///----------------------------------
  // ///- DEFAULT : fontSize 25, [FontWeight.w500]
  // static TextStyle bannerTextStyle({
  //   bool? small = false,
  //   bool? big   = false,
  //   bool? short = false,
  //   bool? title = false,
  // }) =>
  // TextStyle(
  //   fontSize  : (small! || title!? 15 : big!? 35 : 25) - (short!? 2 : 0),
  //   color     : title!? Tint.blue.accent2 : Tint.blue.accent3,
  //   fontWeight: small || title? FontWeight.bold: FontWeight.w500,
  // );


  //-------------------------------------------------------- TOKEN DECORATION


  /// token [TextStyle]
  ///----------------------------------
  ///- [name] : fontSize 30, [FontWeight.bold]
  ///- [amount] : fontSize 30, [FontWeight.w500]
  ///- [usd] : fontSize 18, [FontWeight.w500]
  ///- [title] : fontSize 18, [FontWeight.w500]
  ///---------------------------------
  ///- [short] : fontSize 22, only in [amount]
  static TextStyle tokenTextStyle({
    bool? name   = false,
    bool? amount = false,
    bool? usd    = false,
    bool? short  = false,
    bool? title  = false,
  }) =>
  TextStyle(
    fontSize   : title!? 15 : usd!? 18 : short!? 22: 30,
    color      : !usd! || title? Colors.white : Tint.gray.accent1.withOpacity(0.67),
    fontWeight : title? FontWeight.w900 : FontWeight.w500,
    fontStyle  : name!? FontStyle.italic : FontStyle.normal
  );


  //----------------------------------------------------- DROPDOWN DECORATION


  /// Dropdown header [BoxDecoration]
  ///---------------------------------
  ///- [shadow] true: turn shadow on
  ///----------------------------------
  ///- DEFAULT [shadow] false
  static BoxDecoration dropdownBoxHeaderDecoration({bool? shadow = false}) =>
  BoxDecoration(
    color        : Tint.blue.accent5.withOpacity(0.8),
    borderRadius : const BorderRadius.all(Radius.circular(5)),
    boxShadow    : shadow!? [BoxShadow(
      color       : Colors.black.withOpacity(0.2),
      blurRadius  : 10,
    )] : null
  );


  /// Dropdown header [BoxDecoration]
  ///---------------------------------
  ///- [filled] true: blue accent background
  ///----------------------------------
  ///- DEFAULT [filled] false: white background
  static BoxDecoration dropdownBodyDecoration({bool? filled = false}) =>
  BoxDecoration(
    color  : filled!? Tint.blue.accent1 : Colors.white.withOpacity(0.5),
    borderRadius : const BorderRadius.all(Radius.circular(10)),
    border : Border.all(
      width : 2,
      color : Tint.blue.accent5.withOpacity(0.8)
    )
  );


  /// Dropdown title [TextStyle]
  ///----------------------------------
  ///- [linned] true : [FontWeight.w300]
  ///----------------------------------
  ///- DEFAULT [FontWeight.normal]
  static TextStyle dropdownTitleTextStyle({bool? linned = false}) =>
  TextStyle(
    fontSize  : 14,
    color     : Colors.white,
    fontWeight: linned!? FontWeight.w300: FontWeight.normal,
  );

  /// Dropdown Item [TextStyle]
  ///----------------------------------
  ///- [switcher] true : font size 20, [FontWeight.bold]
  ///- [user] true : [FontWeight.bold]
  ///- [document] true : [FontWeight.w300]
  ///----------------------------------
  ///- DEFAULT [FontWeight.normal]
  static TextStyle dropdownItemTextStyle({
    bool? switcher = false,
    bool? contact  = false,
    bool? document = false,
  }) =>
  TextStyle(
    fontSize   : switcher!? 20 : document!? 12: 14,
    color      : Colors.black,
    fontWeight :
      contact! || switcher?   FontWeight.bold:
                  document!?  FontWeight.w300:
                              FontWeight.normal,
  );


  //------------------------------------------------------- DIALOG DECORATION


  /// Dialogs [BoxDecoration]
  ///---------------------------------
  ///- [modal] true: turn shadow on
  ///----------------------------------
  ///- DEFAULT [Radius] 5
  static BoxDecoration dialogDecoration({bool? modal = false}) =>
  BoxDecoration(
    color        : Tint.blue.accent5.withOpacity(0.8),
    border       : Border.all(width: 2, color: Tint.blue.accent1),
    borderRadius : modal!
      ? const BorderRadius.only(
        topLeft  : Radius.circular(20),
        topRight : Radius.circular(20),
      )
      : const BorderRadius.all(Radius.circular(5)),
  );


  /// Dialog [TextStyle]
  ///----------------------------------
  ///- [title] true : fontSize: 23, [FontWeight.w500]
  ///- [token] true : fontSize: 25, [FontWeight.w500]
  ///- [label] true : fontSize: 15, [FontWeight.w500]
  ///- [helper] true : fontSize: 12, [FontWeight.normal]
  ///----------------------------------
  ///- DEFAULT: fontSize 14,  [FontStyle.italic]
  static TextStyle dialogTextStyle({
    bool? title  = false,
    bool? token  = false,
    bool? label  = false,
    bool? helper = false,
  }) =>
  TextStyle(
    fontSize   :
      title! ? 23:
      token! ? 25:
      label! ? 15:
      helper!? 12:
               14,
    color      : label! || helper!? Tint.blue.accent4 : Colors.black,
    fontWeight : title || token! || label
      ? FontWeight.w500
      : FontWeight.normal,
    fontStyle: !title && !label && !helper!? FontStyle.italic : FontStyle.normal,
  );


  //-------------------------------------------------------- INPUT DECORATION


  /// Input [BoxDecoration]
  ///---------------------------------
  ///- [transparent] true: trurn off decoration
  ///----------------------------------
  ///- DEFAULT blue with borders
  static BoxDecoration inputDecoration({ bool? transparent = false }) =>
  BoxDecoration(
    color: transparent!
      ? Colors.transparent
      : Colors.white,
    border: !transparent
      ? Border.all(width : 2, color : Tint.blue.accent8)
      : null,
    borderRadius : !transparent
      ? const BorderRadius.all(Radius.circular(10))
      : BorderRadius.zero,
  );


  /// Input [TextStyle]
  ///----------------------------------
  ///- [amount] true : fontSize: 20, [FontWeight.normal]
  ///----------------------------------
  ///- DEFAULT: fontSize 13,  [FontWeight.w300]
  static TextStyle inputTextStyle({ bool? amount = false }) =>
  TextStyle(
    fontSize   : amount! ? 20: 13,
    color      : Colors.black,
    fontWeight : amount
      ? FontWeight.normal
      : FontWeight.w300,
  );


  //------------------------------------------------------- BUTTON DECORATION


  /// Button [BoxDecoration]
  ///---------------------------------
  ///- [tapEnable] true: white background
  ///- [tapDisable] true: gradient bakground
  ///----------------------------------
  ///- DEFAULT blue with all borders
  static BoxDecoration buttonDecoration({
    bool? tapEnable  = false,
    bool? tapDisable = false,
  }) =>
  BoxDecoration(
    color:
      !tapDisable! && !tapEnable! ? Tint.blue.accent5:
      tapEnable!? Colors.white:
                     null,
    gradient: tapDisable
      ? LinearGradient(
        begin : Alignment.topCenter,
        end   : Alignment.bottomCenter,
        colors: [
          Tint.gradient.button1,
          Tint.gradient.button2,
          Tint.gradient.button3,
          Tint.gradient.button4,
          Tint.gradient.button5,
        ],
        stops: const [-0.0901, 0.0497, 0.2902, 0.5923, 96.77]
      )
      : null,
    borderRadius : !tapEnable && !tapDisable
      ? const BorderRadius.all(Radius.circular(3))
      : const BorderRadius.only(
        topLeft  : Radius.circular(10),
        topRight : Radius.circular(10),
      ),
  );


  /// Floating Button [BoxDecoration]
  ///---------------------------------
  ///- [tapEnable] true: white background
  ///- [tapDisable] true: gradient bakground
  ///----------------------------------
  ///- DEFAULT blue with all borders
  static BoxDecoration floatingButtonDecoration({
    bool? tapEnable  = false,
    bool? tapDisable = false,
  }) =>
  BoxDecoration(
    color:
      !tapDisable! ? Tint.blue.accent5:
      tapEnable!   ? Colors.white:
                     null,
    gradient: tapDisable
      ? LinearGradient(
        colors: [
          Tint.gradient.button1,
          Tint.gradient.button2,
          Tint.gradient.button3,
          Tint.gradient.button4,
          Tint.gradient.button5,
        ],
        stops: const [-0.0901, 0.0497, 0.2902, 0.5923, 96.77]
      )
      : null,
    borderRadius : tapEnable! || tapDisable
      ? const BorderRadius.all(Radius.circular(3))
      : const BorderRadius.only(
        topLeft  : Radius.circular(10),
        topRight : Radius.circular(10),
      ),
  );


  /// Circular Button [BoxDecoration]
  ///---------------------------------
  ///- [footer] true: show shadow and white border
  ///----------------------------------
  ///- DEFAULT only blue gradient
  static BoxDecoration circularButtonDecoration({bool? footer = false}) =>
  BoxDecoration(
    shape  : BoxShape.circle,
    border : footer!
      ? Border.all(width: 2, color: Colors.white)
      : null,
    gradient     : LinearGradient(
      colors : [Tint.gradient.mainTop, Tint.gradient.mainBottom],
      begin  : Alignment.topCenter,
      end    : Alignment.bottomCenter,
    ),
    boxShadow: [BoxShadow(
      color       : Colors.black.withOpacity(0.4),
      blurRadius  : 10,
    )]
  );


  /// [TextStyle] for buttons with only text
  ///----------------------------------
  ///- [cancel] true : fontSize: 13, [FontWeight.bold]
  ///- [max] true : fontSize: 15, [FontWeight.normal]
  ///----------------------------------
  ///- DEFAULT: fontSize 12,  [FontWeight.normal]
  static TextStyle textButtonTextStyle({
    bool? register = false,
    bool? cancel   = false,
    bool? max      = false,
    bool? maxBlack = false,
    bool? pin      = false,
    bool? detail   = false,
  }) =>
  TextStyle(
    fontSize   : cancel!? 13: pin!? 20 : 17,
    color      : cancel || register! || maxBlack! || detail!? Tint.blue.accent3 : Colors.white,
    fontWeight : cancel || pin! || maxBlack!
      ? FontWeight.bold
      : FontWeight.normal,
    shadows: const [Shadow(
      color: Colors.black,
      blurRadius: 3
    )]
  );


  //--------------------------------------------------- SUCCESSFUL DECORATION


  /// [TextStyle] for buttons with only text
  ///----------------------------------
  ///- [title ] true : fontSize: 24, [FontWeight.normal]
  ///- [amount] true : fontSize: 20, [FontWeight.w500]
  ///- [detail] true : fontSize: 18, [FontWeight.w500]
  ///----------------------------------
  ///- DEFAULT: fontSize 15,  [FontWeight.normal]
  static TextStyle successfulTextStyle({
    bool? title  = false,
    bool? amount = false,
    bool? detail = false,
  }) =>
  TextStyle(
    fontSize   : title!? 24: amount!? 20 : detail!? 18 : 15,
    color      :
      title || amount!? Colors.white:
      detail!         ? Tint.blue.accent2:
                        Tint.blue.accent9,
    fontWeight : amount! || detail!
      ? FontWeight.w500
      : FontWeight.normal,
  );

}

class _Gray{
  Color accent1;
  Color accent2;
  Color accent3;
  Color accent4;
  _Gray({
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
  });
}

class _Blue{
  Color accent1;
  Color accent2;
  Color accent3;
  Color accent4;
  Color accent5;
  Color accent6;
  Color accent7;
  Color accent8;
  Color accent9;
  Color accent10;
  _Blue({
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.accent5,
    required this.accent6,
    required this.accent7,
    required this.accent8,
    required this.accent9,
    required this.accent10,
  });
}

class _Gradient{
  Color mainTop;
  Color mainBottom;
  Color button1;
  Color button2;
  Color button3;
  Color button4;
  Color button5;
  _Gradient({
    required this.mainTop,
    required this.mainBottom,
    required this.button1,
    required this.button2,
    required this.button3,
    required this.button4,
    required this.button5,
  });
}
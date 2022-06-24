import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/overlays/menu_overlay.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

class NavigatorBar extends StatelessWidget {
  final String? barName;
  const NavigatorBar({
    Key? key,
    this.barName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff154579),
      title: Text(
        barName!,
        //style: TextStyle(fontFamily: "ROBOTO"),
      ),
      actions: [
        //ButtonWidget(onClicked: () => Routes.notify(context),),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xff154579),
            ),
          ),
          onPressed: () => Routes.notify(context),
          child: const Icon(
            Icons.notifications,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () => showMenuOverlay(context),
          child: SizedBox(
            width: 38,
            height: 60,
            child: Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: Skin.circularButtonDecoration(footer: true),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(36)),
                child: Image.asset('lib/assets/logos/dataphoto1.png'),
              ),
            ),
            // Icon(Icons.menu_outlined, color: Colors.white, size: 30)
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

class NavigatorWidget extends StatelessWidget {
  final String? text;
  final bool? body;
  final bool? logo;
  final bool? bell;
  final bool? menu;

  ///  Navigator header pannel
  ///-----------------------------------------------------
  ///- nulleable [text] : empty by default
  ///- nulleable [body] : true: show bakground and shadow
  ///- nulleable [logo] false : hide logo and show back button
  ///- nulleable [bell] false : hide bell button
  ///- nulleable [menu] false : hide menu button
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const NavigatorWidget(
      {this.text = '',
      this.body = false,
      this.logo = true,
      this.bell = true,
      this.menu = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget(
        curve: Curves.easeOut,
        enabled: true,
        values: const [
          Offset(0, -200),
          Offset(0, 0),
        ],
        child: Container(
            decoration: body! ? Skin.navigatorDecoration(header: true) : null,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Stack(children: [
              //----------------------------------------------------------------------------
              //logo!
              //    ? Image.asset('lib/assets/img/logo_green.png', height: 40)
              //    : InkWell(
              //        onTap: () => Routes.hide(context),
              //        child: const Icon(Icons.chevron_left,
              //            color: Colors.white, size: 40)),
              IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
              //----------------------------------------------------------------------------
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child:
                      // FittedBox(
                      //   fit   : BoxFit.fill,
                      //   child :
                      Text(
                    text!,
                    style: Skin.navigatorTextStyle(),
                    overflow: TextOverflow.fade,
                  )
                  // ),
                  ),
              //----------------------------------------------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  //----------------------------------------------------------------------
                  IconButton(
                //style: ButtonStyle(
                //  backgroundColor: MaterialStateProperty.all<Color>(
                //    const Color(0xff154579),
                //  ),
                //),
                onPressed: () => Routes.notify(context),
                //child: const Icon(
                //  Icons.notifications,
                //  size: 30,
                //),
                icon: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 34,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 15,
                          minHeight: 14,
                        ),
                        child: const Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.zero,
              ),
                  //Offstage(
                  //    offstage: !bell!,
                  //    child: InkWell(
                  //        onTap: () {
                  //          Routes.notify(context);
                  //        },
                  //        child: SizedBox(
                  //            width: 40,
                  //            height: 60,
                  //            child: Stack(
                  //              children: [
                  //                const Center(
                  //                  child: Icon(Icons.notifications_outlined,
                  //                      color: Colors.white, size: 34),
                  //                ),
                  //                Positioned(
                  //                    right: 0,
                  //                    top: 5,
                  //                    child: Container(
                  //                      alignment: Alignment.center,
                  //                      decoration:
                  //                          Skin.navigatorCounterDecoration(),
                  //                      width: 20,
                  //                      height: 20,
                  //                      child: Text('9',
                  //                          style: Skin.navigatorTextStyle(
                  //                              footer: true)),
                  //                    ))
                  //              ],
                  //            )))),
                  //----------------------------------------------------------------------
                  Offstage(
                    offstage: !bell! && !menu!,
                    child: const SizedBox(width: 10),
                  ),
                  //----------------------------------------------------------------------
                  Offstage(
                      offstage: !menu!,
                      child: InkWell(
                          onTap: () => showMenuOverlay(context),
                          child: SizedBox(
                              width: 38,
                              height: 60,
                              child: Container(
                                  width: 38,
                                  height: 38,
                                  alignment: Alignment.center,
                                  decoration: Skin.circularButtonDecoration(
                                      footer: true),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(36)),
                                    child:
                                        Image.asset('lib/assets/logos/dataphoto1.png'),
                                  ))
                              // Icon(Icons.menu_outlined, color: Colors.white, size: 30)
                              ))),
                  //----------------------------------------------------------------------
                ]),
              )
              //----------------------------------------------------------------------------
            ])));
  }
}

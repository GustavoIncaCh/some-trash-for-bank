import 'dart:async';
import 'dart:math' as math;


import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {

  ///  Waiting time delay page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const WaitingPage({ Key? key }) : super(key: key);

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  int number = 10;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      number = number - 1;
      if(number == 0){
        Routes.hide(context);
        Routes.successfulPage(context);
      }
    });
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Flexible(
            child:
            Container(
              width     : MediaQuery.of(context).size.width,
              decoration: Skin.gradientDecoration(),
              alignment : Alignment.center,
              child:
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('POR FAVOR\nAGUARDE',
                    style: Skin.successfulTextStyle(title: true),
                    textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width   : 200,
                    height  : 200,
                    child:
                    AnimatedBuilder(
                      child     : Image.asset('lib/assets/img/loading.png', width: 200, height: 200),
                      animation : _controller,
                      builder   : (_, child) => Transform.rotate(
                        angle: _controller.value * 2 * math.pi,
                        child: child,
                      )
                    )
                  )
                ]
              )
            )
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child:
            Text('Pronto te comunicarás\ncon un asesor.',
              style: Skin.successfulTextStyle(detail: true),
              textAlign: TextAlign.center
            ),
          ),
        ]
      )
    );
  }
}
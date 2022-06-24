import 'dart:async';
import 'dart:math' as math;


import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

import 'package:provider/src/provider.dart';

import '../../modules/provider/client_provider.dart';

class WaitingVideoCallPage extends StatefulWidget {
  const WaitingVideoCallPage({ Key? key }) : super(key: key);

  @override
  _WaitingVideoCallPageState createState() => _WaitingVideoCallPageState();
}

class _WaitingVideoCallPageState extends State<WaitingVideoCallPage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  int number = 10;
  Timer? timer;
  // ignore: todo
  // TODO: I MUST BE CALLED FROM THE PROVIDER DATA
  //String? name = ClientProvider().clientRegister!.names;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      number = number - 1;
      if(number == 0){
        Routes.hide(context);
        //Routes.dnifrontcap(context);
        Routes.videocallwebview(context);
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
                  Text('BIENVENIDO(A) ${context.read<ClientProvider>().clientRegister!.names}',
                  //Text( 'BIENVENIDO JUAN',
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
            Text('¡Falta poco para\nterminar tu registro!',
              style: Skin.successfulTextStyle(detail: true),
              textAlign: TextAlign.center
            ),
          ),
        ]
      )
    );
  }
}
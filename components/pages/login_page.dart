import 'dart:ui';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/pin_board_widget.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/client_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class PinPageLogin extends StatefulWidget {
  final Pages pages;
  final Process process;

  ///  Pin Page
  ///-----------------------------------------------------
  const PinPageLogin({required this.pages, required this.process, Key? key})
      : super(key: key);

  @override
  _PinPageLoginState createState() => _PinPageLoginState();
}

class _PinPageLoginState extends State<PinPageLogin> {
  @override
  Widget build(BuildContext context) {
    String userName = context.watch<ClientProvider>().clientRegister!.names;
    return Scaffold(
        //backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: const MyAppBar(
          appBarName: "INGRESAR",
          isInside: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID: $userName",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "PIN",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: PinBoardWidget(
                    process: widget.process,
                    pages: widget.pages,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text(
                        "OLVIDE MI PIN",
                        style:
                            TextStyle(color: Color(0xFF0A557A), fontSize: 14),
                      ),
                      onPressed: () {
                        Routes.forgotpin(context);
                      },
                    ),
                    SizedBox(
                      width: 30,
                      // rotation of the icon
                      child: Transform.rotate(
                        angle: 180 * math.pi / 180,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF2DD8E3),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => const ImageDialog(),
                              barrierColor: const Color(0x33FFFFFF),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Container(
    //  //width: 200,
    //  //height: 200,
    //  decoration: BoxDecoration(
    //    image: DecorationImage(
    //      image: ExactAssetImage('lib/assets/img/Alert1.png'),
    //      //fit: BoxFit.cover
    //    )
    //  ),
    //);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          //alignment: Alignment(-2,1),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.zero,
            width: 320,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('lib/assets/img/Alert3.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "SI OLVIDASTE TU PIN\n¡NO TE PREOCUPES!\n",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "“ Solo necesitaremos tu\nDNI, N° de celular y\ncomprobar que eres tú ”",
                      style: TextStyle(
                          color: Color(0xFF0A5F93),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

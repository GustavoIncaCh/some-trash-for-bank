import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/pin_board_widget.dart';
import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/data_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinPage extends StatefulWidget {
  final Pages pages;
  final Process process; //
  ///  Pin Page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const PinPage({required this.pages, required this.process, Key? key})
      : super(key: key); //
  @override
  _PinPageState createState() => _PinPageState();
} //

class _PinPageState extends State<PinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(
          appBarName: "PIN",
          isInside: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.process == Process.check
                  ? const Text(
                      "Ingresa tu PIN para\nconfirmar la transacción",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    )
                  : widget.process == Process.register
                      ? Column(
                          children: [
                            Text(
                              context.watch<DataProvider>().registerText
                                  ? "TE TOCA CREAR TU PIN DE 6 DÍGITOS"
                                  : "Confirmar nuevamente su PIN:",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            if ( context.watch<DataProvider>().registerText) const SizedBox(
                              height: 18,
                            ),
                            Text(
                              context.watch<DataProvider>().registerText
                                  ? "No olvides memorizarla y no compartirla" :
                              "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        )
                      : widget.process == Process.confirm
                          ? const Text(
                              "Confirmar nuevamente su PIN:",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              "Establecer nuevos limites",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
              PinBoardWidget(
                process: widget.process,
                pages: widget.pages,
              ),
            ],
          ),
        ));
  }
}


//class PinPage extends StatefulWidget {
//  final Pages pages;
//  final Process process;
//
//  ///  Pin Page
//  ///-----------------------------------------------------
//  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
//  ///  - email: 9780desarrollador09@gmail.com
//  ///  - Date : 02/12/2021
//  const PinPage({
//    required this.pages,
//    required this.process,
//    Key? key}) : super(key: key);
//
//  @override
//  _PinPageState createState() => _PinPageState();
//}
//
//class _PinPageState extends State<PinPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Dialog(
//        child:
//        PinBoardWidget(
//          process : widget.process,
//          pages   : widget.pages,
//        ),
//      );
//  }
//}

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/pin_board_widget.dart';
import 'package:bank9780/modules/general/enum.dart';

import 'package:flutter/material.dart';

class PinPageRegister extends StatefulWidget {
  final Pages pages;
  final Process process;

  ///  Pin Page
  ///-----------------------------------------------------
  const PinPageRegister({required this.pages, required this.process, Key? key})
      : super(key: key);

  @override
  _PinPageRegisterState createState() => _PinPageRegisterState();
}

class _PinPageRegisterState extends State<PinPageRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.transparent,
        appBar: const MyAppBar(
          appBarName: "PIN",
          isInside: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("TE TOCA CREAR TU PIN DE 6 DÍGITOS",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Text("No olvides memorizarla y no compartirla",style: TextStyle(fontSize: 15),),
              PinBoardWidget(
                process: widget.process,
                pages: widget.pages,
              ),
            ],
          ),
        ));
  }
}

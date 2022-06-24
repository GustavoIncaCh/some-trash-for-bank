import 'dart:ui';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiveFormOperationWidget extends StatefulWidget {
  ///  Receive reactive form
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ReceiveFormOperationWidget({Key? key}) : super(key: key);

  @override
  _ReceiveFormOperationWidgetState createState() =>
      _ReceiveFormOperationWidgetState();
}

class _ReceiveFormOperationWidgetState
    extends State<ReceiveFormOperationWidget> {
  TextEditingController searchController = TextEditingController();
  bool showList = false;
  bool showSearch = false;
  bool searchTyping = false;

  @override
  Widget build(BuildContext context) {
    //todo bool
    bool show = false;//WidgetsBinding.instance!.window.viewInsets.bottom != 0.0;
    //--------------------------------------------------------------- SIZE DETERMINATE BOX
    return SizedBox.expand(
        child: Stack(children: [
      //-------------------------------------------------- COLUM OF AMOUNT INFORMATION
      Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Introduce el número de operación\ndel voucher de depósito por favor.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const ImageDialog(),
                        barrierColor: const Color(0x33FFFFFF),
                      );
                    },
                    icon: const Icon(
                      Icons.help_outline,
                      color: Color(0xFF2DD8E3),
                    ))
              ],
            )),
        SizedBox(
            width: double.infinity,
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              textAlign: TextAlign.left,
              decoration: Skin.inputDecoration(transparent: false),
              style: Skin.inputTextStyle(),
              placeholder: 'Número de operación',
              keyboardType: TextInputType.number,
              onTap: () => {},
              onChanged: (String text) {},
            )),
        Offstage(
            offstage: show,
            child: Column(children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    //onPressed : () => Routes.pinPage(context: context, pages: Pages.none, process: Process.check,),
                    onPressed: () {
                      context.read<DataProvider>().type = 4;
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: Skin.buttonDecoration(),
                        child: Text('ACEPTAR',
                            style: Skin.textButtonTextStyle()))),
                //TextButton(
                //  //onPressed : () => Routes.pinPage(context: context, pages: Pages.none, process: Process.check,),
                //  onPressed: () {context.read<DataProvider>().type=4;
                //  },
                //  child     :
                //  Container(
                //    padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //    decoration : Skin.gradientDecoration(),
                //    child      : Text('Anular Operacion', style: Skin.textButtonTextStyle())
                //  )
                //),
                OutlinedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        primary: const Color(0xFF1A477C)),
                    onPressed: () {
                      //routes.tutorial(context);
                      //Navigator.pop(context);
                    },
                    child: const Text(
                      'ANULAR OPERACIÓN',
                    )),
              ]),
            ]))
      ])
      //------------------------------------------------------------------------------
    ]));
  }

  focus() =>
      FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null;

  toggleList() => setState(() {
        focus();
        showList = !showList;
        searchController.clear();
        showSearch = false;
      });

  search(String text) {
    String upperSearch = text.toUpperCase();
    int index = 0;

    if (text.isNotEmpty) {
      index = context.read<DataProvider>().accounts.indexWhere(
          (element) => element.name.toUpperCase().startsWith(upperSearch));

      context.read<DataProvider>().setSearchAccount(
          context.read<DataProvider>().accounts[index == -1 ? 0 : index]);

      setState(() {
        showList = false;
        showSearch = true;
      });
    } else {
      setState(() {
        showList = false;
        showSearch = false;
      });
    }
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
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        //alignment: const Alignment(-0.25, -0.75),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.zero,
            width: 350,
            height: 290,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('lib/assets/img/AlertReceiveFull.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

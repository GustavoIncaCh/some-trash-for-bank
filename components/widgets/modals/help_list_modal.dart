import 'dart:ui';

import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';


// ignore: must_be_immutable
class HelpButton extends StatelessWidget {
  HelpButton({
    Key? key,
    required this.context,
    required this.dateFormat,
    required this.historyItems,
    required this.onClicked,
    required this.animation,
  }) : super(key: key);

  final BuildContext context;
  final DateFormat dateFormat;
  final HelpItem historyItems;
  final VoidCallback? onClicked;
  final Animation<double> animation;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    //totalCoin = totalCoin + coin.coinPartCost;
    //print("si entra $totalCoin");
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
            width: 2.5,
            color: Color(0xFF0C4F83),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              dateFormat.format(historyItems.date),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 20),
              child: Text(
                historyItems.title,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            IconButton(
              onPressed: () {
                if (!historyItems.switchOff) {
                showDialog<String>(
                barrierColor: const Color(0x33FFFFFF),
                context: context,
                builder: (BuildContext context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Dialog(
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0x330A5F93),
                          width: 2.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            //height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              "¿Estas seguro de\nfinalizar esta\nconversación?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF1A477C),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            child: const Text(
                              'ACEPTAR',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                                int i=0;
                                context.read<MenuProvider>().switchHelp(switchItem: historyItems);
                                Navigator.of(context).popUntil((route) => i++>=1);
                            },
                          ),
                          OutlinedButton(
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  primary: const Color(0xFF1A477C)),
                              //onPressed: onClicked,
                              onPressed: () {
                              Navigator.of(
                                context,
                              ).pop();
                              count = 0;
                              },
                              child: const Text(
                                'CANCELAR',
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );}
              else{return;}},
              //icon: Icon(Icons.messenger_outline),
              icon: Icon(Icons.cancel_presentation_rounded, color: !historyItems.switchOff ? Colors.black : Colors.black12,),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: () {
                Routes.answers(context, historyItems);
              },
              icon: const Icon(Icons.mark_email_read_outlined),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

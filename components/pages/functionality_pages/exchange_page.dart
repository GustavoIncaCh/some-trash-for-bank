import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';
import 'package:bank9780/modules/general/enum.dart';

import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  bool textFieldSelection = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child  :
      Container(
        padding: const EdgeInsets.only(top: 60),
        decoration: Skin.backgroundGradientDecoration(),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => textFieldSelection = !textFieldSelection,
              child    :
              const TokenCarouselWidget(
                fiat     : true,
                amount   : true,
                text     : 'ENVIAR',
                received : false,
              )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 1,
              color: Colors.white.withOpacity(0.4),
            ),
            const Offstage(
              //offstage : WidgetsBinding.instance.window.viewInsets.bottom != 0.0 && !textFieldSelection,
              offstage: false,
              child    :
              TokenCarouselWidget(
                fiat     : true,
                amount   : true,
                text     : 'RECIBIR',
                received : true,
                detail   : true,
              )
            ),
            InkWell(
              onTap : () => Routes.pinPage(context: context, process: Process.login),
              child :
              Container(
                padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration : Skin.buttonDecoration(),
                child      : Text('SIGUIENTE', style: Skin.textButtonTextStyle())
              )
            )
          ]
        )
      )
    );
  }
}
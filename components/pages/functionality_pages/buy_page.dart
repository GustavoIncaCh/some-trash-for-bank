import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/transactionWidgets/fiat_switch_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';
import 'package:bank9780/properties/skin.dart';

import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child  :
      Column(
        children : [
          Flexible(child:
            Container(
              padding    : const EdgeInsets.only(top: 50),
              alignment  : Alignment.center,
              child:
              const TokenCarouselWidget(
                fiat     : false,
                amount   : true,
                text     : 'COMPRAR',
                received : true,
                detail   : false,
              )
            )
          ),
          TranslationAnimatedWidget(
            curve   : Curves.easeOut,
            enabled : true,
            values  : const [
                Offset(0, 100),
                Offset(0, -100),
                Offset(0, 0),
            ],
            child:
            Container(
              padding     : const EdgeInsets.all(20),
              decoration  : Skin.floatingContainerDecoration(),
              margin    : const EdgeInsets.only(
                left    : 20,
                right   : 20,
                top     : 20,
                //bottom  : WidgetsBinding.instance.window.viewInsets.bottom + 30
                bottom  : 40
              ),
              alignment : Alignment.center,
              child     :
              const FiatSwitchWidget(
                pay   : true,
                items : 3
              )
            )
          )
        ]
      )
    );
  }
}
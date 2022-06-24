import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/transactionWidgets/fiat_switch_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  int value = 0;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100),() => context.read<DataProvider>().setPaymentItem(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width  : MediaQuery.of(context).size.width,
      height : MediaQuery.of(context).size.height,
      child  :
      Column(
        children : [
          Flexible(
            child:
            Container(
              padding    : const EdgeInsets.only(top:50),
              alignment  : Alignment.center,
              child:
              const TokenCarouselWidget(
                fiat     : false,
                amount   : true,
                text     : 'VENDER',
                received : false,
              )
            )
          ),
          Offstage(
            //todo 
            //offstage: WidgetsBinding.instance.window.viewInsets.bottom != 0.0,
            offstage: false,
            child:
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
                padding : const EdgeInsets.all(20),
                decoration: Skin.floatingContainerDecoration(),
                margin  : const EdgeInsets.only(
                  left    : 20,
                  right   : 20,
                  top     : 20,
                  //bottom  : WidgetsBinding.instance.window.viewInsets.bottom + 30
                  bottom: 30
                ),
                alignment : Alignment.center,
                child     :
                const FiatSwitchWidget(
                  pay   : false,
                  items : 2
                )
              )
            )
          )
        ]
      )
    );
  }
}
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FiatSwitchWidget extends StatefulWidget {
  final bool pay;
  final int items;
  const FiatSwitchWidget({
    required this.pay,
    required this.items,
    Key? key
  }) : super(key: key);

  @override
  _FiatSwitchWidgetState createState() => _FiatSwitchWidgetState();
}

class _FiatSwitchWidgetState extends State<FiatSwitchWidget> {
  List<int> values = [];

  @override
  void initState() {
    for(int i = 0; i < widget.items; i++){
      values.add(i);
    }
    Future.delayed(const Duration(milliseconds: 100),() => context.read<DataProvider>().setPaymentItem(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
    Consumer<DataProvider>(builder: (context, data, child) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Align(
            alignment: Alignment.centerLeft,
            child:
            Text(
              widget.pay? 'PAGAR' : 'COBRAR',
              style: Skin.blackTextStyle(title: true)
            ),
          ),
          Container(
            margin : const EdgeInsets.only(top: 10),
            width  : double.infinity,
            height : 30,
            child  :
            AnimatedToggleSwitch<int>.size(
              current       : data.itemIndex,
              values        : values,
              iconOpacity   : 0.8,
              indicatorSize : const Size.fromWidth(100),
              //indicatorType : IndicatorType.rectangle,
              borderRadius  : const BorderRadius.all(Radius.circular(10)),
              borderColor   : const Color(0xff154579),
              colorBuilder  : (i) => const Color(0xff33639C).withOpacity(0.8),
              onChanged     : (i) => data.setPaymentItem(i),
              iconBuilder   : (i, size, active) =>
                Icon(
                  context.watch<DataProvider>().paymentItems[i].icon,
                  color: active? Colors.white : const Color(0xff154579)
                ),
            )
          ),
          Container(
            margin  : const EdgeInsets.only(top: 20),
            width   : double.infinity,
            child   :
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SALDO: ' + data.token.amount.toStringAsFixed(2),
                      style: Skin.blackTextStyle(title: true)
                    ),
                    Offstage(
                      offstage: !widget.pay,
                      child:
                      InkWell(
                        onTap : () {},
                        child : Text('Máx',
                          style: Skin.textButtonTextStyle(maxBlack: true)
                        )
                      )
                    ),
                  ]
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                  CupertinoTextField(
                    padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    textAlign        : TextAlign.right,
                    decoration       : Skin.inputDecoration(),
                    style            : Skin.inputTextStyle(amount: true),
                    placeholder      : '0.00',
                    readOnly         : !widget.pay,
                    keyboardType     : TextInputType.number,
                    inputFormatters  : [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                    onTap            : ()=>{},
                    onChanged        : (String text) {},
                    suffix           :
                    Padding(
                      padding : const EdgeInsets.only(right: 10),
                      child   :
                      Text( data.token.symbol,
                        style: Skin.inputTextStyle(amount: true),
                      )
                    )
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.topRight,
                  child:
                  InkWell(
                    onTap: () {},
                    child: Text('Ver detalle',
                      style: Skin.textButtonTextStyle(detail: true)
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
}
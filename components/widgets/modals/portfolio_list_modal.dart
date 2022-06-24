import 'package:bank9780/modules/general/button_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../../modules/provider/menu_provider.dart';

class CoinButton extends StatefulWidget {
  const CoinButton({
    Key? key,
    required this.context,
    required this.coin,
    required this.isExpanded,
  }) : super(key: key);

  final BuildContext context;
  final CoinItem coin;
  final bool isExpanded;

  @override
  State<CoinButton> createState() => _CoinButtonState();
}

class _CoinButtonState extends State<CoinButton> {
  Widget isFiat(CoinItem coinRevice) {
    if (!coinRevice.fiat) {
      return SizedBox(
        width: MediaQuery.of(widget.context).size.height * 0.05,
        child: CupertinoSwitch(
          value: coinRevice.active,
          onChanged: (bool value) {
            //setState(() {
            //  coinRevice.active = value;
            //});
            /// todo: both options working, it needs a new test
            /// for the provider status
            context.read<MenuProvider>().setActiveStatus(coinRevice, value);
            context.read<MenuProvider>().activeCoinPortfolio(coinRevice, value);
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 2.5,
        //   color: const Color(0xFF0C4F83),
        // ),
        gradient: const LinearGradient(colors: [
          Color(0xffECE9E6),
          Colors.white,
        ],),
        borderRadius: widget.isExpanded 
        ? const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)) 
        : const BorderRadius.all(Radius.circular(12.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
              width: 45,
              //width: MediaQuery.of(context).size.width * 0.15,
              child: widget.coin.coinIcon,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.coin.coinName),
                  Text(
                    "${widget.coin.usdCost} USD",
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.coin.coin),
                  Text(
                    "${widget.coin.btcCost}",
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 30, color: Color(0xff7D7676),),
            
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
              //width: MediaQuery.of(context).size.width * 0.175,
              width: 60,
              //child: coin.coinIcon,
              child: isFiat(widget.coin),
            ),
          ],
        ),
      ),
    );
  }
}

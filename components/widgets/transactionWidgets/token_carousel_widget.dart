
import 'dart:ui';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/modules/general/classes.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TokenCarouselWidget extends StatelessWidget {
  final bool    fiat;
  final bool    received;
  final bool    amount;
  final double? top;
  final String? text;
  final bool?   detail;

  ///  Horizontal scrolleable token selection
  ///- [fiat] true: shows all token list
  ///- [fiat] false: shows only tokens
  ///- [amount] true: show selectioned tokenamount
  ///- [amount] false: dont show amount data
  ///- [received] true: derive selectioned token to received provider token
  ///- [received] false: default token provider
  ///- nulleable [top] if needs to put mobile padding top
  ///- nulleable [text] only for [amount] true value
  ///- nulleable [detail] true: show detail button only for [amount] true value
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const TokenCarouselWidget({
    required this.fiat,
    required this.amount,
    required this.received,
    this.top,
    this.text,
    this.detail,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OpacityAnimatedWidget.tween(
      enabled         : true,
      opacityDisabled : 0,
      opacityEnabled  : 1,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //------------------------------------------------------------- EMPTY SPACE
          Offstage(
            offstage : amount,
            child    : SizedBox(height: (top??0) + 40)
          ),
          //------------------------------------------------------- TRANSACTION TITLE
          Offstage(
            offstage : !amount,
            child    :
            Container(
              padding   : const EdgeInsets.only(left: 20),
              alignment : Alignment.centerLeft,
              width     : size.width,
              child     : Text(text??'', style: Skin.tokenTextStyle(title: true)),
            )
          ),
          //----------------------------------------------- TOP SELECTIONED INDICATOR
          Offstage(
            //offstage : WidgetsBinding.instance.window.viewInsets.bottom != 0.0 && !amount,
            offstage: false,
            child    :
            Container(
              alignment : Alignment.center,
              width     : size.width,
              child     : Icon(Icons.arrow_drop_down, color: Colors.white.withOpacity(0.5))
            )
          ),
          //---------------------------------------------------------- TOKEN CAROUSEL
          Offstage(
            //offstage : WidgetsBinding.instance.window.viewInsets.bottom != 0.0 && !amount,
            offstage: false,
            child    :
            Consumer<DataProvider>(builder: (context, data, child) {
              //token filter
              List<Token> tokens = !fiat? data.tokens.where((token)=> token.token == true).toList() : data.tokens;
              return CarouselSlider(
                options:
                CarouselOptions(
                  onPageChanged     : (index, reason) => data.changeToken(index, !received),
                  height            : 50,
                  autoPlay          : false,
                  enlargeCenterPage : true,
                  viewportFraction  : 0.15,
                  aspectRatio       : 0.5,
                  initialPage       : 0,
                ),
                items: tokens.map((e) => Image.asset(e.logo, width: size.width * 0.15, height: 40)).toList()
              );
            }
            )
          ),
          //---------------------------------------------- DOWN SELECTIONED INDICATOR
          Offstage(
            //offstage : WidgetsBinding.instance.window.viewInsets.bottom != 0.0 && !amount,
            offstage: false,
            child    :
            Container(
              alignment : Alignment.center,
              width     : size.width,
              child     : Icon(Icons.arrow_drop_up, color: Colors.white.withOpacity(0.5))
            )
          ),
          //---------------------------------------------------------- AMOUNT OUTPUTS
          Offstage(
            offstage : amount,
            child    :
            Padding(
              padding : const EdgeInsets.all(20),
              child   :
              Row(
                mainAxisAlignment : MainAxisAlignment.spaceBetween,
                children          : [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2-25,
                    child: Text(
                      context.watch<DataProvider>().token.name,
                      style: Skin.tokenTextStyle(name: true),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2-25,
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      mainAxisAlignment  : MainAxisAlignment.end,
                      children           : [

                        Consumer<DataProvider>(builder: (context, data, child){
                          String main   = data.token.amount.toString().split('.').first;
                          String period = data.token.amount.toString().split('.').last;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(main,    style: Skin.tokenTextStyle(amount: true)),
                              Text('.',     style: Skin.tokenTextStyle(amount: true)),
                              Text(period,  style: Skin.tokenTextStyle(amount: true, short: true),),
                            ]
                          );
                        }),

                        const SizedBox(height: 5),

                        Text(
                          '\$ '+ context.watch<DataProvider>().token.usd.toStringAsFixed(2),
                          style: Skin.tokenTextStyle(usd: true)
                        ),
                      ]
                    ),
                  )
                ]
              )
            )
          ),
          //----------------------------------------------- INPUT TEXT AND INDICATORS
          Offstage(
            offstage : !amount,
            child    :
            Column(
              mainAxisSize : MainAxisSize.min,
              children     : [
                //...................................................................
                Container(
                  width   : size.width,
                  padding : const EdgeInsets.only(top: 0, left: 20, right: 20),
                  child   :
                  CupertinoTextField(
                    padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    textAlign        : TextAlign.right,
                    decoration       : Skin.inputDecoration(transparent: false),
                    style            : Skin.inputTextStyle(amount: true),
                    placeholder      : '0.00000000',
                    readOnly         : received,
                    keyboardType     : TextInputType.number,
                    inputFormatters  : [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))],
                    onTap            : ()=>{},
                    onChanged        : (String text) {},
                    suffix           :
                    Padding(
                      padding : const EdgeInsets.only(right: 10),
                      child   : Text(
                        received
                        ?context.watch<DataProvider>().receiveToken.symbol
                        :context.watch<DataProvider>().token.symbol,
                        style: Skin.inputTextStyle(amount: true),
                      )
                    )
                  )
                ),
                //...................................................................
                received
                ? Container(
                  padding   : const EdgeInsets.only(right: 20, top: 10),
                  alignment : Alignment.centerRight,
                  child     :
                  Visibility(
                    visible: detail!,
                    child:
                    InkWell(
                      onTap : () {showDialog(
                context: context,
                builder: (_) => const ImageDialog(),
                barrierColor: const Color(0x33FFFFFF),
              );},
                      child : Text('Ver detalle', style: Skin.textButtonTextStyle())
                    )
                  )
                )
                : Padding(
                  padding : const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child   :
                  Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children          : [
                      Text(
                        'SALDO ' + context.watch<DataProvider>().token.amount.toString(),
                        style: Skin.textButtonTextStyle(max: true)
                      ),
                      InkWell(
                        onTap : () {},
                        child : Text('Máx', style: Skin.textButtonTextStyle(max: true))
                      )
                    ]
                  )
                )
                //...................................................................
              ],
            )
          ),
          //-------------------------------------------------------------------------
        ]
      )
    );
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //gestureDetector
        child: Container(
          padding: EdgeInsets.zero,
          width: 275,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0x330C4F83), width: 2.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Detalle",
                  style: TextStyle(
                    color: Color(0xFF0A5F93),
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 225,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Comisión",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "0.00 BTC\nUSD 0.00",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 225,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Cantidad final",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "0.00 BTC\nUSD 0.00",
                      style: TextStyle(
                        color: Color(0xFF0C4F83),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:bank9780/properties/waves.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TargetWidget extends StatefulWidget {
  const TargetWidget({ Key? key }) : super(key: key);

  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  bool      flip = false;
  Duration? duration;
  bool      direction = true;
  int       position = 1;
  List<bool> dots = [false, true, false];
  @override
  void initState() {
    duration = const Duration(milliseconds: 500);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onHorizontalDragUpdate : (detail) => setState(()=> direction = detail.delta.dx > 0),
          onHorizontalDragEnd    : (detail) => !flip? changeState() : null,
          child             :
          TranslationAnimatedWidget(
            curve   : Curves.easeOut,
            enabled : true,
            values  : const [
                Offset(0, 200),
                Offset(0, 250),
                Offset(0, 0),
                Offset(0, -100),
                Offset(0, 0),
            ],
            child:
            SizedBox(
              width  : 340,
              height : 230,
              child  :
              Stack(
                children: [
                  Positioned(
                    top    : 20,
                    width  : 340,
                    height : 200,
                    child  :
                    ShakeAnimatedWidget(
                      enabled: flip,
                      duration: duration!,
                      shakeAngle: Rotation.deg(z: 20),
                      curve: Curves.linear,
                      child:
                      Stack(
                        children: [
                          Positioned(
                            top   : 4,
                            left  : 4,
                            child :
                            ClipPath(
                              clipper : MaxPath(),
                              child   :
                              Container(
                                padding: const EdgeInsets.only(top: 40, right: 20, bottom: 35),
                                color  : Tint.blue.accent10,
                                width  : 336,
                                height : 196,
                              ),
                            )
                          ),
                          ClipPath(
                            clipper : MaxPath(),
                            child   :
                            Container(
                              padding    : const EdgeInsets.only(top: 40, right: 20, bottom: 35),
                              decoration : Skin.gradientDecoration(bannerBig: true),
                              width      : 336,
                              height     : 196,
                              child      :
                              Consumer<DataProvider>(builder: (context, data, child)=>
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          position == 0 ? data.tokens[data.tokens.indexWhere(
                                            (element) => element.symbol == 'USD'
                                          )].usd.toStringAsFixed(2):
                                          position == 2 ? data.tokens[data.tokens.indexWhere(
                                            (element) => element.symbol == 'PEN'
                                          )].usd.toStringAsFixed(2):
                                          data.tokens.first.usd.toStringAsFixed(2),
                                          style: Skin.bannerTargetTextStyle(usdAmount: true)
                                        ),
                                        Text(
                                          'USD',
                                          style: Skin.bannerTargetTextStyle(usdTitle: true)
                                        )
                                      ]
                                    ),
                                    Text(
                                      position == 0 ? data.tokens[data.tokens.indexWhere(
                                        (element) => element.symbol == 'USD'
                                      )].name:
                                      position == 2 ? data.tokens[data.tokens.indexWhere(
                                        (element) => element.symbol == 'PEN'
                                      )].name:
                                      data.tokens.first.name,
                                      style: Skin.bannerTargetTextStyle(name: true)
                                    )
                                  ]
                                )
                              ),
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  Positioned(
                    left    : 22,
                    width  : 186,
                    height : 205,
                    child  :
                    TranslationAnimatedWidget(
                      enabled  : true,
                      curve    : Curves.easeIn,
                      duration : duration!,
                      values   : [
                        const Offset(0, 0),
                        Offset(0, flip? -50 : 0),
                        const Offset(0, 0),
                      ],
                      child:
                      Stack(
                        children: [
                          ClipPath(
                            clipper : MinPath(),
                            child   :
                            Container(
                              decoration : Skin.gradientDecoration(shadow: true),
                              width      : 186,
                              height     : 205,
                            )
                          ),
                          Positioned(
                            left  : 3,
                            top   : 2,
                            child :
                            ClipPath(
                              clipper : MinPath(),
                              child   :
                              Container(
                                padding    : const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                                decoration : Skin.gradientDecoration(bannerSmall: true),
                                width      : 180,
                                height     : 200,
                                child      :
                                Consumer<DataProvider>(builder: (context, data, child)=>
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            position == 0 ? data.tokens[data.tokens.indexWhere(
                                              (element) => element.symbol == 'USD'
                                            )].amount.toStringAsFixed(2):
                                            position == 2 ? data.tokens[data.tokens.indexWhere(
                                              (element) => element.symbol == 'PEN'
                                            )].amount.toStringAsFixed(2):
                                            data.tokens.first.amount.toStringAsFixed(8),
                                            style: Skin.bannerTargetTextStyle(amount: true)
                                          ),
                                          Text(
                                            'BALANCE',
                                            style: Skin.bannerTargetTextStyle(balance: true)
                                          ),
                                        ]
                                      ),
                                      Text(
                                        position == 0 ? data.tokens[data.tokens.indexWhere(
                                          (element) => element.symbol == 'USD'
                                        )].symbol:
                                        position == 2 ? data.tokens[data.tokens.indexWhere(
                                          (element) => element.symbol == 'PEN'
                                        )].symbol:
                                        data.tokens.first.symbol,
                                        style: Skin.bannerTargetTextStyle(symbol: true)
                                      )
                                    ]
                                  )
                                )
                              )
                            )
                          ),
                        ]
                      )
                    )
                  ),
                ]
              )
            )
          )
        ),
        Padding(
          padding : const EdgeInsets.only(top: 20),
          child   :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dots.map((e) => !e
              ? TranslationAnimatedWidget(
                curve     : Curves.easeInOut,
                duration  : const Duration(milliseconds: 250),
                enabled   : true,
                values    : const [ Offset(0, -10), Offset(0, 10), Offset(0, 0) ],
                child     :
                Padding(
                  padding : const EdgeInsets.symmetric(horizontal: 5),
                  child   : Icon(Icons.radio_button_unchecked, color: Tint.blue.accent10, size: 14)
                )
              )
              : TranslationAnimatedWidget(
                curve     : Curves.easeInOut,
                duration  : const Duration(milliseconds: 250),
                enabled   : true,
                values    : const [ Offset(0, 10), Offset(0, -10), Offset(0, 0) ],
                child     :
                const Padding(
                  padding : EdgeInsets.symmetric(horizontal: 5),
                  child   : Icon(Icons.circle, color: Colors.white, size: 14)
                )
              )
            ).toList()
          ),
        )
      ]
    );
  }

  changeState(){
    setState((){
      flip = true;
      position =  direction
        ? position == 2? 0 : position + 1
        : position == 0? 2 : position - 1;
      for (int i = 0; i <= 2; i++){
        dots[i] = i == position;
      }
    });
    Future.delayed(duration!, ()=> setState(()=> flip = false));
    // print(direction? 'right' : 'left');
    // print(position);
  }
}
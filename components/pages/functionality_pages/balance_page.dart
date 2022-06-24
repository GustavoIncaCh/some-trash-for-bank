import 'package:bank9780/components/widgets/target_widget.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modules/provider/data_provider.dart';
import '../../../modules/provider/operation_provider.dart';

class BalancePage extends StatefulWidget {
  ///  Receive Data Page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const BalancePage({Key? key}) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  List<bool> switchers = [true, true, true];
  int active = 3;
  bool showMenu = false;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    
  List<Widget> imageSliders = context
        .read<DataProvider>()
        .tokens
        .map((item) => Container(
              height: 100,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(item.logo),
                      Text(
                        item.symbol,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  )),
            ))
        .toList();

    return SizedBox.expand(
        child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('Hola ' + context.watch<OperationProvider>().loginData['names'].toString().split(' ').first, style: Skin.navigatorTextStyle(),),
        const TargetWidget(),
            Center(
              child: SizedBox(
                width: 175,
                height: 125,
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 50,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 0.5,
                      viewportFraction: 0.35,
                      onPageChanged: (index, reason) {
                        //setState() {
                        //debugPrint(index.toString());
                        //};
                      }),
                ),
              ),
            ),
        //TranslationAnimatedWidget(
        //    curve: Curves.easeOut,
        //    enabled: true,
        //    values: const [
        //      Offset(0, 100),
        //      Offset(0, -100),
        //      Offset(0, 0),
        //    ],
        //    child: Container(
        //        padding: const EdgeInsets.all(20),
        //        decoration: Skin.floatingContainerDecoration(),
        //        margin: EdgeInsets.only(
        //            left: 20,
        //            right: 20,
        //            top: 20,
        //            bottom:
        //                WidgetsBinding.instance!.window.viewInsets.bottom + 30),
        //        alignment: Alignment.center,
        //        child: Column(children: [
        //          Text('Total Valuado',
        //              style: Skin.blackTextStyle(title: true)),
        //          Padding(
        //            padding: const EdgeInsets.only(top: 10),
        //            child: Text('00000000.00000000',
        //                style: Skin.blackTextStyle(payAmount: true)),
        //          )
        //        ])))
      ]),
    ));
  }

  counter(int index, bool val) {
    int count = 0;
    for (var i in switchers) {
      i == true ? count++ : null;
    }
    debugPrint(count.toString());
    count == 1
        ? setState(() => switchers[index] = true)
        : setState(() => switchers[index] = val);

    count = 0;
    for (var i in switchers) {
      i == true ? count++ : null;
    }
    setState(() => active = count);
  }
}
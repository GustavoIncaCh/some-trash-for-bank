import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/search_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modules/general/button_class.dart';
import '../../../modules/provider/menu_provider.dart';

class Servicespage extends StatefulWidget {
  const Servicespage({Key? key}) : super(key: key);

  @override
  _ServicespageState createState() => _ServicespageState();
}

class _ServicespageState extends State<Servicespage> {

  PageController pageController = PageController();
  TextEditingController searchController = TextEditingController();
  bool showList     = false;
  bool showSearch   = false;
  bool searchTyping = false;

  // searchWidget added
  // -------------------------------------------------------------------
  late List<CoinItem> coinsItems = context.read<MenuProvider>().allCoins;
  String query = '';
  double totalCoin = 0.0;

  void searchCoin(String query) {
    totalCoin = 0.0;
    final coins = context.read<MenuProvider>().allCoins.where((coin) {
      final titleLower = coin.coin.toLowerCase();
      final authorLower = coin.coinName.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    for (int i = 0; i < coins.length; i++) {
      totalCoin = totalCoin + coins[i].btcCost;
      //print("object $totalCoin");
    }
    setState(() {
      this.query = query;
      coinsItems = coins;
    });
  }
  // -------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Column(
          children: [
            Flexible(
              child:
              Column(
                children: [
                  Container(
                    margin     : const EdgeInsets.only(top: 70, bottom: 10, left: 10, right: 10),
                    padding    : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    // decoration : Skin.dropDownDecoration(true),
                    // ignore: todo
                    // TODO: add the searchCoin method here, from portfolio
                    //child      :
                    //CupertinoTextField(
                    //  controller       : searchController,
                    //  padding          : const EdgeInsets.all(8),
                    //  autofocus        : false,
                    //  maxLines         : 1,
                    //  textAlign        : TextAlign.left,
                    //  decoration       : Skin.inputDecoration(),
                    //  style            : Skin.inputTextStyle(),
                    //  placeholder      : 'Buscar empresa o servicio',
                    //  readOnly         : false,
                    //  enabled          : true,
                    //  onChanged        : (String text) => {},
                    //  suffix           : const Icon(Icons.search, color: Colors.black54,)
                    //)
                    child: SearchWidget(text: query,onChanged: searchCoin,hintText: "Buscar empresa o servicio"),
                  ),
                  Expanded(
                    child:
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                      Consumer<DataProvider>(builder: (context, data, child) =>
                        ListView.separated(
                          separatorBuilder: (context, i) => Container(
                            height: 1,
                            color: Tint.blue.accent8,
                          ),
                          physics     : const BouncingScrollPhysics(),
                          // controller: scrollController,
                          padding     : const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          itemCount   : data.companies.length,
                          itemBuilder : (context, index) =>
                          TranslationAnimatedWidget(
                            curve   : Curves.easeOut,
                            enabled : true,
                            values  : [
                                Offset(index % 2 == 0? size .width* -1 : size.width, 0),
                                const Offset(0, 0),
                            ],
                            child:
                            InkWell(
                              onTap : (){},
                              child :
                              Container(
                                alignment: Alignment.center,
                                padding   : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                child     :
                                Text(
                                  data.companies[index].name,
                                  textAlign : TextAlign.start,
                                  style     : Skin.textButtonTextStyle()
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                ]
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
                margin  : const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
                padding : const EdgeInsets.all(20),
                decoration: Skin.floatingContainerDecoration(),
                height  : 180,
                child   :
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment  : MainAxisAlignment.start,
                      crossAxisAlignment : CrossAxisAlignment.start,
                      mainAxisSize       : MainAxisSize.min,
                      children: [
                        Text('Código de servicio', style: Skin.blueTextStyle(title: true)),
                        Container(
                          padding : const EdgeInsets.symmetric(vertical: 5),
                          child   :
                          CupertinoTextField(
                            controller       : searchController,
                            padding          : const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            autofocus        : false,
                            maxLines         : 1,
                            textAlign        : TextAlign.left,
                            decoration       : Skin.inputDecoration(),
                            style            : Skin.inputTextStyle(),
                            placeholder      : 'Buscar empresa o servicio',
                            readOnly         : false,
                            enabled          : true,
                            onChanged        : (String text) => {},
                            suffix           : const Icon(Icons.search, color: Colors.black54,)
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Registrar Pago', style: Skin.textButtonTextStyle(register: true)),
                            Icon(Icons.star_border_rounded, color: Tint.blue.accent5)
                          ]
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap : () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            pageController.jumpToPage(1);
                          },
                          child :
                          Container(
                            padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration : Skin.buttonDecoration(),
                            child      : Text('SIGUIENTE', style: Skin.textButtonTextStyle())
                          )
                        )
                      ]
                    )
                  ]
                )
              )
            )
          ]
        ),
        Column(
          children: [
            Container(
              decoration: Skin.gradientDecoration(),
              child:
              const TokenCarouselWidget(
                top      : 0  ,
                fiat     : true ,
                amount   : false,
                received : false,
              )
            ),
            // TabsWidget(size: widget.size),
            Expanded(
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:
                      Text(
                        'SOCIEDAD ELÉCTRICA DEL SUR OESTE S.A.',
                        style: Skin.blackTextStyle(title: true),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text('Monto a pagar',
                          ),
                          const SizedBox(height: 5),
                          Text('S/. 100.00',style: Skin.blackTextStyle(payAmount: true)),
                        ]
                      ),
                      SizedBox(
                        height: 95,
                        width: 140,
                        child:
                        ListView.builder(
                          physics     : const BouncingScrollPhysics(),
                          padding     : EdgeInsets.zero,
                          itemCount   : 3,
                          itemBuilder : (context, index) =>
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('S/. 80.00',
                                  // style: Skin.textStyle(1, true, 15)
                                ),
                                Icon(Icons.check_box_outline_blank_sharp)
                              ],
                            )
                          )
                        )
                      ),
                      ]
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('COMISIÓN',
                                // style: Skin.textStyle(2, true, 15)
                              ),
                              Text('S/. 5.00',
                                // style: Skin.textStyle(1, true, 15)
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('MONTO FINAL',
                                // style: Skin.textStyle(2, true, 15)
                              ),
                              Text('S/. 105.00',
                                // style: Skin.textStyle(1, true, 15)
                              ),
                            ],
                          )
                        )
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child:
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap : () {},
                            child :
                            Container(
                              padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration : Skin.buttonDecoration(),
                              child      : Text('ACEPTAR', style: Skin.textButtonTextStyle())
                            )
                          ),
                          InkWell(
                            onTap : () {}, //pageController.jumpToPage(0),
                            child :
                            Container(
                              padding    : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child      : Text('CANCELAR',
                                style: Skin.textButtonTextStyle(cancel: true)
                              )
                            )
                          )
                        ]
                      )
                    ),
                  ]
                )
            )
          ]
        )
      ]
    );
  }
}

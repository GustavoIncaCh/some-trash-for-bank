import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/portfolio_list_modal.dart';
import 'package:bank9780/components/widgets/search_widget.dart';
import 'package:bank9780/properties/skin_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

// ignore: implementation_imports, unnecessary_import
import 'package:provider/src/provider.dart';

import '../../modules/provider/menu_provider.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late List<CoinItem> coinsItems = context.read<MenuProvider>().allCoins;
  String query = '';
  bool _lights = true;
  double totalCoin = 0.0;
  bool notFiatState = true;
  Map notFiatStateLis = {};
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    //coinsItems = MenuProvider().allCoins;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        appBarName: 'PORTAFOLIO',
      ),
      body: Consumer(
        builder: (context, value, child) => ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20),
                Text(
                        "${context.watch<MenuProvider>().sum} ${context.watch<MenuProvider>().active}",
                        style: //SkinText.PageTextDecoration(),
                        const TextStyle(color: Color(0xff0C4F83), fontSize: 26)
                      ),
                
                const SizedBox(height: 10),
                const Text(
                        "Total valorizado en",
                        style: //SkinText.PageTextDecoration(),
                        TextStyle(color: Color(0xff3C3C3B), fontSize: 14)
                      ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Text("BTC"),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10),
                    //   child: CupertinoSwitch(
                    //     value: _lights,
                    //     onChanged: (bool value) {
                    //       setState(() {
                    //         _lights = value;
                    //         context
                    //             .read<MenuProvider>()
                    //             .totalPortfolio(value);
                    //       });
                    //     },
                    //   ),
                    // ),
                    // const Text("USD"),
                    CupertinoSlidingSegmentedControl<int>(
                      backgroundColor:  const Color(0xffD9D9D9),
                      thumbColor: const Color(0xff25B60D),
                      //padding: const EdgeInsets.all(8),
                      groupValue: groupValue,
                      children: const {
                        0: Text("PEN",style: TextStyle(fontSize: 22,
                            color: Colors.white),),
                        1: Text("USD",style: TextStyle(fontSize: 22,
                            color: Colors.white),),
                        2: Text("BTC",style: TextStyle(fontSize: 22,
                            color: Colors.white),),
                      },
                      onValueChanged: (value){
                        setState(() {
                          groupValue = value!;
                            context
                                .read<MenuProvider>()
                                .totalPortfolio(value);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),

                /// here we create the search button
                /// in the Onchanged state we call a function
                /// for the comparition of the text in the
                /// searchbox with the items in the list of coins
                SearchWidget(
                  text: query,
                  hintText: 'Tipo de Moneda',
                  onChanged: searchCoin,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width * 0.925,
                  //revisar el child ------------
                  child: ListView.builder(
                    itemCount: coinsItems.length,

                    /// here we have the index of the list, we can acces
                    /// the list of coins here
                    itemBuilder: (context, index) {
                      final coin = context.read<MenuProvider>().allCoins[
                          context.watch<MenuProvider>().allCoins.indexWhere(
                              (element) => element == coinsItems[index])];

                      /// Here we call the function to create
                      /// the box of the coinItem, we must call
                      /// the item from the list of CoinItems
                      /// CoinItems is located in "list_porfolio.dart"
                      return ExpandableNotifier(
                        child: ScrollOnExpand(
                          child: Column(
                            children: [
                              Builder(
                                builder: (context) {
                                  var controller = ExpandableController.of(
                                      context,
                                      required: true)!;
                                  return TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF635E5E)),
                                    ),
                                    child: Expandable(
                                      collapsed: CoinButton(
                                          context: context, coin: coin, isExpanded: false,),
                                      expanded: Column(
                                        children: [
                                          CoinButton(
                                              context: context, coin: coin, isExpanded: true,),
                                          Container(
                                            decoration: const BoxDecoration(
                                              // border: Border(
                                              //   bottom: BorderSide(
                                              //     width: 2.5,
                                              //     color: Color(0xFF0C4F83),
                                              //   ),
                                              //   left: BorderSide(
                                              //     width: 2.5,
                                              //     color: Color(0xFF0C4F83),
                                              //   ),
                                              //   right: BorderSide(
                                              //     width: 2.5,
                                              //     color: Color(0xFF0C4F83),
                                              //   ),
                                              // ),
                                              gradient: LinearGradient(colors: [
                                                Color(0xffECE9E6),
                                                Colors.white,
                                              ],),
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0,
                                                  right: 16,
                                                  left: 16,
                                                  bottom: 4),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    coin.wallet,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.share_outlined),
                                                    onPressed: () {
                                                      // share button - share_plus 4.0.4 from pub.dev
                                                      Share.share(
                                                          coin.wallet);
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.copy_rounded),
                                                    onPressed: () {
                                                      Clipboard.setData(
                                                        ClipboardData(
                                                            text:
                                                                coin.wallet),
                                                      );
                                                      showToast(
                                                          "Billetera copiada",
                                                          context: context,
                                                          backgroundColor: const Color
                                                              .fromARGB(255, 61,
                                                                  54, 54),
                                                          animation:
                                                              StyledToastAnimation
                                                                  .slideFromBottomFade,
                                                          reverseAnimation:
                                                              StyledToastAnimation
                                                                  .slideToTopFade,
                                                          animDuration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          duration:
                                                              const Duration(
                                                                  seconds: 3),
                                                          curve: Curves
                                                              .elasticOut,
                                                          reverseCurve: Curves
                                                              .elasticIn,
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                  Radius.circular(
                                                                      20)));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.toggle();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

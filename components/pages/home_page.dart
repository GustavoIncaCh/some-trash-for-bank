import 'dart:ui';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/pages/functionality_pages/balance_page.dart';
import 'package:bank9780/components/pages/functionality_pages/buy_page.dart';
import 'package:bank9780/components/pages/functionality_pages/exchange_page.dart';
import 'package:bank9780/components/pages/functionality_pages/receive_page.dart';
import 'package:bank9780/components/pages/functionality_pages/sell_page.dart';
import 'package:bank9780/components/pages/functionality_pages/send_page.dart';
import 'package:bank9780/components/pages/functionality_pages/services_page.dart';
import 'package:bank9780/components/pages/welcome_page.dart';
import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/components/widgets/overlays/simple_drawer_overlay.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/provider/operation_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Menu elements for positions List
  List<int> items = [2, 3, 4, 5, 6];
  int index = 4;

  /// Menu active indicator List
  List<bool> active = [
    /* 0 - menu1[0] */ false,
    /* 1 - menu1[1] */ false,
    //-----------------------
    /* 2 - items[0] */ false,
    /* 3 - items[1] */ false,
    /* 4 - items[2] */ true,
    /* 5 - items[3] */ false,
    /* 6 - items[4] */ false,
    //-----------------------
    /* 7 - menu2[0] */ false,
    /* 8 - menu2[1] */ false,
  ];

  bool subMenu1 = false;
  bool subMenu2 = false;

  /// Menu title Strings List
  List<String> menus = [
    /* 0 - menu1[0] */ 'Enviar',
    /* 1 - menu1[1] */ 'Recibir',
    //-------------------------------------
    /* 2 - items[0] */ 'operation'.tr(),
    /* 3 - items[1] */ 'exchange'.tr(),
    /* 4 - items[2] */ 'home'.tr(),
    /* 5 - items[3] */ 'services'.tr(),
    /* 6 - items[4] */ 'buySell'.tr(),
    //-------------------------------------
    /* 7 - menu2[0] */ 'Comprar',
    /* 8 - menu2[1] */ 'Vender',
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10), () {
      context.read<DataProvider>().changeToken(0, true);
      context.read<DataProvider>().changeType();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        //Navigator.pop(context);
        showDialog(context: context, builder: (_) => const DialogPop(),barrierColor: Colors.transparent);
        return false;
      },
      child: Scaffold(
        drawer: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),child: const BankMenuDrawer()),
        drawerScrimColor: Colors.transparent,
        //drawer: BankDrawer(),
        ///---------------------------------------------------------------------------------------
        //appBar: AppBar(title: Row(
        //  mainAxisAlignment: MainAxisAlignment.center,
        //  children: [
        //    index != 4 ? Text(menus[index]) : Image.asset('lib/assets/img/logo_green.png', height: 40),
        //  ],
        //),
        //              centerTitle: true,
        //              backgroundColor: const Color(0xff154579),
        //              shadowColor: Colors.transparent,
        //              elevation: 0,
        //              actions: [IconButton(
        //        //style: ButtonStyle(
        //        //  backgroundColor: MaterialStateProperty.all<Color>(
        //        //    const Color(0xff154579),
        //        //  ),
        //        //),
        //        onPressed: () => Routes.notify(context),
        //        //child: const Icon(
        //        //  Icons.notifications,
        //        //  size: 30,
        //        //),
        //        icon: Stack(
        //          children: [
        //            const Icon(
        //              Icons.notifications_none,
        //              size: 34,
        //            ),
        //            Positioned(
        //              right: 0,
        //              child: Container(
        //                padding: const EdgeInsets.all(1),
        //                decoration: BoxDecoration(
        //                  color: Colors.red,
        //                  borderRadius: BorderRadius.circular(6),
        //                ),
        //                constraints: const BoxConstraints(
        //                  minWidth: 15,
        //                  minHeight: 14,
        //                ),
        //                child: const Text(
        //                  '10',
        //                  style: TextStyle(
        //                    color: Colors.white,
        //                    fontSize: 12,
        //                  ),
        //                  textAlign: TextAlign.center,
        //                ),
        //              ),
        //            )
        //            //Positioned(
        //            //  top: 0.0,
        //            //  right: 0.0,
        //            //    child: Icon(
        //            //  Icons.brightness_1,
        //            //  size: 15.0,
        //            //  color: Colors.redAccent,
        //            //))
        //          ],
        //        ),
        //        padding: EdgeInsets.zero,
        //      ),],
        //              ),
        ///---------------------------------------------------------------
        /// keyboard listview problem
        /// with the resize function in offmode
        /// it doesnt show the error, but the
        /// keyboard of the homepage doesn't
        /// resize his own keyboard
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () => hideMenus(),
          child:
          // ignore: todo
          // TODO: nice way to use the listview without list view
          // SingleChildScrollView does support keyboard with movement and scrollview
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child:
                  Stack(
                    children: [
                      Container(
                        decoration: Skin.gradientDecoration()
                        //decoration: Skin.backgroundGradientDecoration(),
                        ),
                      //--------------------------------------------------------------------
                      Column(
                        children: [
                          // ---------------------------------------------------------- Body
                          Expanded(
                            child:
                            Stack(
                              children:[
                                // --------------------------------------------------- Pages
                                index == 0 ? const SendPage():
                                index == 1 ? const ReceivePage():
                                //-------------------------------------------------
                                index == 3 ? const ExchangePage():
                                index == 4 ? const BalancePage():
                                index == 5 ? const Servicespage():
                                //-------------------------------------------------
                                index == 7 ? const BuyPage():
                                             const SellPage(),
                                // ---------------------------------------------------- Menu
                                NavigatorWidget(
                                  logo  : true,
                                  body  : index > 6 && MediaQuery.of(context).viewInsets.bottom != 0? true: false,
                                  text  : index == 4 ? 'Hola ' + context.watch<OperationProvider>().loginData['names'].toString().split(' ').first : menus[index]
                                  //text  : index == 4 ? 'Hola ' + context.watch<UserProvider>().user.name.split(' ').first : menus[index]
                                )
                              ]
                            )
                          ),
                          SizedBox(height: MediaQuery.of(context).viewInsets.bottom != 0? 10: 60)
                          // ---------------------------------------------------------------
                        ]
                      ),
                      // ----------------------------------------------------- DropUp Menu 1
                      MediaQuery.of(context).viewInsets.bottom != 0?
                      const SizedBox.shrink():
                      Positioned(
                        left   : 20,
                        bottom : 65,
                        child  :
                        SizeAnimatedWidget(
                          enabled  : subMenu1,
                          duration : const Duration(milliseconds: 150),
                          values   : const [Size(0, 0),  Size(130, 110)],
                          curve    : Curves.linear,
                          child    :
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            child:
                            BackdropFilter(
                              filter : ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child  :
                              Container(
                                padding    : const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
                                decoration : Skin.menuDecoration(),
                                child      :
                                ListView(
                                  padding : EdgeInsets.zero,
                                  children: [
                                    InkWell(
                                      onTap : () => setState(() {
                                        subMenu1  = false;
                                        active[0] = true;
                                        active[1] = false;
                                        index     = 0;
                                      }),
                                      child     :
                                      Container(
                                        alignment  : Alignment.center,
                                        decoration : Skin.menuItemDecoration(active: active[0]),
                                        padding    : const EdgeInsets.symmetric(vertical: 7),
                                        width      : 90,
                                        // height     : 25,
                                        child      : Text(menus[0], style: Skin.menuTextStyle(submenu: true, active: active[0]))
                                      )
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap : () => setState(() {
                                        subMenu1  = false;
                                        active[0] = false;
                                        active[1] = true;
                                        index     = 1;
                                      }),
                                      child     :
                                      Container(
                                        alignment  : Alignment.center,
                                        decoration : Skin.menuItemDecoration( active: active[1]),
                                        padding    : const EdgeInsets.symmetric(vertical: 7),
                                        width      : 90,
                                        // height     : 25,
                                        child      : Text(menus[1], style: Skin.menuTextStyle(submenu: true, active: active[1]))
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                          )
                        )
                      ),
                      // ----------------------------------------------------- DropUp Menu 2
                      MediaQuery.of(context).viewInsets.bottom != 0?
                      const SizedBox.shrink():
                      Positioned(
                        right  : 20,
                        bottom : 65,
                        child  :
                        SizeAnimatedWidget(
                          enabled  : subMenu2,
                          duration : const Duration(milliseconds: 150),
                          values   : const [Size(0, 0),  Size(130, 110)],
                          curve    : Curves.linear,
                          child    :
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            child:
                            BackdropFilter(
                              filter : ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child  :
                              Container(
                                padding     : const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
                                decoration  : Skin.menuDecoration(),
                                child       :
                                ListView(
                                  padding : EdgeInsets.zero,
                                  children: [
                                    InkWell(
                                      onTap : () => setState(() {
                                        subMenu2  = false;
                                        active[7] = true;
                                        active[8] = false;
                                        index     = 7;
                                      }),
                                      child     :
                                      Container(
                                        alignment  : Alignment.center,
                                        padding    : const EdgeInsets.symmetric(vertical: 7),
                                        decoration : Skin.menuItemDecoration(active: active[7]),
                                        width      : 90,
                                        // height     : 25,
                                        child      : Text(menus[7], style: Skin.menuTextStyle(submenu: true, active: active[7]))
                                      )
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap : ()=> setState(() {
                                        subMenu2  = false;
                                        active[7] = false;
                                        active[8] = true;
                                        index     = 8;
                                      }),
                                      child     :
                                      Container(
                                        alignment  : Alignment.center,
                                        decoration : Skin.menuItemDecoration( active: active[8]),
                                        padding    : const EdgeInsets.symmetric(vertical: 7),
                                        width      : 90,
                                        // height     : 25,
                                        child      : Text(
                                          menus[8],
                                          style: Skin.menuTextStyle(submenu: true, active: active[8])
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                          )
                        )
                      ),
                      // ------------------------------------------------------------ Footer
                      MediaQuery.of(context).viewInsets.bottom != 0?
                      const SizedBox.shrink():
                      Positioned(
                        bottom: 0,
                        child:
                        SizedBox(
                          width  : size.width,
                          height : 80,
                          child  :
                          Stack(
                            children: [
                              Positioned(
                                bottom : 0,
                                child  :
                                Container(
                                  padding    : const EdgeInsets.symmetric(vertical: 7),
                                  // decoration : index >= 2 && index <= 6? null : Skin.navigatorDecoration(),
                                  width      : size.width,
                                  height     : 60,
                                  child      :
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                    children          : items.map((e) =>
                                      TranslationAnimatedWidget.tween(
                                        duration            : const Duration(milliseconds: 250),
                                        curve               : Curves.ease,
                                        enabled             : !active[e],
                                        translationEnabled  : const Offset( 0, 0),
                                        translationDisabled : const Offset( 0, 250),
                                        child               :
                                        InkWell(
                                          onTap: ()=> switchMenuItems(e),
                                          child:
                                          SizedBox(
                                            width  : size.width * 0.19,
                                            height : size.width * 0.19,
                                            child  :
                                            Column(
                                              children: [
                                                Icon(
                                                  e == 2 ?  Icons.sync_alt:
                                                  e == 3 ?  Icons.attach_money:
                                                  e == 4 ?  Icons.home:
                                                  e == 5 ?  Icons.account_balance_wallet_outlined:
                                                            Icons.real_estate_agent_outlined,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                Text(         menus[e],
                                                  style: Skin.navigatorTextStyle(footer: true),
                                                  textAlign : TextAlign.center,
                                                  overflow  : TextOverflow.ellipsis
                                                )
                                              ]
                                            )
                                          )
                                        )
                                      )
                                    ).toList()
                                  )
                                )
                              ),
                              Container(
                                padding : const EdgeInsets.all(4),
                                width   : size.width,
                                child   :
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: items.map((e) =>
                                    TranslationAnimatedWidget.tween(
                                      duration            : const Duration(milliseconds: 250),
                                      curve               : Curves.ease,
                                      enabled             : active[e],
                                      translationEnabled  : const Offset( 0, 0),
                                      translationDisabled : const Offset( 0, 250),
                                      child               :
                                      InkWell(
                                        onTap : ()=> switchMenuItems(e),
                                        child :
                                        SizedBox(
                                          width : size.width * 0.18,
                                          child :
                                          Column(
                                            children: [
                                              Container(
                                                decoration : Skin.circularButtonDecoration(footer: true),
                                                width      : size.width * 0.18,
                                                height     : 49,
                                                child      :
                                                Stack(
                                                  children: [
                                                    Center(
                                                      child:
                                                      e != 4 ?
                                                      Icon(
                                                        e == 2 ?  Icons.sync_alt:
                                                        e == 3 ?  Icons.attach_money:
                                                        e == 5 ?  Icons.account_balance_wallet_outlined:
                                                                  Icons.real_estate_agent_outlined,
                                                        color: Colors.white,
                                                        size: 35,
                                                      ):
                                                      Text('9780', style: Skin.navigatorTextStyle(home: true))
                                                    ),
                                                  ]
                                                )
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 7),
                                                child:
                                                Text(         menus[e],
                                                  style: Skin.navigatorTextStyle(footer: true),
                                                  textAlign : TextAlign.center,
                                                  overflow  : TextOverflow.ellipsis
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      )
                                    )
                                  ).toList()
                                )
                              )
                            ]
                          )
                        )
                      ),
                      // -------------------------------------------------------------------
                    ],
                  ),
                ),
              ),
            )
        )
      ),
    );
  }

  hideMenus() => setState(() {
    subMenu1 = false;
    subMenu2 = false;
  });

  switchMenuItems(int index){
    for(int i = 2; i < 7; i++){
      setState(()=> active[i] = i == index? true : false);
    }

    subMenu1 = index == 2? !subMenu1: false;
    subMenu2 = index == 6? !subMenu2: false;

    setState(()=> index != 2 && index != 6 ? this.index = index: null);
  }
}class DialogPop extends StatelessWidget {
  const DialogPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: AlertDialog(
        title: const Text('Cerrar Apliación'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Esta seguro que desea cerrar 9780 Bank.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Salir', style: TextStyle(color: Color(0xff0C4F83)),),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const WelcomePage()),
              ModalRoute.withName('/welcome'));
            },
          ),
        ],
      )
    );
  }
}

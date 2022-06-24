//import 'dart:io';
import 'dart:ui';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/widgets/modals/register_account_modal.dart';
import 'package:bank9780/components/widgets/modals/register_wallet_modal.dart';
import 'package:bank9780/components/widgets/transactionWidgets/item_account_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/item_contact_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/item_token_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/tabs_widget.dart';
import 'package:bank9780/components/widgets/transactionWidgets/token_carousel_widget.dart';
import 'package:bank9780/modules/general/enum.dart';

import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/modules/provider/menu_provider.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SendPage extends StatefulWidget {
  ///  Send transactions Page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const SendPage({Key? key}) : super(key: key);

  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  TextEditingController searchController = TextEditingController();
  bool showList = false;
  bool showSearch = false;
  bool searchTyping = false;
  bool showAlert = false;
  TextEditingController controller = TextEditingController();
  GlobalKey key_pos = GlobalKey(); // declare a global key

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
    return SlidingUpPanel(
      maxHeight: 400,
      minHeight: 50,
      //parallaxEnabled: true,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
      panelBuilder: (sc) => Container(
      decoration:const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffffffff),
                      Color(0xffC1C1C1),
                    ],
                  ),
                  //border: BorderRadius.only(topRight: Radius.circular(45))
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(45))),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
            controller: sc,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: Text(
                  "9780 Bank",
                  style: TextStyle(
                    fontWeight: FontWeight.bold ,
                    fontSize: 18.0,
                    color: Color(0xff0A5F93)
                  ),
                ),
              ),
              Column(children: [
              ]),
            ],
          ),
      ),
    ),
      body: GestureDetector(
        onTap: () => setState(() => showList = false),
        child: SizedBox.expand(
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: TokenCarouselWidget(
              fiat: true,
              top: 0,
              amount: false,
              received: false,
            )),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff2DD8E3),
                        Color(0xff33639C),
                      ],
                    ),
                    //border: BorderRadius.only(topRight: Radius.circular(45))
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(45))),
                //padding: const EdgeInsets.all(40),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cuentas Bancarias",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50,),
                                Container(
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20, top: 5, bottom: 5),
                                    decoration:
                                        Skin.dropdownBoxHeaderDecoration(),
                                    //alignment: Alignment.topLeft,
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(child: Consumer<DataProvider>(
                                              builder: (context, data, child) {
                                            return CupertinoTextField(
                                              controller: searchController,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              autofocus: false,
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                              decoration: Skin.inputDecoration(
                                                  transparent: true),
                                              style: Skin.dropdownTitleTextStyle(
                                                  linned: true),
                                              placeholder: data.type <= 3
                                                  ? 'Favoritos'
                                                  : 'Mis cuentas bancarias',
                                              placeholderStyle:
                                                  Skin.dropdownTitleTextStyle(
                                                      linned: true),
                                              readOnly: false,
                                              enabled: true,
                                              onChanged: (String text) =>
                                                  search(text),
                                            );
                                          })),
                                          InkWell(
                                              onTap: () => toggleList(),
                                              child: Icon(
                                                showList
                                                    ? Icons.expand_less
                                                    : Icons.expand_more,
                                                color: Colors.white,
                                              )),
                                        ])),
                                        SizedBox(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Consumer<DataProvider>(
                                            builder: (context, data, child) {
                                          return InkWell(
                                              onTap: () => data.type <= 2
                                                  ? debugPrint(
                                                      'here insert an a contact')
                                                  : data.type == 3
                                                      ? showRegisterWalletModal(
                                                          context)
                                                      : showRegisterAccountModal(
                                                          context),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 5),
                                                  child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 190,
                                                    child: Text(
                                                        data.type <= 2
                                                            ? 'Registrar nuevo contacto'
                                                            : data.type == 3
                                                                ? 'Registrar nueva billetera'
                                                                : 'Registrar nueva cuenta bancaria',
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                        style: Skin
                                                            .textButtonTextStyle(
                                                                register: true)),
                                                  )));
                                        }),
                                        Row(children: [
                                          InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Icon(
                                                      Icons.qr_code_scanner,
                                                      color:
                                                          Tint.blue.accent10))),
                                          InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Icon(Icons.paste,
                                                      color: Tint.blue.accent10)))
                                        ])
                                      ]),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: Row(children: [
                                    Text(
                                      'Monto',
                                      style: Skin.blackTextStyle(amount: true),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: CupertinoTextField(
                                          controller: controller,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            autofocus: false,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            decoration: Skin.inputDecoration(),
                                            style:
                                                Skin.inputTextStyle(amount: true),
                                            placeholder: '0.00000000',
                                            readOnly: false,
                                            enabled: true,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r"[0-9.]"))
                                            ],
                                            onChanged: (String text) {},
                                            suffix: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                    context
                                                        .watch<DataProvider>()
                                                        .token
                                                        .symbol,
                                                    style: Skin.inputTextStyle(
                                                        amount: true)))))
                                  ]),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text('Comisión',
                                                    style: Skin.blackTextStyle(
                                                        comission: true)),
                                                Text('Monto final',
                                                    style: Skin.blackTextStyle(
                                                        comission: true))
                                              ]),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text('00000.0000',
                                                  style: Skin.blackTextStyle(
                                                      comission: true)),
                                              Text('000.0000',
                                                  style: Skin.blackTextStyle(
                                                      comission: true))
                                            ]),
                                      ]),
                                ),

                                Positioned(
                              top: 38,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 70,
                                child: SizeAnimatedWidget(
                                    enabled: showList,
                                    duration: const Duration(milliseconds: 150),
                                    values: [
                                      Size(MediaQuery.of(context).size.width - 84,
                                          0),
                                      Size(MediaQuery.of(context).size.width - 84,
                                          150)
                                    ],
                                    curve: Curves.linear,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5), 
                                            child: Container(
                                                width: 300,
                                                height: 150,
                                                decoration:
                                                    Skin.dropdownBodyDecoration(),
                                                child: Consumer<DataProvider>(
                                                    builder: (context, data, child) =>
                                                        ListView.separated(
                                                            separatorBuilder:
                                                                (context, i) => Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 1,
                                                                    color: Tint
                                                                        .gray
                                                                        .accent1),
                                                            padding: EdgeInsets.zero,
                                                            itemCount: data.type <= 2
                                                                ? context.watch<DataProvider>().contacs.length
                                                                : data.type == 3
                                                                    ? context.watch<DataProvider>().wallets.length
                                                                    : context.watch<DataProvider>().accounts.length,
                                                            itemBuilder: (context, index) => TextButton(
                                                                // style     : Skin.buttonCleanStyle(),
                                                                onPressed: () {
                                                                  data.type <= 2
                                                                      ? context
                                                                          .read<
                                                                              DataProvider>()
                                                                          .changeContact(context.read<DataProvider>().contacs[
                                                                              index])
                                                                      : data.type ==
                                                                              3
                                                                          ? context
                                                                              .read<
                                                                                  DataProvider>()
                                                                              .changeWallet(context.read<DataProvider>().wallets[
                                                                                  index])
                                                                          : context
                                                                              .read<DataProvider>()
                                                                              .changeAccount(context.read<DataProvider>().accounts[index]);
                                                                  setState(() {
                                                                    showList =
                                                                        false;
                                                                    showSearch =
                                                                        false;
                                                                  });
                                                                },
                                                                child: data.type <= 2
                                                                    ? ItemContactWidget(contact: context.watch<DataProvider>().contacs[index])
                                                                    : data.type == 3
                                                                        ? ItemWalletWidget(wallet: context.watch<DataProvider>().wallets[index])
                                                                        : ItemAccountWidget(account: context.watch<DataProvider>().accounts[index])))))))),
                              )),
                    // ------------------------------------------------------------------------------------------

                Positioned(
                            top: 38,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 120,
                              child: SizeAnimatedWidget(
                                  enabled: showList,
                                  duration: const Duration(milliseconds: 150),
                                  values: [
                                    Size(MediaQuery.of(context).size.width - 84,
                                        0),
                                    Size(MediaQuery.of(context).size.width - 84,
                                        150)
                                  ],
                                  curve: Curves.linear,
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                              width: 300,
                                              height: 150,
                                              decoration:
                                                  Skin.dropdownBodyDecoration(),
                                              child: Consumer<DataProvider>(
                                                  builder: (context, data, child) =>
                                                      ListView.separated(
                                                          separatorBuilder:
                                                              (context, i) => Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 1,
                                                                  color: Tint
                                                                      .gray
                                                                      .accent1),
                                                          padding: EdgeInsets.zero,
                                                          itemCount: data.type <= 2
                                                              ? context.watch<DataProvider>().contacs.length
                                                              : data.type == 3
                                                                  ? context.watch<DataProvider>().wallets.length
                                                                  : context.watch<DataProvider>().accounts.length,
                                                          itemBuilder: (context, index) => TextButton(
                                                              // style     : Skin.buttonCleanStyle(),
                                                              onPressed: () {
                                                                data.type <= 2
                                                                    ? context
                                                                        .read<
                                                                            DataProvider>()
                                                                        .changeContact(context.read<DataProvider>().contacs[
                                                                            index])
                                                                    : data.type ==
                                                                            3
                                                                        ? context
                                                                            .read<
                                                                                DataProvider>()
                                                                            .changeWallet(context.read<DataProvider>().wallets[
                                                                                index])
                                                                        : context
                                                                            .read<DataProvider>()
                                                                            .changeAccount(context.read<DataProvider>().accounts[index]);
                                                                setState(() {
                                                                  showList =
                                                                      false;
                                                                  showSearch =
                                                                      false;
                                                                });
                                                              },
                                                              child: data.type <= 2
                                                                  ? ItemContactWidget(contact: context.watch<DataProvider>().contacs[index])
                                                                  : data.type == 3
                                                                      ? ItemWalletWidget(wallet: context.watch<DataProvider>().wallets[index])
                                                                      : ItemAccountWidget(account: context.watch<DataProvider>().accounts[index])))))))),
                            )),
                        //------------------------------------------------------------------ SEARCH ITEM
                        Positioned(
                            top: 38,
                            child: SizeAnimatedWidget(
                                enabled: showSearch,
                                duration: const Duration(milliseconds: 150),
                                values: [
                                  Size(MediaQuery.of(context).size.width - 60,
                                      0),
                                  Size(MediaQuery.of(context).size.width - 60,
                                      50)
                                ],
                                curve: Curves.linear,
                                child: Consumer<DataProvider>(
                                    builder: (context, data, child) {
                                  return ListView(
                                      padding: EdgeInsets.zero,
                                      children: [
                                        SizedBox(
                                            width: 300,
                                            height: 50,
                                            child: InkWell(
                                                onTap: () {
                                                  data.type <= 2
                                                      ? context
                                                          .read<DataProvider>()
                                                          .changeContact(context
                                                              .read<
                                                                  DataProvider>()
                                                              .searchContact)
                                                      : data.type == 3
                                                          ? context
                                                              .read<
                                                                  DataProvider>()
                                                              .changeWallet(context
                                                                  .read<
                                                                      DataProvider>()
                                                                  .searchWallet)
                                                          : context
                                                              .read<
                                                                  DataProvider>()
                                                              .changeAccount(context
                                                                  .read<
                                                                      DataProvider>()
                                                                  .searchAccount);
                                                  setState(() {
                                                    showList = false;
                                                    showSearch = false;
                                                  });
                                                },
                                                child: data.type <= 2
                                                    ? ItemContactWidget(
                                                        contact: context
                                                            .watch<
                                                                DataProvider>()
                                                            .searchContact)
                                                    : data.type == 3
                                                        ? ItemWalletWidget(
                                                            wallet: context
                                                                .watch<
                                                                    DataProvider>()
                                                                .searchWallet)
                                                        : ItemAccountWidget(
                                                            account: context
                                                                .watch<
                                                                    DataProvider>()
                                                                .searchAccount)))
                                      ]);
                                }))),
                        //------------------------------------------------------------------ NEXT BUTTON
                        Positioned(
                            width: MediaQuery.of(context).size.width - 120,
                            bottom: 0,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () => controller.text==''||controller.text=='.' ? controller.text="0.0" : showPinPage(),
                                      //Routes.pinPage(
                                      //    context: context,
                                      //    process: Process.login),
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          decoration: Skin.buttonDecoration(),
                                          child: Text('SIGUIENTE',
                                              style:
                                                  Skin.textButtonTextStyle())))
                                ])),
                        //------------------------------------------------------------------------------
                        // Positioned(
                        //     top: 5,
                        //     right: 0,
                        //     child: SizedBox(
                        //       height: 30,
                        //       width: 30,
                        //       child: IconButton(
                        //         key: key_pos,
                        //         padding: EdgeInsets.zero,
                        //         icon: const Icon(
                        //           Icons.info_outline,
                        //           color: Color(0xFF2DD8E3),
                        //         ),
                        //         onPressed: () {
                        //           context.read<DataProvider>().contacs.isNotEmpty
                        //               ? showDialog(
                        //                   barrierColor: const Color(0x33FFFFFF),
                        //                   context: context,
                        //                   builder: (_) => TextDialogIfTrue(key_pos: key_pos),
                        //                 )
                        //               : showDialog(
                        //                   barrierColor: const Color(0x33FFFFFF),
                        //                   context: context,
                        //                   builder: (_) => const TextDialog(),
                        //                 );
                        //         },
                        //       ),
                        //     )),

                    ]),
              ),
            ),
    
            const SizedBox(
              height: 20,
            ),
            //----------------------------------------------------------------- CHANGE TYPE CONTAINER
          //  TranslationAnimatedWidget(
          //      curve: Curves.easeOut,
          //      enabled: true,
          //      values: const [
          //        Offset(0, 100),
          //        Offset(0, -100),
          //        Offset(0, 0),
          //      ],
          //      child: Column(
          //        mainAxisSize: MainAxisSize.min,
          //        children: [
          //          const TabsWidget(),
          //          Container(
          //              margin: const EdgeInsets.only(
          //                  left: 20, right: 20, bottom: 30),
          //              padding: const EdgeInsets.all(20),
          //              decoration: Skin.floatingContainerDecoration(),
          //              height: 260,
          //              width: MediaQuery.of(context).size.width,
          //              child: Stack(children: [
          //                //-------------------------------------------------- COLUM OF AMOUNT INFORMATION
          //                Column(
          //                    mainAxisSize: MainAxisSize.min,
          //                    crossAxisAlignment: CrossAxisAlignment.start,
          //                    children: [
          //                      Container(
          //                          padding: const EdgeInsets.only(
          //                              right: 20, left: 20, top: 5, bottom: 5),
          //                          decoration:
          //                              Skin.dropdownBoxHeaderDecoration(),
          //                          //alignment: Alignment.topLeft,
          //                          width:
          //                              MediaQuery.of(context).size.width - 120,
          //                          child: Row(
          //                              mainAxisAlignment:
          //                                  MainAxisAlignment.spaceBetween,
          //                              crossAxisAlignment:
          //                                  CrossAxisAlignment.start,
          //                              children: [
          //                                Expanded(child: Consumer<DataProvider>(
          //                                    builder: (context, data, child) {
          //                                  return CupertinoTextField(
          //                                    controller: searchController,
          //                                    padding: const EdgeInsets.symmetric(
          //                                        horizontal: 5, vertical: 5),
          //                                    autofocus: false,
          //                                    maxLines: 1,
          //                                    textAlign: TextAlign.left,
          //                                    decoration: Skin.inputDecoration(
          //                                        transparent: true),
          //                                    style: Skin.dropdownTitleTextStyle(
          //                                        linned: true),
          //                                    placeholder: data.type <= 3
          //                                        ? 'Favoritos'
          //                                        : 'Mis cuentas bancarias',
          //                                    placeholderStyle:
          //                                        Skin.dropdownTitleTextStyle(
          //                                            linned: true),
          //                                    readOnly: false,
          //                                    enabled: true,
          //                                    onChanged: (String text) =>
          //                                        search(text),
          //                                  );
          //                                })),
          //                                InkWell(
          //                                    onTap: () => toggleList(),
          //                                    child: Icon(
          //                                      showList
          //                                          ? Icons.expand_less
          //                                          : Icons.expand_more,
          //                                      color: Colors.white,
          //                                    )),
          //                              ])),
          //                      SizedBox(
          //                        width: MediaQuery.of(context).size.width - 120,
          //                        child: Row(
          //                            mainAxisAlignment:
          //                                MainAxisAlignment.spaceBetween,
          //                            children: [
          //                              Consumer<DataProvider>(
          //                                  builder: (context, data, child) {
          //                                return InkWell(
          //                                    onTap: () => data.type <= 2
          //                                        ? debugPrint(
          //                                            'here insert an a contact')
          //                                        : data.type == 3
          //                                            ? showRegisterWalletModal(
          //                                                context)
          //                                            : showRegisterAccountModal(
          //                                                context),
          //                                    child: Padding(
          //                                        padding:
          //                                            const EdgeInsets.symmetric(
          //                                                vertical: 5),
          //                                        child: SizedBox(
          //                        width: MediaQuery.of(context).size.width - 190,
          //                                          child: Text(
          //                                              data.type <= 2
          //                                                  ? 'Registrar nuevo contacto'
          //                                                  : data.type == 3
          //                                                      ? 'Registrar nueva billetera'
          //                                                      : 'Registrar nueva cuenta bancaria',
          //                                                      overflow: TextOverflow.ellipsis,
          //                                                      maxLines: 1,
          //                                              style: Skin
          //                                                  .textButtonTextStyle(
          //                                                      register: true)),
          //                                        )));
          //                              }),
          //                              Row(children: [
          //                                InkWell(
          //                                    onTap: () {},
          //                                    child: Padding(
          //                                        padding:
          //                                            const EdgeInsets.all(5),
          //                                        child: Icon(
          //                                            Icons.qr_code_scanner,
          //                                            color:
          //                                                Tint.blue.accent10))),
          //                                InkWell(
          //                                    onTap: () {},
          //                                    child: Padding(
          //                                        padding:
          //                                            const EdgeInsets.all(5),
          //                                        child: Icon(Icons.paste,
          //                                            color: Tint.blue.accent10)))
          //                              ])
          //                            ]),
          //                      ),
          //                      const SizedBox(height: 20),
          //                      SizedBox(
          //                        width: MediaQuery.of(context).size.width - 120,
          //                        child: Row(children: [
          //                          Text(
          //                            'Monto',
          //                            style: Skin.blackTextStyle(amount: true),
          //                          ),
          //                          const SizedBox(width: 20),
          //                          Expanded(
          //                              child: CupertinoTextField(
          //                                controller: controller,
          //                                  padding: const EdgeInsets.symmetric(
          //                                      horizontal: 5, vertical: 5),
          //                                  autofocus: false,
          //                                  maxLines: 1,
          //                                  textAlign: TextAlign.right,
          //                                  decoration: Skin.inputDecoration(),
          //                                  style:
          //                                      Skin.inputTextStyle(amount: true),
          //                                  placeholder: '0.00000000',
          //                                  readOnly: false,
          //                                  enabled: true,
          //                                  keyboardType: TextInputType.number,
          //                                  inputFormatters: [
          //                                    FilteringTextInputFormatter.allow(
          //                                        RegExp(r"[0-9.]"))
          //                                  ],
          //                                  onChanged: (String text) {},
          //                                  suffix: Padding(
          //                                      padding: const EdgeInsets.only(
          //                                          right: 10),
          //                                      child: Text(
          //                                          context
          //                                              .watch<DataProvider>()
          //                                              .token
          //                                              .symbol,
          //                                          style: Skin.inputTextStyle(
          //                                              amount: true)))))
          //                        ]),
          //                      ),
          //                      const SizedBox(height: 5),
          //                      SizedBox(
          //                        width: MediaQuery.of(context).size.width - 120,
          //                        child: Row(
          //                            mainAxisAlignment: MainAxisAlignment.end,
          //                            children: [
          //                              Padding(
          //                                padding:
          //                                    const EdgeInsets.only(right: 5),
          //                                child: Column(
          //                                    crossAxisAlignment:
          //                                        CrossAxisAlignment.end,
          //                                    children: [
          //                                      Text('Comisión',
          //                                          style: Skin.blackTextStyle(
          //                                              comission: true)),
          //                                      Text('Monto final',
          //                                          style: Skin.blackTextStyle(
          //                                              comission: true))
          //                                    ]),
          //                              ),
          //                              Column(
          //                                  crossAxisAlignment:
          //                                      CrossAxisAlignment.end,
          //                                  children: [
          //                                    Text('00000.0000',
          //                                        style: Skin.blackTextStyle(
          //                                            comission: true)),
          //                                    Text('000.0000',
          //                                        style: Skin.blackTextStyle(
          //                                            comission: true))
          //                                  ]),
          //                            ]),
          //                      ),
          //                    ],
          //                    ),
          //                //------------------------------------------------------------- MENU OF ELEMENTS
          //                Positioned(
          //                    top: 38,
          //                    child: SizedBox(
          //                      width: MediaQuery.of(context).size.width - 120,
          //                      child: SizeAnimatedWidget(
          //                          enabled: showList,
          //                          duration: const Duration(milliseconds: 150),
          //                          values: [
          //                            Size(MediaQuery.of(context).size.width - 84,
          //                                0),
          //                            Size(MediaQuery.of(context).size.width - 84,
          //                                150)
          //                          ],
          //                          curve: Curves.linear,
          //                          child: ClipRRect(
          //                              borderRadius: const BorderRadius.all(
          //                                  Radius.circular(8)),
          //                              child: BackdropFilter(
          //                                  filter: ImageFilter.blur(
          //                                      sigmaX: 5, sigmaY: 5),
          //                                  child: Container(
          //                                      width: 300,
          //                                      height: 150,
          //                                      decoration:
          //                                          Skin.dropdownBodyDecoration(),
          //                                      child: Consumer<DataProvider>(
          //                                          builder: (context, data, child) =>
          //                                              ListView.separated(
          //                                                  separatorBuilder:
          //                                                      (context, i) => Container(
          //                                                          width: double
          //                                                              .infinity,
          //                                                          height: 1,
          //                                                          color: Tint
          //                                                              .gray
          //                                                              .accent1),
          //                                                  padding: EdgeInsets.zero,
          //                                                  itemCount: data.type <= 2
          //                                                      ? context.watch<DataProvider>().contacs.length
          //                                                      : data.type == 3
          //                                                          ? context.watch<DataProvider>().wallets.length
          //                                                          : context.watch<DataProvider>().accounts.length,
          //                                                  itemBuilder: (context, index) => TextButton(
          //                                                      // style     : Skin.buttonCleanStyle(),
          //                                                      onPressed: () {
          //                                                        data.type <= 2
          //                                                            ? context
          //                                                                .read<
          //                                                                    DataProvider>()
          //                                                                .changeContact(context.read<DataProvider>().contacs[
          //                                                                    index])
          //                                                            : data.type ==
          //                                                                    3
          //                                                                ? context
          //                                                                    .read<
          //                                                                        DataProvider>()
          //                                                                    .changeWallet(context.read<DataProvider>().wallets[
          //                                                                        index])
          //                                                                : context
          //                                                                    .read<DataProvider>()
          //                                                                    .changeAccount(context.read<DataProvider>().accounts[index]);
          //                                                        setState(() {
          //                                                          showList =
          //                                                              false;
          //                                                          showSearch =
          //                                                              false;
          //                                                        });
          //                                                      },
          //                                                      child: data.type <= 2
          //                                                          ? ItemContactWidget(contact: context.watch<DataProvider>().contacs[index])
          //                                                          : data.type == 3
          //                                                              ? ItemWalletWidget(wallet: context.watch<DataProvider>().wallets[index])
          //                                                              : ItemAccountWidget(account: context.watch<DataProvider>().accounts[index])))))))),
          //                    )),
          //                //------------------------------------------------------------------ SEARCH ITEM
          //                Positioned(
          //                    top: 38,
          //                    child: SizeAnimatedWidget(
          //                        enabled: showSearch,
          //                        duration: const Duration(milliseconds: 150),
          //                        values: [
          //                          Size(MediaQuery.of(context).size.width - 60,
          //                              0),
          //                          Size(MediaQuery.of(context).size.width - 60,
          //                              50)
          //                        ],
          //                        curve: Curves.linear,
          //                        child: Consumer<DataProvider>(
          //                            builder: (context, data, child) {
          //                          return ListView(
          //                              padding: EdgeInsets.zero,
          //                              children: [
          //                                SizedBox(
          //                                    width: 300,
          //                                    height: 50,
          //                                    child: InkWell(
          //                                        onTap: () {
          //                                          data.type <= 2
          //                                              ? context
          //                                                  .read<DataProvider>()
          //                                                  .changeContact(context
          //                                                      .read<
          //                                                          DataProvider>()
          //                                                      .searchContact)
          //                                              : data.type == 3
          //                                                  ? context
          //                                                      .read<
          //                                                          DataProvider>()
          //                                                      .changeWallet(context
          //                                                          .read<
          //                                                              DataProvider>()
          //                                                          .searchWallet)
          //                                                  : context
          //                                                      .read<
          //                                                          DataProvider>()
          //                                                      .changeAccount(context
          //                                                          .read<
          //                                                              DataProvider>()
          //                                                          .searchAccount);
          //                                          setState(() {
          //                                            showList = false;
          //                                            showSearch = false;
          //                                          });
          //                                        },
          //                                        child: data.type <= 2
          //                                            ? ItemContactWidget(
          //                                                contact: context
          //                                                    .watch<
          //                                                        DataProvider>()
          //                                                    .searchContact)
          //                                            : data.type == 3
          //                                                ? ItemWalletWidget(
          //                                                    wallet: context
          //                                                        .watch<
          //                                                            DataProvider>()
          //                                                        .searchWallet)
          //                                                : ItemAccountWidget(
          //                                                    account: context
          //                                                        .watch<
          //                                                            DataProvider>()
          //                                                        .searchAccount)))
          //                              ]);
          //                        }))),
          //                //------------------------------------------------------------------ NEXT BUTTON
          //                Positioned(
          //                    width: MediaQuery.of(context).size.width - 120,
          //                    bottom: 0,
          //                    child: Row(
          //                        mainAxisAlignment: MainAxisAlignment.center,
          //                        children: [
          //                          InkWell(
          //                              onTap: () => controller.text==''||controller.text=='.' ? controller.text="0.0" : showPinPage(),
          //                              //Routes.pinPage(
          //                              //    context: context,
          //                              //    process: Process.login),
          //                              child: Container(
          //                                  padding: const EdgeInsets.symmetric(
          //                                      horizontal: 20, vertical: 5),
          //                                  decoration: Skin.buttonDecoration(),
          //                                  child: Text('SIGUIENTE',
          //                                      style:
          //                                          Skin.textButtonTextStyle())))
          //                        ])),
          //                //------------------------------------------------------------------------------
    
          //                Positioned(
          //                    top: 5,
          //                    right: 0,
          //                    child: SizedBox(
          //                      height: 30,
          //                      width: 30,
          //                      child: IconButton(
          //                        key: key_pos,
          //                        padding: EdgeInsets.zero,
          //                        icon: const Icon(
          //                          Icons.info_outline,
          //                          color: Color(0xFF2DD8E3),
          //                        ),
          //                        onPressed: () {
          //                          context.read<DataProvider>().contacs.isNotEmpty
          //                              ? showDialog(
          //                                  barrierColor: const Color(0x33FFFFFF),
          //                                  context: context,
          //                                  builder: (_) => TextDialogIfTrue(key_pos: key_pos),
          //                                )
          //                              : showDialog(
          //                                  barrierColor: const Color(0x33FFFFFF),
          //                                  context: context,
          //                                  builder: (_) => const TextDialog(),
          //                                );
          //                        },
          //                      ),
          //                    )),
          //              ])),
          //        ],
          //      ))
          ]),
        ),
      ),
    );
  }

  showPinPage() {
    // ignore: todo
    // TODO: ADD AUTH AND VIDEO FUNCTIONS
    debugPrint("show pin");
    if (double.parse(controller.text) <=
        context.read<MenuProvider>().bounds[0]) {
      Routes.home(context);
      // ignore: todo
      // TODO: ADD THE TRANSACTION OPERATION HERE, DO THE SAME IN EACH CASE...
      debugPrint("sin confirmar");
    } else if (double.parse(controller.text) <=
        context.read<MenuProvider>().bounds[1]) {
      focus();
      //showDialog(
      //  context: context,
      //  builder: (_) => Dialog(
      //    backgroundColor: Color(0x66C1C1C1),
      //    elevation: 0,
      //    child: PinBoardWidget(
      //        process : Process.check,
      //        pages   : Pages.warning,
      //      ),
      //  ),
      //  barrierColor: const Color(0x33FFFFFF),
      //);
      Routes.pinPage(context: context, process: Process.check);
    } else if (double.parse(controller.text) <=
        context.read<MenuProvider>().bounds[2]) {
      debugPrint("object");
      //Routes.pinPage(context: context, process: Process.login);
    } else {
      debugPrint("llamada");
    }
  }

  focus() =>
      FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null;

  toggleList() => setState(() {
        focus();
        showList = !showList;
        searchController.clear();
        showSearch = false;
      });

  search(String text) {
    String upperSearch = text.toUpperCase();
    int type = context.read<DataProvider>().type;
    int index = 0;

    if (text.isNotEmpty) {
      index = type <= 2
          ? context.read<DataProvider>().contacs.indexWhere(
              (element) => element.name.toUpperCase().startsWith(upperSearch))
          : type == 3
              ? context.read<DataProvider>().wallets.indexWhere((element) =>
                  element.name.toUpperCase().startsWith(upperSearch))
              : context.read<DataProvider>().accounts.indexWhere((element) =>
                  element.name.toUpperCase().startsWith(upperSearch));

      type <= 2
          ? context.read<DataProvider>().setSearchContact(
              context.read<DataProvider>().contacs[index == -1 ? 0 : index])
          : type == 3
              ? context.read<DataProvider>().setSearchWallet(
                  context.read<DataProvider>().wallets[index == -1 ? 0 : index])
              : context.read<DataProvider>().setSearchAccount(context
                  .read<DataProvider>()
                  .accounts[index == -1 ? 0 : index]);

      setState(() {
        showList = false;
        showSearch = true;
      });
    } else {
      setState(() {
        showList = false;
        showSearch = false;
      });
    }
  }
}

class TextDialog extends StatelessWidget {
  const TextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //gestureDetector
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          width: 275,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0x330C4F83), width: 2.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "No cuentas con\nFAVORITOS",
                style: TextStyle(
                  color: Color(0xFF0A5F93),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0A5F93),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '¡Pero descuida! Recuerda que puedes buscar a un ',
                        //style: TextStyle(fontSize: 20,),
                      ),
                      TextSpan(
                          text: 'contacto 9780 Bank ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text:
                            'dando doble click a la palabra FAVORITOS, colocando el nombre  y verificando su DNI',
                        //style: TextStyle(fontSize: 20,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextDialogIfTrue extends StatefulWidget {
  GlobalKey key_pos;
  TextDialogIfTrue({required this.key_pos, Key? key}) : super(key: key);

  @override
  State<TextDialogIfTrue> createState() => _TextDialogIfTrueState();
}

class _TextDialogIfTrueState extends State<TextDialogIfTrue> {
  @override
  Widget build(BuildContext context) {
    RenderBox box =
        widget.key_pos.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    double x = position.dx;
    double h = MediaQuery.of(context).size.height * 0.5;
    double w = MediaQuery.of(context).size.width * 0.5;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Dialog(
        //alignment: Alignment(MediaQuery.of(context).size.width*0.0025, ((y-(MediaQuery.of(context).size.height*0.5))/(MediaQuery.of(context).size.height*0.5))-0.15),
        alignment: Alignment(
            //((x-w)/w)+280/w,
            ((x - w) / w) + 30 / w,
            ((y - h) / h) + 115 / h),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: 115,
          width: 140,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('lib/assets/img/TextBaloon.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              "\n\nPara buscar a un nuevo\ncontacto solo da doble\nclick sobre “Favoritos” y\nescribe el nombre",
              style: TextStyle(fontSize: 11, color: Color(0xFF0A5F93)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

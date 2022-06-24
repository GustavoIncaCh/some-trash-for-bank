import 'dart:async';
import 'dart:ui';

import 'package:bank9780/modules/general/enum.dart';
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/services/api/call/locals.dart';
import 'package:bank9780/services/api/call/publicity.dart';
import 'package:bank9780/services/api/call/terms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../modules/provider/client_provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  StreamController<bool> loading = StreamController<bool>();
  List<int> list = [1, 2, 3, 4, 5];
  @override
  void initState() {
    loading.close();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Stack(children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  height: size.height,
                  //aspectRatio: 13 / 9,
                ),
                //items: list
                //    .map((item) => Container(
                //          child: Center(child: Text(item.toString())),
                //          color: Colors.green,
                //        ))
                //    .toList(),
                items: context.watch<DataProvider>().publicity!.data.map((item) =>
                  Center(
                    child  :
                    Image.network(
                      item.url,
                      fit    : BoxFit.cover,
                      height : size.height,
                    )
                  )
                ).toList(),
              ),
              // --------------------------------- Upper Switch
              const _CountrySwitcher(),
              // --------------------------------- Upper Switch
              Align(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () => loadLocals(),
                        child: Container(
                            width: size.width * 0.7,
                            height: 35,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: Skin.buttonDecoration(),
                            child: StreamBuilder(
                              stream: loading.stream,
                              builder: (context, AsyncSnapshot snapshot) =>
                                  !(snapshot.connectionState ==
                                          ConnectionState.active)
                                      ? Text('createAccount'.tr(),
                                          style: Skin.textButtonTextStyle())
                                      : const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                          onTap: () {
                            print("idDevice"+context.read<ClientProvider>().idDevice.toString());
                            print("idUser"+context.read<ClientProvider>().idUser.toString());
                            print("token"+context.read<ClientProvider>().token.toString());
                            //print(context.read<ClientProvider>().firstRegisterJson!.idUser!);
                            //print(context.read<ClientProvider>().firstRegisterJson!.token!);
                            print("----------------------------------------------------------------------");
                            debugPrint("names  "+context.read<ClientProvider>().clientRegister!.names);
                            debugPrint("surnames  "+context.read<ClientProvider>().clientRegister!.surnames);
                            debugPrint("idTypeDocument  "+context.read<ClientProvider>().clientRegister!.idTypeDocument.toString());
                            debugPrint("numDocument  "+context.read<ClientProvider>().clientRegister!.numDocument);
                            debugPrint("dateBirth  "+context.read<ClientProvider>().clientRegister!.dateBirth);
                            debugPrint("address  "+context.read<ClientProvider>().clientRegister!.address);
                            debugPrint("email  "+context.read<ClientProvider>().clientRegister!.email);
                            debugPrint("codRefer  "+context.read<ClientProvider>().clientRegister!.codRefer);
//                            debugPrint("fatherRefer  "+context.read<ClientProvider>().clientRegister!.fatherRefer);
                            //debugPrint("isoCountry  "+context.read<ClientProvider>().clientRegister!.isoCountry);
                            debugPrint("pin  "+context.read<ClientProvider>().clientRegister!.pin);
                            debugPrint("idDepartament  "+context.read<ClientProvider>().clientRegister!.idDepartament);
                            debugPrint("idProvince  "+context.read<ClientProvider>().clientRegister!.idProvince);
                            debugPrint("prefixPhone  "+context.read<ClientProvider>().clientRegister!.prefixPhone);
                            debugPrint("phone  "+context.read<ClientProvider>().clientRegister!.phone);
                            debugPrint("isoLanguage  "+context.read<ClientProvider>().clientRegister!.isoLanguage.toString());
                            Routes.pinPageLogin(context: context, process: Process.login);
                            debugPrint(context.read<ClientProvider>().clientRegister!.pin);},
                          //onTap: () => showPinOverlay(context, process: Process.login, pages: Pages.none),
                          // Routes.pinPage(context: context, process: Process.login),
                          child: Container(
                              width: size.width * 0.7,
                              height: 35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: Skin.buttonDecoration(),
                              child: Text('loggin'.tr(),
                                  style: Skin.textButtonTextStyle()))),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: InkWell(
                            //onTap: () => Routes.tutorial(context),
                            onTap: () => Routes.visitor(context),
                            child: Container(
                                alignment: Alignment.center,
                                width: size.width * 0.7,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text('visitLoggin'.tr(),
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              blurRadius: 3)
                                        ])))),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(size.width * 0.7, 35),
                              textStyle: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 3)
                                  ]),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              Routes.webview(context);
                            },
                            child: Text('moreInfo'.tr())))
                  ],
                ),
                alignment: Alignment.bottomCenter,
              ),
            ]),
          ),
        ));
  }

  loadLocals() async {
    loading = StreamController<bool>();
    loading.add(true);

    await RegisteringInformation.getDepartments(context);
    await RegisteringInformation.getProvinces(context);
    await RegisteringInformation.getDocumnetTypes(context);
    await Terms.getTerms(context);
    //await RegisteringInformation.getTerms(context);
    // ignore: todo
    /// TODO: clients added to the panel section
    // ignore: todo
    /// TODO: it must call the clients by the app section in "crear cuenta"
    /// look for 'services/api/call' clients, agencies n' locals
    // ignore: todo
    /// TODO: uncoment the Clients.postClient and the coments inside the class Clients
    /// it should call the API and register the user
    //await Clients.postClient(context);
    //await Agencies.getAgencies(context);

    Future.delayed(const Duration(milliseconds: 500), () {
      loading.close();
      Routes.register(context);
    });
  }
}

class _CountrySwitcher extends StatefulWidget {
  const _CountrySwitcher({Key? key}) : super(key: key);

  @override
  __CountrySwitcherState createState() => __CountrySwitcherState();
}

class __CountrySwitcherState extends State<_CountrySwitcher> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: SizedBox(
                height: 30,
                width: 180,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                            child: _FlagItem(peru: true, status: status),
                            onTap: () async {
                              setState(() => status = true);
                              context.read<DataProvider>().changeLocales(
                                  context: context,
                                  country: Countries.pe,
                                  language: Languages.es);
                              await Publicity.getPublicity(context);
                            })),
                    Expanded(
                        child: InkWell(
                            child: _FlagItem(peru: false, status: !status),
                            onTap: () async {
                              setState(() => status = false);
                              context.read<DataProvider>().changeLocales(
                                  context: context,
                                  country: Countries.br,
                                  language: Languages.pt);
                              await Publicity.getPublicity(context);
                            }))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class _FlagItem extends StatelessWidget {
  final bool peru;
  final bool status;
  const _FlagItem({required this.peru, required this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: Skin.flagSwitchDecoration(peru: peru, active: status),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Offstage(
                offstage: !peru,
                child: Image.asset("lib/assets/img/flags/peru.png")),
            Expanded(
                child: Center(
                    child: Text(peru ? 'Perú' : 'brazil',
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: Colors.white,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 3)
                            ])))),
            Offstage(
                offstage: peru,
                child: Image.asset("lib/assets/img/flags/brazil.png")),
          ],
        ));
  }
}

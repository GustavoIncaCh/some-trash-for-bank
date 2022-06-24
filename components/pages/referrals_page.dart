import 'dart:ui';

import 'package:bank9780/assets/data_list/list_referral_record.dart';
import 'package:bank9780/components/pages/waiting_page.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/modals/referral_record_modal.dart';
import 'package:bank9780/modules/general/button_class.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ReferralsPage extends StatefulWidget {
  const ReferralsPage({Key? key}) : super(key: key);

  @override
  State<ReferralsPage> createState() => _ReferralsPageState();
}

class _ReferralsPageState extends State<ReferralsPage> {
  List<String> headerList = ['Fecha:', 'Ganancia:', 'Estado:'];

  late List<ReferralRecordItem> referralItems;
  @override
  void initState() {
    super.initState();
    referralItems = allReferalRecord;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          appBarName: " REFERIDOS",
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿CÓMO FUNCIONA?',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF0A5F93)),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.info_outline_rounded,
                          color: Color(0xFF2DD8E3),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => const ImageDialog(),
                            barrierColor: const Color(0x33FFFFFF),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'data',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'CÓDIGO',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Color(0xFF154579),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.content_copy_rounded,
                                color: Color(0xFF154579),
                              ))
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'data',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'LINK',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Color(0xFF154579),
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.content_copy_rounded,
                              color: Color(0xFF154579),
                            ),
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Acumulado:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    child: const Text(
                      'COBRAR',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(),
                        barrierColor: const Color(0x33FFFFFF),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 16,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        textStyle: const TextStyle(
                            decoration: TextDecoration.none, fontSize: 16),
                        primary: const Color(0xFF0A557A),
                      ),
                      child: const Text(
                        'Ver historial cobros',
                      ),
                      onPressed: () {
                        Routes.referralsRec(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Divider(
                    color: Color(0xff154579),
                    height: 5,
                    thickness: 2.5,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: referralItems.length,
                  /// here we have the index of the list, we can acces
                  /// the list of coins here
                  itemBuilder: (context, index) {
                    final referral = referralItems[index];

                    /// Here we call the function to create
                    /// the box of the coinItem, we must call
                    /// the item from the list of CoinItems
                    /// CoinItems is located in "list_porfolio.dart"
                    return ReferralRecord(
                        context: context, referralRecord: referral);
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        decoration: TextDecoration.none, fontSize: 16),
                    primary: const Color(0xFF0A557A),
                  ),
                  child: const Text(
                    'Ver Historial de Referidos',
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    Routes.referralsRec(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        //alignment: Alignment(0.65, -0.4),
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.zero,
            width: 355,
            height: 355,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('lib/assets/img/Alert2.png'),
                fit: BoxFit.contain,
                //alignment: Alignment(-0.5, -0.5),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 70,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '1) Recomienda: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Comparte tu\ncódigo con tus referidos y\ncuando ellos creen su cuenta,\nestará vinculada a la tuya y\nrecibirás los beneficios del\nPrograma de Referidos.'),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '2) Comisiona: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Gana desde \n\$ 0.00 hasta \$ 0.00 dólares en\nBitcoin por cada compra.'),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '3) Cobra: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Solicita el pago en\nBitcoin de tus ganancias\ncuando acumules \$0.00 o más. '),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  const AlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        child: Container(
          height: 225,
          width: 300,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0x330A5F93),
              width: 2.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                //height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  "¿Esta seguro\nUd. de realizar\nesta operación?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff0A5F93),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1A477C),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: const Text(
                  'ACEPTAR',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  //int i = 0;
                  //context.read<MenuProvider>().switchHelp(switchItem: historyItems);
                  //Navigator.of(context).popUntil((route) => i++ >= 1);
                  //Routes.aboutus(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const WaitingPage(),
                    ),
                  );
                },
              ),
              OutlinedButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                      primary: const Color(0xFF1A477C)),
                  //onPressed: onClicked,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pop();
                    //count = 0;
                  },
                  child: const Text(
                    'CANCELAR',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
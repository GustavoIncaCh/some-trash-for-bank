import 'package:bank9780/components/pages/agencies_page.dart';
import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/modals/bound_modal.dart';

class BoundsPage extends StatefulWidget {
  const BoundsPage({Key? key}) : super(key: key);

  @override
  State<BoundsPage> createState() => _BoundsPageState();
}

class _BoundsPageState extends State<BoundsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(appBarName: "LÍMITES"),
        //body: SizedBox(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text("ENVÍOS Y PAGOS",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: const Text("CAPAS DE SEGURIDAD",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        )),
                  ),
                  BoundBox(
                    name: "SIN SEGURIDAD",
                    amount: 1000,
                    colorGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF00B4D8),
                        Color(0x6300B4D8),
                      ],
                    ),
                    borderColor: const Color(0xFF00B4D8),
                    index: 0,
                  ),
                  BoundBox(
                    name: "PIN",
                    amount: 1000,
                    colorGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0096C7),
                        Color(0x7D0096C7),
                      ],
                    ),
                    borderColor: const Color(0xBF0096C7),
                    index: 1,
                  ),
                  BoundBox(
                    name: "PIN + AUTHENTICATOR",
                    amount: 1000,
                    colorGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0077B6),
                        Color(0xCF0077B6),
                      ],
                    ),
                    borderColor: const Color(0xFF0077B6),
                    index: 2,
                  ),
                  BoundBox(
                    name: "PIN +  VIDEOLLAMADA",
                    amount: 1000,
                    colorGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0A5F93),
                        Color(0xCF0A5F93),
                      ],
                    ),
                    borderColor: const Color(0xFF0A5F93),
                    index: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.error_outline,
                                color: Color(0xFF2DD8E3),
                                size: 18,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          TextButton(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Cambiar a Plan Ilimitado',
                                  style: TextStyle(
                                      color: Color(0xFF0A557A),
                                      fontSize: 13,
                                      decoration: TextDecoration.underline),
                                ),
                                Text(
                                  "¡ Es gratuito !",
                                  style: TextStyle(
                                      color: Color(0xFF0A557A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            onPressed: () {
                              //Routes.agencies(context);
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const AgenciesPage(),
                                  settings:
                                      const RouteSettings(name: '/agencies'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        height: 35,
                        child: CupertinoTextField(
                          placeholder: 'Código Tienda',
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF0A5F93)),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'ACEPTAR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF1A477C),
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                    ),
                  ),
                  OutlinedButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                          primary: const Color(0xFF1A477C)),
                      onPressed: () {
                        //routes.tutorial(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANCELAR',
                      )),
                ],
              ),
            )
          ],
        ));
  }
}

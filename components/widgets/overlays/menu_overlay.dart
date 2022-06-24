import 'dart:ui';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:bank9780/components/pages/welcome_page.dart';
import 'package:bank9780/modules/provider/user_provider.dart';

import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/api/call/terms.dart';

Future<void> showMenuOverlay(BuildContext context) async {
  List<int> index = [
    0, // 'PORTAFOLIO',
    1, // 'HISTORIALES',
    2, // 'MIS CUENTAS BANCARIAS',
    3, // 'FAVORITOS',
    4, // 'CONFIGURACIÓN',
    5, // 'CONTACTO',
    6, // 'MIS AGENCIAS',
    7, // 'PROGRAMA DE REFERIDOS',
    8, // 'TUTORIALES',
    9, // 'ABOUT US',
    10, // 'TÉRMINOS Y CONDICIONES',
    11, // 'CERRAR SESIÓN',
  ];
  List<String> items = [
    'PORTAFOLIO',
    'HISTORIALES',
    'MIS CUENTAS BANCARIAS',
    'FAVORITOS',
    'CONFIGURACIÓN',
    'CONTACTO',
    'MIS AGENCIAS',
    'PROGRAMA DE REFERIDOS',
    'TUTORIALES',
    'ABOUT US',
    'TÉRMINOS Y CONDICIONES',
    'CERRAR SESIÓN',
  ];
  showGeneralDialog(
    barrierLabel       : 'Security PIN',
    barrierDismissible : true,
    barrierColor       : Colors.white.withOpacity(0.2),
    transitionDuration : const Duration(milliseconds: 150),
    context            : context,
    pageBuilder        : (_, __, ___) {
      return GestureDetector(
        onTap       : () => {},// routes.hide(context),
        onLongPress : () => {},
        child:
        SafeArea(
          child:
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child:
            BackdropFilter(
              filter : ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child  :
              Stack(
                children: [
                  Positioned(
                    top   : 6,
                    right : 6,
                    child :
                    Material(
                      color : Colors.transparent,
                      child :
                      SizeAnimatedWidget(
                        enabled  : true,
                        duration : const Duration(milliseconds: 150),
                        values   : const [Size(300, 0),  Size(300, 480)],
                        curve    : Curves.linear,
                        child    :
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          child:
                          BackdropFilter(
                            filter : ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                            child  :
                            Container(
                              padding    : const EdgeInsets.only(bottom: 10),
                              decoration : Skin.menuDecoration(),
                              child      :
                              ListView(
                                physics  : const BouncingScrollPhysics(),
                                padding  : EdgeInsets.zero,
                                children : [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 2),
                                        child:
                                        Column(
                                          crossAxisAlignment : CrossAxisAlignment.start,
                                          mainAxisAlignment  : MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(context.watch<UserProvider>().user.name.split(' ').first,
                                              style: Skin.menuNameTextStyle(),
                                            ),
                                            // const SizedBox(height: 5),
                                            Text(context.watch<UserProvider>().user.name.replaceFirst(
                                              context.watch<UserProvider>().user.name.split(' ').first + ' ',
                                              ''),
                                              style: Skin.menuNameTextStyle(subname: true),
                                            )
                                          ]
                                        )
                                      ),
                                      InkWell(
                                        onTap : () => Routes.hide(context),
                                        child :
                                        Container(
                                          margin: const EdgeInsets.only(top: 3, right: 2),
                                          width     : 40,
                                          height    : 40,
                                          alignment : Alignment.center,
                                          decoration: Skin.circularButtonDecoration(footer: true),
                                          child:
                                          ClipRRect(
                                            borderRadius : const BorderRadius.all(Radius.circular(26)),
                                            //child        : Image.asset('lib/assets/img/photo.png'),
                                            child        : Image.asset('lib/assets/logos/dataphoto1.png'),
                                          )
                                        )
                                        // const Icon(Icons.menu_outlined, color: Color(0xFF154579), size: 30)
                                      )
                                    ]
                                  ),
                                  // const SizedBox(height: 20),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children    : index.map((e) =>
                                      InkWell(
                                        onTap : () async {
                                          Routes.hide(context);
                                          switch (e){
                                            // ignore: todo
                                            // TODO: back must pass the values properly
                                            //case 0: 
                                            //await AllCryptos.getAllCryptos(context)
                                            //? Future.delayed(
                                            //  const Duration(milliseconds: 500),
                                            //  ()=>Routes.portfolio(context)
                                            //  ):null;
                                            // break;
                                            case 0: Routes.portfolio(context); break;
                                            case 1: Routes.record(context); break;
                                            case 2: Routes.useraccount(context); break;
                                            // add condition
                                            case 3: Routes.favorites(context); break;
                                            case 4: Routes.config(context); break;
                                            case 5: Routes.help(context); break;
                                            // ignore: todo
                                            /// TODO: async and future actions added
                                            /// its calling the info from the api "check done"
                                            /// call the Agencies.getAgencies in another place
                                            //case 6: 
                                            //await Agencies.getAgencies(context)
                                            //? Future.delayed(
                                            //  const Duration(seconds: 1),
                                            //     () => Routes.agencies(context)
                                            //   )
                                            //   : null; break;
                                            case 6: Routes.agencies(context); break;
                                            case 7: Routes.referrals(context); break;
                                            case 8: Routes.tutorial(context); break;
                                            case 9: Routes.aboutus(context); break;
                                            case 10: 
                                            await Terms.getTerms(context)
                                            ? Future.delayed(
                                              const Duration(milliseconds: 500),
                                                 () => Routes.terms(context)
                                               )
                                               : null; break;
                                            //case 10: Routes.terms(context); break;
                                            //case 11: Routes.record(context); break;
                                            //case 11: await Publicity.getPublicity(context)
                                            //? Future.delayed(
                                            //  const Duration(seconds: 1),
                                            //     () => Routes.welcome(context)
                                            //   )
                                            //   : null; break;
                                            //case 11: Routes.welcome(context);
                                            case 11:
                                            // use in case BlackScreen pop
                                            //
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute<void>(builder: (BuildContext context) => const WelcomePage()),
                                              ModalRoute.withName('/welcome'));
                                            break;
                                          }
                                        },
                                        child :
                                          Container(
                                            width      : 280,
                                            margin     : const EdgeInsets.all(5),
                                            padding    : const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                            decoration : Skin.menuItemDecoration(),
                                            child      : Text(items[e], style: Skin.menuTextStyle()),
                                          )
                                      )
                                    ).toList(),
                                  ),
                                ]
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                ],
              )
            )
          )
        )
      );
    },
  );
}

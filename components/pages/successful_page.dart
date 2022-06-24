

import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';

class SuccessfulPage extends StatefulWidget {

  ///  Successful transactions information page
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const SuccessfulPage({ Key? key }) : super(key: key);

  @override
  _SuccessfulPageState createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Flexible(
            child:
            Container(
              // width     : MediaQuery.of(context).size.width,
              decoration: Skin.gradientDecoration(),
              alignment : Alignment.center,
              child:
              Stack(
                children: [
                  const NavigatorWidget(
                    logo: false,
                    menu: false,
                    bell: false,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 50),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '!TRANSFERENCIA EXITOSA!',
                            style: Skin.successfulTextStyle(title: true),
                            textAlign: TextAlign.center
                          ),
                          const SizedBox(height: 30),
                          Image.asset('lib/assets/img/check.png'),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('BTC 0.', style: Skin.successfulTextStyle(amount: true)),
                              Text('12345678', style: Skin.successfulTextStyle(amount: true)),
                            ]
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'Esta transacción tomará unos 10 minutos.',
                            style: Skin.successfulTextStyle(),
                            textAlign: TextAlign.center,
                          )
                        ]
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, right: 10),
                        child :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children         : [
                            InkWell(
                              onTap : (){},
                              child :
                              Padding(
                                padding : const EdgeInsets.all(10),
                                child   : Icon(Icons.file_download_outlined, color: Tint.blue.accent10, size: 30)
                              )
                            ),
                            InkWell(
                              onTap : (){},
                              child :
                              Padding(
                                padding : const EdgeInsets.all(10),
                                child   : Icon(Icons.share_outlined, color: Tint.blue.accent10,)
                              )
                            )
                          ]
                        )
                      ),
                    ]
                  )
                ]
              )
            )
          ),
          SizedBox(
            height : 200,
            child  :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/img/logo_blue.png'),
                const SizedBox(height: 20),
                SizedBox(
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DESTINO : Juan Valdez',
                        style: Skin.successfulTextStyle(detail: true)
                      ),
                      Text('ORIGEN  : Juan Perez',
                        style: Skin.successfulTextStyle(detail: true)
                      ),
                      Text('FECHA   : 25/05/2021',
                        style: Skin.successfulTextStyle(detail: true)
                      ),
                    ]
                  )
                )
              ]
            )
          ),
        ]
      )
    );
  }
}
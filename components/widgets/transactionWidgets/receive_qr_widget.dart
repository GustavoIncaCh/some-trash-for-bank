
import 'package:bank9780/modules/provider/data_provider.dart';
import 'package:bank9780/modules/provider/user_provider.dart';
import 'package:bank9780/properties/skin.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

class ReceiveQrWidget extends StatefulWidget {

  ///  Receive QR container
  ///-----------------------------------------------------
  ///* - Made by: Neil Yesikov Cuadros miraval 👈(ﾟヮﾟ👈)
  ///  - email: 9780desarrollador09@gmail.com
  ///  - Date : 02/12/2021
  const ReceiveQrWidget({ Key? key }) : super(key: key);

  @override
  _ReceiveQrWidgetState createState() => _ReceiveQrWidgetState();
}

class _ReceiveQrWidgetState extends State<ReceiveQrWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, data, child) =>
      Center(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child:
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data.type == 1 || data.type == 2
                  ? Text(context.watch<UserProvider>().user.name, style: Skin.blackTextStyle(qrName: true))
                  : const SizedBox.shrink(),
                  data.type == 1 || data.type == 2?
                    const SizedBox(width: 10):
                    const SizedBox.shrink(),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: data.type == 1 || data.type == 2? 0 : 40),
                      child:
                      Text(data.type == 1 || data.type == 2? 'DNI: ' + context.watch<UserProvider>().user.document : data.token.address,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: Skin.blackTextStyle(qrDocument: true)
                      )
                    )
                ]
              )
            ),
            PrettyQr(
              image             : const AssetImage('lib/assets/img/logo_gray.png'),
              data              :
                data.type == 1 ? context.watch<UserProvider>().user.document:
                data.type == 2 ? data.token.address:
                                  'FIAT   INTERNAL',
              typeNumber        : 2,
              // ignore: todo
              // TODO: size of the QR
              size              : MediaQuery.of(context).size.width * 0.4,
              errorCorrectLevel : QrErrorCorrectLevel.M,
            ),
            SizedBox(
              width : MediaQuery.of(context).size.width * 0.55,
              child :
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children         : [
                  InkWell(
                    onTap : (){},
                    child :
                    const Padding(
                      padding : EdgeInsets.all(10),
                      child   : Icon(Icons.content_copy, color: Color(0xFF0A557A), size: 20)
                    )
                  ),
                  InkWell(
                    onTap : (){},
                    child :
                    const Padding(
                      padding : EdgeInsets.only(left: 10),
                      child   : Icon(Icons.share_outlined, color: Color(0xFF0A557A), size: 20)
                    )
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
}
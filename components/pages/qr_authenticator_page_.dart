import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class QrAuthenticatorPage extends StatelessWidget {
  const QrAuthenticatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.transparent,
        //body: SizedBox(
          appBar: const MyAppBar(appBarName: "AUTHENTICATOR"),
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //height: MediaQuery.of(context).size.height * 0.9,
      //width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '''Instala Google Authenthicator en tu telefono móvil desde Google play o App Store.


Escanea el código QR desde la aplicación de google Authenticator.


Si no puede escanear el código QR, ingrese la clave manualmente en la aplicación google authenticator.''',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Clave Secreta',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.help_outline_rounded)),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'data',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.copy_rounded))
            ],
          ),
          //Image.asset('name')
          ElevatedButton(
            child: const Text(
              'SIGUIENTE',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              //Routes.registration2(context);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF1A477C),
              padding: const EdgeInsets.symmetric(horizontal: 50),
            ),
          ),
        ],
      ),
    ),);
  }
}
import 'dart:ui';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //body: SizedBox(
      appBar: const MyAppBar(appBarName: "HUELLA DIGITAL"),
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                'Activa tu huella digital para que ingreses a nuestra APP'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.fingerprint,
                  size: 70,
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      "ACTIVAR HUELLA",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 10),
                    // agrear el flutterSwitch
                    FlutterSwitch(
                      value: status,
                      showOnOff: true,
                      activeText: "SI",
                      inactiveText: "NO",
                      activeColor: Colors.green,
                      inactiveColor: Colors.green,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            if (status)
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF1A477C),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text(
                    'ACTIVAR HUELLA DIGITAL',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () async {
                    final isAuthenticated =
                        await LocalAuthApi.authenticateBio();

                    if (isAuthenticated) {
                      Routes.fingerprintterms(context);
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => const ImageDialog(),
                          barrierColor: Colors.transparent);
                    }
                  }),
            if (!status)
              const SizedBox(
                height: 48,
              ),
            OutlinedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                  primary: const Color(0xFF1A477C)),
              child: const Text('CANCELAR'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Center(
              child: Text(
                  "Podrás deshabilitar esta opción desde\nMenú>Configuración> seguridad."),
            )
          ],
        ),
      ),
    );
  }
}

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticateBio() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        androidAuthStrings: const AndroidAuthMessages(
            biometricHint: "Verifique su identidad",
            signInTitle: "HUELLA DIGITAL PARA INICIO DE SESIÓN",
            cancelButton: "CANCELAR"),
        localizedReason:
            'Coloque su huella digital ahora en la parte del lector de su celular.',
        useErrorDialogs: true,
        biometricOnly: true,
        stickyAuth: true,
      );
    } on PlatformException {
      return false;
    }
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 205,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0x330C4F83), width: 2.5),
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 150,
                child: Text(
                  "Huella digital para 9780 BANK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0A5F93),
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.fingerprint,
                        color: Color(0xFF699BF7), size: 50),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Confirma tu huella digital en el lector de tu teléfono  para ingresar",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

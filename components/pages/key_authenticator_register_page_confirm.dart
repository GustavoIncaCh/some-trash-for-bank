import 'dart:async';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/components/widgets/push_notification_widget.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../modules/provider/operation_provider.dart';
import '../../services/api/call/login.dart';

class KeyAuthenticatorRegisterPageConfirm extends StatefulWidget {
  const KeyAuthenticatorRegisterPageConfirm({Key? key}) : super(key: key);

  @override
  State<KeyAuthenticatorRegisterPageConfirm> createState() =>
      _KeyAuthenticatorRegisterPageConfirmState();
}

class _KeyAuthenticatorRegisterPageConfirmState
    extends State<KeyAuthenticatorRegisterPageConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          appBarName: "REGISTRO",
          isInside: false,
        ),
        //body: SizedBox(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const KeyAuthenticator(),
              ],
            ),
          ),
        ));
  }
}

class KeyAuthenticator extends StatefulWidget {
  const KeyAuthenticator({Key? key}) : super(key: key);

  @override
  State<KeyAuthenticator> createState() => _KeyAuthenticatorState();
}

class _KeyAuthenticatorState extends State<KeyAuthenticator> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage("lib/assets/img/register_security.png")),
            const Text(
              "Como paso final, te estaremos conectando con una asesora comercial para darte la bienvenida a la familia 9780.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            const Text(
              "“ RECUERDA QUE ESTE PASO ES\nOBLIGATORIO Y ES POR TU\nSEGURIDAD“",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0A5F93),
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.watch_later_outlined,
                    color: Color(0xFF154579),
                  ),
                  onPressed: () {},
                ),
                const Text(
                  "Te tomará 1 minuto",
                  style: TextStyle(color: Color(0xFF0C4F83)),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  height: 40,
                  child: TextButton(
                    onPressed: () async {
                      //formKey.currentState!.validate();
                      //// conditions for validating
                      //if (currentText.length != 6 || currentText != "123456") {
                      //  errorController!.add(ErrorAnimationType
                      //      .shake); // Triggering error shake animation
                      //  setState(() => hasError = true);
                      //} else {
                      //  setState(
                      //    () {
                      //      hasError = false;
                      //      snackBar("Código verificado");
                      //      Routes.waitingPage(context);
                      //    },
                      //  );
                      //}
                      // todo: isnt working
                      showPushNotificationWidget(
                        message:
                            "¡Recuerde que tiene que realizar la llamada, para finalizar su registro!",
                        order: 1,
                        title: "9780 BANK 13/10/21",
                      );
                      await Login.getLogin(context)
            ? Future.delayed(
              const Duration(milliseconds: 1000),
              (){
                context.read<OperationProvider>().getLoginData(loginData: parseJwt(context.read<OperationProvider>().login!.token.toString()));
                Routes.home(context);}):null;
                    },
                    child: Center(
                      child: Text(
                        "ACEPTAR".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C4F83),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: OutlinedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        primary: const Color(0xFF1A477C)),
                    onPressed: () {
                      //routes.tutorial(context);
                    },
                    child: const Text('CANCELAR'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:bank9780/components/widgets/app_bar_widget.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:bank9780/services/api/call/security_code.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../modules/provider/client_provider.dart';
// ignore: implementation_imports

class KeyAuthenticatorRegisterPage extends StatefulWidget {
  const KeyAuthenticatorRegisterPage({Key? key}) : super(key: key);

  @override
  State<KeyAuthenticatorRegisterPage> createState() =>
      _KeyAuthenticatorRegisterPageState();
}

class _KeyAuthenticatorRegisterPageState
    extends State<KeyAuthenticatorRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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

  final String _code = "";
  String signature = "{{ app signature }}";

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

    SmsAutoFill().unregisterListener();
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
            const Text(
              'CÓDIGO DE SEGURIDAD',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              //"asd",
              "Se enviará un código al ${context.read<ClientProvider>().clientRegister!.phone.toString().replaceRange(0, 9, '*******')}",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const Text(
              "INGRESE CÓDIGO DE SEGURIDAD",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const Image(
                image: AssetImage("lib/assets/img/register_security.png")),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        textStyle: const TextStyle(color: Colors.white),
                        // obscuringCharacter: '*',
                        // obscuringWidget: const FlutterLogo(
                        //   size: 24,
                        // ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.scale,
                        validator: (v) {
                          if (v!.length < 5) {
                            return "Caracteres Incompletos";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 45,
                            fieldWidth: 35,
                            activeFillColor: const Color(0xFF0C4F83),
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.black,
                            inactiveColor: const Color(0xFF0C4F83)),
                        cursorColor: Colors.green,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completado");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Texto copiado al portapapeles $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    hasError ? "*Ingrese el código enviado a su celular" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const Text("Tienes 01:00 minutos para ingresar tu código"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.replay_outlined,
                    color: Color(0xFF154579),
                  ),
                  onPressed: () {
                    print(context
                        .read<ClientProvider>()
                        .firstRegisterJson!
                        .idDevice!);
                    print(context
                        .read<ClientProvider>()
                        .firstRegisterJson!
                        .idUser!);
                    print(context
                        .read<ClientProvider>()
                        .firstRegisterJson!
                        .token!);
                    print('-------------------------------------------------');
                    print("idDevice " +
                        context.read<ClientProvider>().idDevice.toString());
                    print("idUser " +
                        context.read<ClientProvider>().idUser.toString());
                    print("token  " +
                        context.read<ClientProvider>().token.toString());
                  },
                ),
                const Text(
                  "Enviar nuevo código",
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
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            //hasError = false;
                            //snackBar("Código verificado");
                            if (currentText.length != 6) {
                              errorController!.add(ErrorAnimationType
                                  .shake); // Triggering error shake animation
                              setState(() => hasError = true);
                            } else {
                              context.read<ClientProvider>().changeSecurityCode(
                                  securityCode: int.parse(currentText));
                              setState(
                                () {
                                  hasError = false;
                                  snackBar("Código verificado");
                                  //Routes.keyAuthRegisterConfirm(context);
                                  //todo: uncomend this
                                  Routes.dnifrontcap(context);
                                  
                                  //Routes.waitingVideoCallPage(context);
                                  ValidateSecurityCode.getValidateSecurityCode(
                                      context);
                                  //Routes.videocallwebview(context);
                                },
                              );
                            }
                            debugPrint(context
                                .read<ClientProvider>()
                                .firstRegisterJson!
                                .message);
                            debugPrint(context
                                .read<ClientProvider>()
                                .firstRegisterJson!
                                .idUser);
                            debugPrint(context
                                .read<ClientProvider>()
                                .firstRegisterJson!
                                .token);
                            debugPrint(context
                                .read<ClientProvider>()
                                .firstRegisterJson!
                                .idDevice);
                          },
                        );
                      }
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
                          //fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        primary: const Color(0xFF1A477C)),
                    onPressed: () {
                      //routes.tutorial(context);
                      Navigator.pop(context);
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

class CodeAutoFillTestPage extends StatefulWidget {
  @override
  _CodeAutoFillTestPageState createState() => _CodeAutoFillTestPageState();
}

class _CodeAutoFillTestPageState extends State<CodeAutoFillTestPage>
    with CodeAutoFill {
  String? appSignature;
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return const Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

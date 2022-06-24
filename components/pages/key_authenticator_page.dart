import 'dart:async';

import 'package:bank9780/components/widgets/navigator_widget.dart';
import 'package:bank9780/properties/routes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:sms_autofill/sms_autofill.dart';

class KeyAuthenticatorPage extends StatelessWidget {
  const KeyAuthenticatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        //body: SizedBox(
        body: SafeArea(
            child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            color: Colors.white,
            child: Column(children: const [
              // Container(
              //   color: const Color(0xFF154579),
              //   height : MediaQuery.of(context).size.height * 0.1,
              //   width  : MediaQuery.of(context).size.width,
              //   child  :
              NavigatorWidget(
                  body: true,
                  logo: false,
                  text: 'INGRESAR',
                  bell: false,
                  menu: false),
              //),
              Expanded(child: KeyAuthenticator())
            ]),
          ),
        )));
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
            const Text(
                'Por favor anote la siguiente clave en un lugar seguro. Con esta clave usted podrá recuperar su Google authenticator en caso pierda o cambie su celular.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.assignment_outlined,
                  size: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Clave Secreta',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('data')
                  ],
                )
              ],
            ),
            const Text(
                'Introduce tu código de verificación desde la aplicación de google authenticator.'),
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
                    hasError
                        ? "*Ingrese el codigo enviado de Google Authenticator"
                        : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6 || currentText != "123456") {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            hasError = false;
                            snackBar("Código verificado");
                            Routes.waitingPage(context);
                          },
                        );
                      }
                    },
                    child: Center(
                        child: Text("ACEPTAR".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
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
                        child: const Text('CANCELAR'))),
              ],
            ),
          ],
        ),
      ),
    );
  }

// ------------------------------------------------------------------------

  //String _code="";
  //String signature = "{{ app signature }}";
//
  //@override
  //Widget build(BuildContext context) {
  //  return MaterialApp(
  //    theme: ThemeData.light(),
  //    home: Scaffold(
  //      appBar: AppBar(
  //        title: const Text('Plugin example app'),
  //      ),
  //      body: Padding(
  //        padding: const EdgeInsets.all(8.0),
  //        child: Column(
  //          mainAxisSize: MainAxisSize.max,
  //          mainAxisAlignment: MainAxisAlignment.center,
  //          crossAxisAlignment: CrossAxisAlignment.stretch,
  //          children: <Widget>[
  //            PhoneFieldHint(),
  //            Spacer(),
  //            PinFieldAutoFill(
  //              decoration: UnderlineDecoration(
  //                textStyle: TextStyle(fontSize: 20, color: Colors.black),
  //                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
  //              ),
  //              currentCode: _code,
  //              onCodeSubmitted: (code) {},
  //              onCodeChanged: (code) {
  //                if (code!.length == 6) {
  //                  FocusScope.of(context).requestFocus(FocusNode());
  //                }
  //              },
  //            ),
  //            Spacer(),
  //            TextFieldPinAutoFill(
  //              currentCode: _code,
  //            ),
  //            Spacer(),
  //            ElevatedButton(
  //              child: Text('Listen for sms code'),
  //              onPressed: () async {
  //                await SmsAutoFill().listenForCode;
  //              },
  //            ),
  //            ElevatedButton(
  //              child: Text('Set code to 123456'),
  //              onPressed: () async {
  //                setState(() {
  //                  _code = '123456';
  //                });
  //              },
  //            ),
  //            SizedBox(height: 8.0),
  //            Divider(height: 1.0),
  //            SizedBox(height: 4.0),
  //            Text("App Signature : $signature"),
  //            SizedBox(height: 4.0),
  //            ElevatedButton(
  //              child: Text('Get app signature'),
  //              onPressed: () async {
  //                signature = await SmsAutoFill().getAppSignature;
  //                setState(() {});
  //              },
  //            ),
  //            ElevatedButton(
  //              onPressed: () {
  //                Navigator.of(context).push(MaterialPageRoute(builder: (_) => CodeAutoFillTestPage()));
  //              },
  //              child: Text("Test CodeAutoFill mixin"),
  //            )
  //          ],
  //        ),
  //      ),
  //    ),
  //  );
  //}
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
